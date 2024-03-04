cd ~/rootfs/src
git clone https://github.com/RainerKuemmerle/g2o.git
cd g2o
git reset --hard 4b9c2f5
git apply ~/rootfs/utils/Missing_Types-fa7d070.patch
cp -r ../ORB_SLAM3/Thirdparty/g2o/* ./
git apply ~/rootfs/utils/Register-ORB_SLAM3-Types-Save-g2o.patch
mv ../ORB_SLAM3/Thirdparty/g2o ../ORB_SLAM3/Thirdparty/g2o-orig
cd ../ORB_SLAM3
cp -r ../g2o ./Thirdparty/

