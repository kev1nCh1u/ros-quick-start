#!/bin/bash
# Program:
#       This program start agricultural_vehicles
# History:
# 2020/11/12	kevin	First release

echo -e "\033[32m
##############################
# ros agricultural_vehicles  #
# by Kevin Chiu 2020         #
##############################
\033[0m"
ws_path="/home/user/catkin_ws" # 路徑
echo -e "ws_path:" $ws_path "\n" # 列印路徑
cd $ws_path
source devel/setup.bash


###########
# 分頁視窗 #
###########
# gnome-terminal --tab -t "分頁名稱" -- bash -ic "指令"
gnome-terminal --tab -t "hector_slam_launch" -- bash -ic "cd $ws_path;source devel/setup.bash;roslaunch hector_slam_launch tutorial.launch"
sleep 0.2
gnome-terminal --tab -t "joystick" -- bash -ic "cd $ws_path;source devel/setup.bash;rosrun JoyStick joystick /dev/input/js0"
sleep 0.2
gnome-terminal --tab -t "move_robot" -- bash -ic "cd $ws_path;source devel/setup.bash;rosrun move_robot move_robot /dev/ttyACM0 38400"
sleep 0.2
gnome-terminal --tab -t "r2000_node" -- bash -ic "cd $ws_path;source devel/setup.bash;rosrun pepperl_fuchs_r2000 r2000_node \"192.168.10.100\""
sleep 0.2
gnome-terminal --tab -t "AnhungControl" -- bash -ic "cd $ws_path;source devel/setup.bash;rosrun AnhungControl AnhungControl \"192.168.72.224\" 9930"
sleep 0.2

exec bash
