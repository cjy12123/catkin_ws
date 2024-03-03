#include <std_msgs/Float64.h>
#include <ros/ros.h>
#include <geometry_msgs/TwistStamped.h>
#include <geometry_msgs/Twist.h>
#include <mavros_msgs/PositionTarget.h>
#include <f450_control/flag.h>
std_msgs::Float64 volocity_Z;
std_msgs::Float64 volocity_Y;
std_msgs::Float64 angular_Z;

mavros_msgs::PositionTarget f450_volocity_angular;
void f450_volocity_Z_callback(const std_msgs::Float64::ConstPtr& msg)
{
    f450_volocity_angular.velocity.z = (*msg).data;
}

void f450_volocity_Y_callback(const std_msgs::Float64::ConstPtr& msg)
{
    f450_volocity_angular.velocity.y = (*msg).data;
}

void f450_angular_Z_callback(const std_msgs::Float64::ConstPtr& msg)
{
    f450_volocity_angular.yaw_rate= (*msg).data;
}

void f450_volocity_X_callback(const std_msgs::Float64::ConstPtr& msg)
{
    f450_volocity_angular.velocity.x = (*msg).data;
}
f450_control::flag current_flag;//pid使能标志位
void flag_sub_callback(const f450_control::flag::ConstPtr& msg)
{
    current_flag = *msg;
    switch (current_flag.flag)
        {
        case 0/* 定高 */:
        case 1 :
            f450_volocity_angular.type_mask=mavros_msgs::PositionTarget::IGNORE_PX|
                                            mavros_msgs::PositionTarget::IGNORE_PY|
                                            mavros_msgs::PositionTarget::IGNORE_PZ|
                                            mavros_msgs::PositionTarget::IGNORE_AFX|
                                            mavros_msgs::PositionTarget::IGNORE_AFY|
                                            mavros_msgs::PositionTarget::IGNORE_AFZ|
                                            mavros_msgs::PositionTarget::IGNORE_YAW|
                                            mavros_msgs::PositionTarget::IGNORE_YAW_RATE;;
            break;
        case 2 :
            f450_volocity_angular.type_mask=mavros_msgs::PositionTarget::IGNORE_PX|
                                            mavros_msgs::PositionTarget::IGNORE_PY|
                                            mavros_msgs::PositionTarget::IGNORE_PZ|
                                            mavros_msgs::PositionTarget::IGNORE_AFX|
                                            mavros_msgs::PositionTarget::IGNORE_AFY|
                                            mavros_msgs::PositionTarget::IGNORE_AFZ|
                                            mavros_msgs::PositionTarget::IGNORE_YAW;
            break;
        default:
            break;
        }
}
int main(int argc, char **argv)
{
    ros::init(argc, argv, "f450_exec_control_node");
    ros::NodeHandle nh;

    ros::Subscriber f450_volocity_Z_sub = nh.subscribe<std_msgs::Float64>
        ("f450_exec_control/volocity_Z",1,f450_volocity_Z_callback);
    ros::Subscriber f450_volocity_Y_sub = nh.subscribe<std_msgs::Float64>
        ("f450_exec_control/volocity_Y",1,f450_volocity_Y_callback);
    ros::Subscriber f450_angular_Z_sub = nh.subscribe<std_msgs::Float64>
        ("f450_exec_control/angular_Z",1,f450_angular_Z_callback);
    ros::Subscriber f450_volocity_X_sub = nh.subscribe<std_msgs::Float64>
        ("f450_exec_control/volocity_X",1,f450_volocity_X_callback);
    ros::Subscriber flag_sub = nh.subscribe<f450_control::flag>
        ("/f450_control/flag",10,flag_sub_callback);//使能标志位话题
    ros::Publisher f450_volocity_angular_pub = nh.advertise<mavros_msgs::PositionTarget>
        ("/mavros/setpoint_raw/local",10);
    ros::Rate rate(50);
    f450_volocity_angular.coordinate_frame=mavros_msgs::PositionTarget::FRAME_BODY_NED;
    f450_volocity_angular.type_mask=
                                    mavros_msgs::PositionTarget::IGNORE_PX|
                                    mavros_msgs::PositionTarget::IGNORE_PY|
                                    mavros_msgs::PositionTarget::IGNORE_PZ|
                                    mavros_msgs::PositionTarget::IGNORE_AFX|
                                    mavros_msgs::PositionTarget::IGNORE_AFY|
                                    mavros_msgs::PositionTarget::IGNORE_AFZ|
                                    mavros_msgs::PositionTarget::IGNORE_YAW|
                                    mavros_msgs::PositionTarget::IGNORE_YAW_RATE;
    while(ros::ok())
    {
        ros::spinOnce();
        
        f450_volocity_angular_pub.publish(f450_volocity_angular);
    }
}