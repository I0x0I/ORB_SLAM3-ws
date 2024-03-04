apt update && apt-get install python3-rosdep

cd ~/rootfs/src
git clone https://github.com/stevenlovegrove/Pangolin.git
cd Pangolin
cmake -B build
make -C build install -j
cd ../
git clone https://github.com/UZ-SLAMLab/ORB_SLAM3.git ORB_SLAM3
cd ORB_SLAM3
git apply ~/rootfs/utils/ORB_SLAM3.patch
./build.sh
source /opt/ros/noetic/setup.bash
rosdep init && rosdep update
export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:`pwd`/Examples_old/ROS/
cd Examples_old/ROS/ORB_SLAM3/
cmake -B build
make -C build -j

