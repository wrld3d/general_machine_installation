## Installing Fedora
We tend to use a bootable USB drive with a pre-loaded ISO. You can then use it as your computer's boot drive, boot to a 'live' version of Fedora and then choose to install from there.

### Fedora Image
We're currently using [Fedora 29 Xfce](https://spins.fedoraproject.org/xfce/download/index.html). Unfortunately, this image seems to have disappeared with the launch of Fedora 30. 

The closest we found was this unnoficial [Fedora-Xfce-Live-x86_64-29-20181029.1.iso](https://dl.fedoraproject.org/pub/alt/unofficial/releases/29/x86_64/Fedora-Xfce-Live-x86_64-29-20181029.1.iso) version.

### Creating a bootable USB drive
To create a bootable drive from which you can install Fedora, either use the official [Fedora Image Writer](https://getfedora.org/en/workstation/download/) or do it Tom's way:
* Download the Fedora 29 ISO from the above dl.fedoraproject link 
* Plug in the pen drive
* Identify & note the id of the USB pen drive via: `ls -l /dev/disk/by-id/usb*`
* Format the USB pen drive for FAT32 via following [these instructions](https://www.redips.net/linux/create-fat32-usb-drive/) (basically, use `fdisk` to wipe the drive, then create a new FAT32 partition)
* Copy the ISO to the USB pen drive via `sudo dd if=~/Downloads/Fedora-Xfce-Live-x86_64-29-20181029.1.iso of=/dev/sdg bs=4M status=progress` (where `/dev/sdg` is your usb device and `~/Downloads/Fedora....` is your ISO`)

You can now boot your PC with the pen drive plugged in, then press `F8` to boot to it. The remaining instructions assume you've installed Fedora to your machine's hard drive.

## Common Development Tools
Run as root and change "tom" for your user name
```
./install.sh tom
```

## Video Drivers
* [NVIDIA](NVIDIA.md)

TODO: Replace this .md with a script. The script should perform the steps in the readme plus:
* Replace the CUDA version with latest
* Grab the cudnn file:
  * `curl -OJ https://developer.nvidia.com/compute/machine-learning/cudnn/secure/v7.6.0.64/prod/10.1_20190516/cudnn-10.1-linux-x64-v7.6.0.64.tgz`
* Update `$PATH` and `$LD_LIBRARY_PATH` for the current user

We also need some troubleshooting here.

## Tools
* [tdp_tools](https://github.com/wrld3d/tdp_tools)
* [QtCreator](QtCreator.md)
* [Android Studio](AndroidStudio.md)

## Libraries
* [Caffe2](https://github.com/wrld3d/tp_pipeline_caffe2)
* [TheiaSfM](https://github.com/wrld3d/tp_pipeline_theia)
* [PCL](https://github.com/tdp-libs/tp_pipeline_pcl)
* [COLMAP](https://github.com/tdp-libs/tp_pipeline_colmap)
* [OpenCV](https://github.com/tdp-libs/tp_pipeline_opencv)
