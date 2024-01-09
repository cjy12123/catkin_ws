#!/bin/sh
gnome-terminal -t "sitl" -x bash -c "roslaunch offboard_py start_offb.launch;exec bash"
sleep 10
gnome-terminal -t "vision" -x bash -c "rosrun f450_vision vision.py;exec bash"
sleep 2
# gnome-terminal -t "rqt" -x bash -c "rqt_image_view"
gnome-terminal -t "pid" -x bash -c "roslaunch f450_control f450_control.launch;exec bash"