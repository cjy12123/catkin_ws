#include <ros/ros.h>
#include <geometry_msgs/TwistStamped.h>
#include <mavros_msgs/SetMode.h>
#include <mavros_msgs/State.h>
#include <geometry_msgs/Twist.h>
#include <f450_vision/box.h>
#include <f450_control/flag.h>
#include <std_msgs/Float64.h>
#include <gazebo_msgs/GetModelState.h>
#include <gazebo_msgs/ModelState.h>
namespace f450_controll
{
// Global so it can be passed from the callback fxn to main
static double control_effort = 0.0; //有关于pid，control_effort为接收传感器值的变量
static bool reverse_acting = false; //有关于pid，reverse_acting为0（false），control_effort等于传感器值，
}                                   //若为1（true）它则等于传感器值取相反数
using namespace f450_controll;

int plant_order = 1;//序号
std_msgs::Float64 velocity_angular;//速度、角速度

f450_control::flag current_flag;//pid使能标志位
void flag_sub_callback(const f450_control::flag::ConstPtr& msg)
{
    current_flag = *msg;   
}

f450_vision::box current_center;//YOLO识别方框的中心的坐标数据
void box_center_sub_callback(const f450_vision::box::ConstPtr& msg)
{
    current_center = *msg;
}

// Callback when something is published on 'control_effort'
void controlEffortCallback(const std_msgs::Float64& control_effort_input)
{
  // the stabilizing control effort
  if (reverse_acting)
  {
    control_effort = -control_effort_input.data;
  }
  else
  {
    control_effort = control_effort_input.data;
  }
}

double f450_position;

int main(int argc, char **argv)
{   
    ros::init(argc, argv, "f450_control_node");
    ros::NodeHandle nh;
    
    ros::NodeHandle node_priv("~");
    node_priv.param<int>("plant_order", plant_order, 1);//若bash文件内没有初始化则为默认值1
    node_priv.param<bool>("reverse_acting", reverse_acting, false);

    while (ros::ok() && ros::Time(0) == ros::Time::now())
    {
        ROS_INFO("waiting for time to become non-zero");
        sleep(1);
    }

    ros::Subscriber flag_sub = nh.subscribe<f450_control::flag>
            ("/f450_control/flag",10,flag_sub_callback);//使能标志位话题

    ros::Subscriber box_center_sub = nh.subscribe<f450_vision::box>
            ("/f450_vision/box",4,box_center_sub_callback);//YOLO识别方框坐标话题
    
    // ros::Subscriber drone_position_sub = nh.subscribe<gazebo_msgs::ModelState>
    //         ("/gazebo/model_states",10,drone_position_sub_callback);
    ros::ServiceClient f450_position_srv = nh.serviceClient<gazebo_msgs::GetModelState>
            ("/gazebo/get_model_state");
    gazebo_msgs::GetModelState model_message;
    model_message.request.model_name = "iris";

    ros::Publisher f450_control_publisher;
    switch (plant_order)//本文件会被f450_control.launch文件调用三次,每次会对不同方向的速度以及角速度进行pid控制
    {
        case 1:
            {f450_control_publisher = nh.advertise<std_msgs::Float64>
                ("/f450_exec_control/volocity_Z",1);//z方向速度
                ROS_INFO("set velocity_Z");
            break;}
        case 2:
            {f450_control_publisher = nh.advertise<std_msgs::Float64>
                ("/f450_exec_control/volocity_Y",1);//y方向速度
                ROS_INFO("set velocity_Y");
            break;}
        case 3:
            {f450_control_publisher = nh.advertise<std_msgs::Float64>
                ("/f450_exec_control/angular_Z",1);//z方向角速度
                ROS_INFO("set angular_Z");
            break;}
        case 4:
            {f450_control_publisher = nh.advertise<std_msgs::Float64>
                ("/f450_exec_control/volocity_X",1);//X方向速度
                ROS_INFO("set velocity_X");
            break;}
    }

    ros::Rate rate(50);

    std_msgs::Float64 f450_state;
    ros::Publisher f450_state_pub = nh.advertise<std_msgs::Float64>("state", 1);//传输传感器值/传输误差

    ros::Subscriber f450_effort_sub = nh.subscribe("control_effort", 1, controlEffortCallback);

    while(ros::ok())
    {
        ros::spinOnce();
        f450_position_srv.call(model_message);
        f450_position = sqrt(pow((4-model_message.response.pose.position.x),2)
                        +pow((model_message.response.pose.position.y),2));
        if(current_flag.flag==0){
            switch (plant_order)
            {
                case 1:
                    //state
                    {
                    f450_state.data = model_message.response.pose.position.z-1;//对应Z方向上的速度
                    break;}
                case 2:
                    {
                    f450_state.data = 0;//对应Y方向上的速度
                    break;}
                case 3:
                    {
                    f450_state.data = 0;
                    break;}
                case 4:
                    {
                    f450_state.data = 0;   
                    break;}
            }
        }
        else if(current_flag.flag==1){//是否使能pid控制
            switch (plant_order)
            {
                case 1:
                    //state
                    {
                    f450_state.data = model_message.response.pose.position.z-1;//对应Z方向上的速度
                    break;}
                case 2:
                    {
                    f450_state.data = current_center.box_center_X-0.5;//对应Y方向上的速度
                    break;}
                case 3:
                    {
                    f450_state.data = 0;
                    break;}
                case 4:
                    {
                    f450_state.data = 4-f450_position;   
                    break;}
            }
        }
        else if(current_flag.flag==2){
                switch (plant_order)
                {
                    case 1:
                        //state
                        {
                        f450_state.data = model_message.response.pose.position.z-1;//对应Z方向上的速度
                        break;}
                    case 2:
                        {
                        f450_state.data = 0.6;//对应Y方向上的速度
                        break;}
                    case 3:
                        {
                        f450_state.data = current_center.box_center_X-0.5;
                        break;}
                    case 4:
                        {
                        f450_state.data = 4-f450_position;   
                        break;}
                }
                
        } 
            velocity_angular.data = control_effort;
            f450_state_pub.publish(f450_state);
            f450_control_publisher.publish(velocity_angular); 
    }
}
