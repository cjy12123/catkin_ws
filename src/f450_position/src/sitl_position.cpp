#include <ros/ros.h>
#include <tf/transform_listener.h>
#include <turtlesim/Spawn.h>
int main(int argc, char** argv) {
  ros::init(argc, argv, "drone_position");
  ros::NodeHandle nh;

  tf::TransformListener listener;

  while (ros::ok()) {
    
  }
}