#include <std_msgs/Float64.h>
#include <ros/ros.h>
#include <geometry_msgs/TwistStamped.h>
#include <geometry_msgs/Twist.h>
std_msgs::Float64 volocity_Z;
std_msgs::Float64 volocity_Y;
std_msgs::Float64 angular_Z;
geometry_msgs::Twist f450_volocity_angular;

void f450_volocity_Z_callback(const std_msgs::Float64::ConstPtr& msg)
{
    f450_volocity_angular.linear.z = (*msg).data;
}

void f450_volocity_Y_callback(const std_msgs::Float64::ConstPtr& msg)
{
    f450_volocity_angular.linear.y = (*msg).data;
}

void f450_angular_Z_callback(const std_msgs::Float64::ConstPtr& msg)
{
    f450_volocity_angular.angular.z = (*msg).data;
}

int main(int argc, char **argv)
{
    ros::init(argc, argv, "f450_exec_control_node");
    ros::NodeHandle nh;

    ros::Subscriber f450_volocity_Z_sub = nh.subscribe<std_msgs::Float64>
        ("f450_exec_control/volocitu_Z",1,f450_volocity_Z_callback);
    ros::Subscriber f450_volocity_Y_sub = nh.subscribe<std_msgs::Float64>
        ("f450_exec_control/volocitu_Y",1,f450_volocity_Y_callback);
    ros::Subscriber f450_angular_Z_sub = nh.subscribe<std_msgs::Float64>
        ("f450_exec_control/angular_Z",1,f450_angular_Z_callback);
    ros::Publisher f450_volocity_angular_pub = nh.advertise<geometry_msgs::Twist>
        ("mavros/setpoint_velocity/cmd_vel_unstamped",10);
    ros::Rate rate(50);

    while(ros::ok())
    {
        ros::spinOnce();
        f450_volocity_angular_pub.publish(f450_volocity_angular);
    }
}