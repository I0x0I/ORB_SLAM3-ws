# curl -L ws.i0x0i.hns.to|bash -s WORKSPACE
set -e
echo "Creating Folder "$1
mkdir -p $1/rootfs/src
touch $1/rootfs/src/.gitkeep
mkdir -p $1/rootfs/data
touch $1/rootfs/data/.gitkeep
echo  "!.gitkeep" > $1/.gitignore
cd $1
folder_name=${PWD##*/}
wget https://cdn.jsdelivr.net/gh/I0x0I/ORB_SLAM3-ws@main/Makefile
sed -i -e "s/ORB_SLAM3-ws/$folder_name/g" Makefile
echo "Done. \`cd" `pwd`"\`"
