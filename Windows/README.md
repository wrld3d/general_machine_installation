We generally don't develop on Windows, but it can be useful now and again. Specifically, we sometimes spin up EC2 machines to do heavy processing.

## EC2 Instance Types
GPU instances are required. The two most suitable instance types are [p2.xlarge](https://aws.amazon.com/ec2/instance-types/p2/) or [p3.x2large](https://aws.amazon.com/ec2/instance-types/p3/)

## AMIs
Have a look on the devops.mapreduce account. At the time of writing, the latest Windows AMI is `ami-01de985d8b3db54ef`

## Installing dependencies
If you need to spin up a new box and install the required dependencies, bring up an ec2 box and run [install.bat](install.bat)
