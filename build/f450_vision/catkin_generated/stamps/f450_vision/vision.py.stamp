#! /usr/bin/env python
# -*- coding: utf-8 -*-
import sys,os
sys.path.append("/home/cjy/drone/mavros/catkin_ws/src/f450_vision")

import rospy
import cv2
import numpy as np
from sensor_msgs.msg import Image
from cv_bridge import CvBridge, CvBridgeError
from yolo_trt.yolo_trt import preproc, vis
from yolo_trt.yolo_trt import BaseEngine
from std_srvs.srv import SetBool, SetBoolResponse, SetBoolRequest
from std_msgs.msg import Float32MultiArray
from f450_vision.msg import box
 
class_num = 0

class Predictor(BaseEngine):
    def __init__(self, engine_path):
        super(Predictor, self).__init__(engine_path)
        self.n_classes = 1 # your model classes
        self.class_names = ['human'] # your model class names
        class_num = self.n_classes
        # self.class_names = ['empty', 'fire', 'full', 'no_fire'] # your model class name

class vision:
    def __init__(self, engine_path, conf=0.1, end2end=False):
        self.bridge=CvBridge()
        self.image_front_sub = rospy.Subscriber("/iris/usb_cam/image_raw", Image, self.image_front_callback)
        self.image_front_debug_proc_pub = rospy.Publisher("image_front_debug_proc", Image, queue_size=1)
        self.box_center_pub = rospy.Publisher("/f450_vision/box",box,queue_size=1)
        self.box_msg = box()
        self.pred = Predictor(engine_path)
        self.object = {}
        self.index = 1

        self.conf = conf
        self.end2end = end2end
        self.is_start = True
        self.vision_point = Float32MultiArray()

        for i in range(15):
            self.vision_point.data.append(0)
        self.timer = rospy.Timer(rospy.Duration(1/50), self.timer_callback)

    def timer_callback(self, event):
    #
        self.detection()

    def image_front_callback(self,data):
        try:
            self.image_front = self.bridge.imgmsg_to_cv2(data, "bgr8")
            # k = cv2.waitKey(10) & 0xff
            # cv2.imshow("img",self.image_front)
            # if k == ord('s'):  # 按下s键，进入下面的保存图片操作
            #     cv2.imwrite("/home/cjy/drone/mavros/catkin_ws/src/sitl_vision/img2/" + str(self.index) + ".jpg", self.image_front)
            #     print("save" + str(self.index) + ".jpg successfuly!")
            #     print("-------------------------")
            #     self.index += 1
        except CvBridgeError as e:
            print(e)


    def detection(self):
        if self.is_start and self.image_front is not None:
            self.image_front_debug_proc = self.image_front.copy()
            # print(self.image_front.shape)
            result, self.image_front_proc = self.pred.inference(self.image_front, conf=self.conf, end2end=self.end2end, is_return_img=True)
            # 取出result的前两类
            if result is not None:
                for i in range(2):
                    self.object[i]=[]
                for i in range(len(result)):
                    self.object[result[i][5]].append(result[i])
                for i in range(2):
                    if len(self.object[i]) > 0:
                        # print(self.object[i])
                        box_center_d = []
                        for j in range(len(self.object[i])):
                            box_center_x = (self.object[i][j][0] + self.object[i][j][2]) / 2 / self.image_front.shape[1]
                            box_center_y = (self.object[i][j][1] + self.object[i][j][3]) / 2 / self.image_front.shape[0]
                            if i == 0:
                                self.box_msg.box_center_X=box_center_x
                                self.box_msg.box_center_Y=box_center_y
                            box_center_d.append((box_center_x - 0.5)**2 + (box_center_y - 0.5)**2)
                        min_index = box_center_d.index(min(box_center_d))
                        self.object[i] = self.object[i][min_index]
                        # 可视化框
                        self.object[i] = np.expand_dims(self.object[i], axis=0)
                        self.image_front_debug_proc = vis(self.image_front_debug_proc, self.object[i][:,:4], self.object[i][:, 4], self.object[i][:, 5], conf=self.conf, class_names=self.pred.class_names)
                        # print(self.object[i][:, 4],self.object[i][:, 5])
                        # 降维
                        self.object[i]= self.object[i][0]
            self.box_center_pub.publish(self.box_msg)
            self.image_front_debug_proc_pub.publish(self.bridge.cv2_to_imgmsg(self.image_front_debug_proc, "bgr8"))

if __name__ == '__main__':
    rospy.init_node('vision')
    engine_path = os.path.dirname(os.path.dirname(os.path.abspath(__file__))) + "/model/1114-1553-person.trt"
    vision = vision(engine_path, conf=0.6)
    # rate.sleep()
    rospy.spin()