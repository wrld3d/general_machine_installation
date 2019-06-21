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
