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

#Install RPM fusion
dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

#Add me to dialout so that I can use screen with serial ports
usermod -a -G dialout $1

su - $1 -c "echo *.pro.user$'\n'*.creator.user > .gitignore"
su - $1 -c "git config --global core.excludesfile ~/.gitignore"


#Graphics & office software
dnf install -y inkscape abiword kolourpaint
