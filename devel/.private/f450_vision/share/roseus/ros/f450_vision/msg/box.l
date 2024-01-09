;; Auto-generated. Do not edit!


(when (boundp 'f450_vision::box)
  (if (not (find-package "F450_VISION"))
    (make-package "F450_VISION"))
  (shadow 'box (find-package "F450_VISION")))
(unless (find-package "F450_VISION::BOX")
  (make-package "F450_VISION::BOX"))

(in-package "ROS")
;;//! \htmlinclude box.msg.html


(defclass f450_vision::box
  :super ros::object
  :slots (_box_center_X _box_center_Y _box_center_W _box_center_H ))

(defmethod f450_vision::box
  (:init
   (&key
    ((:box_center_X __box_center_X) 0.0)
    ((:box_center_Y __box_center_Y) 0.0)
    ((:box_center_W __box_center_W) 0.0)
    ((:box_center_H __box_center_H) 0.0)
    )
   (send-super :init)
   (setq _box_center_X (float __box_center_X))
   (setq _box_center_Y (float __box_center_Y))
   (setq _box_center_W (float __box_center_W))
   (setq _box_center_H (float __box_center_H))
   self)
  (:box_center_X
   (&optional __box_center_X)
   (if __box_center_X (setq _box_center_X __box_center_X)) _box_center_X)
  (:box_center_Y
   (&optional __box_center_Y)
   (if __box_center_Y (setq _box_center_Y __box_center_Y)) _box_center_Y)
  (:box_center_W
   (&optional __box_center_W)
   (if __box_center_W (setq _box_center_W __box_center_W)) _box_center_W)
  (:box_center_H
   (&optional __box_center_H)
   (if __box_center_H (setq _box_center_H __box_center_H)) _box_center_H)
  (:serialization-length
   ()
   (+
    ;; float32 _box_center_X
    4
    ;; float32 _box_center_Y
    4
    ;; float32 _box_center_W
    4
    ;; float32 _box_center_H
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _box_center_X
       (sys::poke _box_center_X (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _box_center_Y
       (sys::poke _box_center_Y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _box_center_W
       (sys::poke _box_center_W (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _box_center_H
       (sys::poke _box_center_H (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _box_center_X
     (setq _box_center_X (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _box_center_Y
     (setq _box_center_Y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _box_center_W
     (setq _box_center_W (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _box_center_H
     (setq _box_center_H (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get f450_vision::box :md5sum-) "f1a4a641427c15bc39cb4de0679f2e54")
(setf (get f450_vision::box :datatype-) "f450_vision/box")
(setf (get f450_vision::box :definition-)
      "float32 box_center_X
float32 box_center_Y
float32 box_center_W
float32 box_center_H

")



(provide :f450_vision/box "f1a4a641427c15bc39cb4de0679f2e54")


