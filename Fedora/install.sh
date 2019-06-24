#!/bin/bash

#An installation script for install the tools common to a Development Machine

set -e

if id "$1" >/dev/null 2>&1; then
  echo "Installing for user: $1"
else
  echo "User does not exist."
  echo "Usage: ./install.sh user_name"
  exit 1
fi

readonly install_user="$1"

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root." 
   exit 1
fi

dnf -y update

dnf install -y firefox evince gedit nano ghex pwgen ark

dnf groupinstall -y "Development Tools"
dnf install -y gcc-c++ meld git svn mercurial wget screen cmake
dnf install -y ncurses-devel zlib-devel openssl openssl-devel mesa-libGL mesa-libGL-devel texlive-latex texlive-latex-bin boost-devel freeimage freeimage-devel glm-devel
dnf install -y "perl(Data::Dumper)" "perl(Thread::Queue)"
dnf install -y mesa-libGLES-devel mesa-libEGL-devel
dnf install -y gperftools-libs

#Install RPM fusion
dnf install -y https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install -y https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

readonly cuda_rpm="cuda-repo-fedora29-10.1.105-1.x86_64.rpm"
curl -OJ "https://developer.download.nvidia.com/compute/cuda/repos/fedora29/x86_64/$cuda_rpm"
rpm -i "$cuda_rpm"
dnf install cuda -y

readonly cudnn_tgz="cudnn-10.1-linux-x64-v7.6.0.64.tgz"
curl -OJ "https://rd-dependencies.s3.amazonaws.com/cuda/cudnn/$cudnn_tgz"
tar -xzf "$cuddn_tgz"

cp cuda/include/* /usr/local/cuda-10.1/include/.
cp cuda/lib64/* /usr/local/cuda-10.1/lib64/.

#Add me to dialout so that I can use screen with serial ports
usermod -a -G dialout "$install_user" 

su - "$install_user" -c "echo *.pro.user$'\n'*.creator.user > .gitignore"
su - "$install_user" -c "git config --global core.excludesfile ~/.gitignore"

#Graphics & office software
dnf install -y inkscape abiword kolourpaint

# TODO: export these permanently in "/home/$install_user/.bashrc"
#export PATH=/usr/local/cuda-10.1/bin${PATH:+:${PATH}}
#export LD_LIBRARY_PATH=/usr/local/cuda-10.1/lib64\
#	${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

echo "packages installed; please restart your machine to complete NVIDIA driver installation"
