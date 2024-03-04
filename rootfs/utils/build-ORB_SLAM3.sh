apt update && apt-get install python3-rosdep

cd ~/rootfs/src
git clone https://github.com/stevenlovegrove/Pangolin.git
cd Pangolin
cmake -B build
make -C build install -j
cd ../
git clone https://github.com/UZ-SLAMLab/ORB_SLAM3.git ORB_SLAM3
cd ORB_SLAM3
git apply ~/rootfs/utils/ViewerAR.patch
sed -i -e 's/c++11/c++14/g' CMakeLists.txt
sed -i -e 's/OpenCV 4.4/OpenCV/g' CMakeLists.txt
./build.sh
source /opt/ros/noetic/setup.bash
rosdep init && rosdep update
export ROS_PACKAGE_PATH=${ROS_PACKAGE_PATH}:`pwd`/Examples_old/ROS/
cd Examples_old/ROS/ORB_SLAM3/
sed -i -e 's/c++11/c++14/g' CMakeLists.txt
sed -i -e 's/OpenCV 3.0/OpenCV/g' CMakeLists.txt
sed -i '49i ${PROJECT_SOURCE_DIR}/../../../Thirdparty/Sophus' CMakeLists.txt
sed -i '31i #include "../../../include/Converter.h"' src/AR/ros_mono_ar.cc
#sed -i '152d' src/AR/ros_mono_ar.cc
sed -i '152s/mpSLAM/ORB_SLAM3::Converter::toCvMat(mpSLAM/g' src/AR/ros_mono_ar.cc
sed -i '152s/);/).matrix());/g' src/AR/ros_mono_ar.cc
cmake -B build
make -C build -j

