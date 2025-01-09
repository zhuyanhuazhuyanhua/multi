# ROS1安装笔记 (Ubuntu18.04 + Melodic)

[toc]

\- 作者: 阿凯爱玩机器人

\- Email: kyle.xing@fashionstar.com.hk

\- 更新时间: 2021-06-16



## 概要

本文讲解了如何在Ubuntu18.04下安装ROS发行版 Melodic。

## 系统信息

Ubuntu: 18.04
ROS: Melodic

## 官方wiki
[ROS Melodic官方安装教程](http://wiki.ros.org/melodic/Installation)


## 安装melodic

sources.list初始化
```bash
sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
```

添加keys
```bash
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
```

更新源
```bash
sudo apt update
```

安装ROS
```bash
sudo apt install ros-melodic-desktop-full
```


修改`.bashrc`
```bash
echo "source /opt/ros/melodic/setup.bash" >> ~/.bashrc
source ~/.bashrc
```

## 安装依赖包

```bash
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential
```

## rosdep

### 安装rosdep
`rosdep` 初始化
```bash
sudo apt install python-rosdep
```

### 修改IP地址映射
在初始化`rosdep`之前，需要重定向网址`raw.githubusercontent.com`的IP地址， 原因是被墙了。

```bash
sudo gedit /etc/hosts
```
使用网站 [https://www.ipaddress.com/](https://www.ipaddress.com/) 查询 `raw.githubusercontent.com` 最新的IP地址。

追加一行（注: IP地址可以用你查到的地址）
URL对应的IP解析地址有很多个，选取一个可用的。
```
185.199.109.133 raw.githubusercontent.com
```
编辑完成之后保存并退出。


```bash
sudo gedit /etc/resolv.conf 
```
注释原有的`nameserver`， 追加两行.
```bash
# nameserver 127.0.0.53
nameserver 8.8.8.8 #google域名服务器
nameserver 8.8.4.4 #google域名服务器
```

### 修改rosdep的源码

`rosdep update`的时候， 一直提示timeout错误的原因是`rosdep` 包里面的超时判断条件太短了，国内访问`raw.githubusercontent.com`的速度很慢，所以需要修改`rosdep`包的源码里面的超时判断条件

设置全局变量`DOWNLOAD_TIMEOUT =45`

需要修改如下三个Python脚本里面的`DOWNLOAD_TIMEOUT`

```
sudo gedit /usr/lib/python2.7/dist-packages/rosdep2/sources_list.py
sudo gedit /usr/lib/python2.7/dist-packages/rosdep2/gbpdistro_support.py
sudo gedit /usr/lib/python2.7/dist-packages/rosdep2/rep3.py
```

修改之后，可能还是会遇到`timeout`的情况， 多试几次。

### rosdep初始化与更新

```bash
sudo rosdep init
rosdep update
```

**输出日志**
```bash
$ rosdep update
reading in sources list data from /etc/ros/rosdep/sources.list.d
Hit https://raw.githubusercontent.com/ros/rosdistro/master/rosdep/osx-homebrew.yaml
Hit https://raw.githubusercontent.com/ros/rosdistro/master/rosdep/base.yaml
Hit https://raw.githubusercontent.com/ros/rosdistro/master/rosdep/python.yaml
Hit https://raw.githubusercontent.com/ros/rosdistro/master/rosdep/ruby.yaml
Hit https://raw.githubusercontent.com/ros/rosdistro/master/releases/fuerte.yaml
Query rosdistro index https://raw.githubusercontent.com/ros/rosdistro/master/index-v4.yaml
Skip end-of-life distro "ardent"
Skip end-of-life distro "bouncy"
Skip end-of-life distro "crystal"
Skip end-of-life distro "dashing"
Skip end-of-life distro "eloquent"
Add distro "foxy"
Add distro "galactic"
Skip end-of-life distro "groovy"
Skip end-of-life distro "hydro"
Skip end-of-life distro "indigo"
Skip end-of-life distro "jade"
Skip end-of-life distro "kinetic"
Skip end-of-life distro "lunar"
Add distro "melodic"
Add distro "noetic"
Add distro "rolling"
updated cache in /home/kyle/.ros/rosdep/sources.cache
```

## 创建Workspace

```
cd ~
mkdir catkin_ws && cd catkin_ws
mkdir src
catkin_make
```

**输出日志**

```
kyle@turing:~/catkin_ws$ catkin_make
Base path: /home/kyle/catkin_ws
Source space: /home/kyle/catkin_ws/src
Build space: /home/kyle/catkin_ws/build
Devel space: /home/kyle/catkin_ws/devel
Install space: /home/kyle/catkin_ws/install
Creating symlink "/home/kyle/catkin_ws/src/CMakeLists.txt" pointing to "/opt/ros/melodic/share/catkin/cmake/toplevel.cmake"
####
#### Running command: "cmake /home/kyle/catkin_ws/src -DCATKIN_DEVEL_PREFIX=/home/kyle/catkin_ws/devel -DCMAKE_INSTALL_PREFIX=/home/kyle/catkin_ws/install -G Unix Makefiles" in "/home/kyle/catkin_ws/build"
####
-- The C compiler identification is GNU 7.5.0
-- The CXX compiler identification is GNU 7.5.0
-- Check for working C compiler: /usr/bin/cc
-- Check for working C compiler: /usr/bin/cc -- works
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Detecting C compile features
-- Detecting C compile features - done
-- Check for working CXX compiler: /usr/bin/c++
-- Check for working CXX compiler: /usr/bin/c++ -- works
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Using CATKIN_DEVEL_PREFIX: /home/kyle/catkin_ws/devel
-- Using CMAKE_PREFIX_PATH: /opt/ros/melodic
-- This workspace overlays: /opt/ros/melodic
-- Found PythonInterp: /usr/bin/python2 (found suitable version "2.7.17", minimum required is "2") 
-- Using PYTHON_EXECUTABLE: /usr/bin/python2
-- Using Debian Python package layout
-- Using empy: /usr/bin/empy
-- Using CATKIN_ENABLE_TESTING: ON
-- Call enable_testing()
-- Using CATKIN_TEST_RESULTS_DIR: /home/kyle/catkin_ws/build/test_results
-- Found gtest sources under '/usr/src/googletest': gtests will be built
-- Found gmock sources under '/usr/src/googletest': gmock will be built
-- Found PythonInterp: /usr/bin/python2 (found version "2.7.17") 
-- Looking for pthread.h
-- Looking for pthread.h - found
-- Looking for pthread_create
-- Looking for pthread_create - not found
-- Looking for pthread_create in pthreads
-- Looking for pthread_create in pthreads - not found
-- Looking for pthread_create in pthread
-- Looking for pthread_create in pthread - found
-- Found Threads: TRUE  
-- Using Python nosetests: /usr/bin/nosetests-2.7
-- catkin 0.7.29
-- BUILD_SHARED_LIBS is on
-- BUILD_SHARED_LIBS is on
-- Configuring done
-- Generating done
-- Build files have been written to: /home/kyle/catkin_ws/build
####
#### Running command: "make -j4 -l4" in "/home/kyle/catkin_ws/build"
####
```

将工作区的`devel/setup.bash` 添加到`.bashrc`

```bash
gedit ~/.bashrc 
```
追加一行
```bash
source /home/kyle/catkin_ws/devel/setup.bash
```
> 注: 这里的`kyle` 改成你自己的用户名。

```bash
source ~/.bashrc 
```