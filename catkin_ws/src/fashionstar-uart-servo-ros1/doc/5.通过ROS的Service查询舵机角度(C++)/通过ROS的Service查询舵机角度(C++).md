# 通过ROS的Service查询舵机角度(C++)



[toc]

\- 作者: 阿凯爱玩机器人

\- Email: kyle.xing@fashionstar.com.hk

\- 更新时间: 2021-06-16



## 创建Serice文件

### 创建文件夹

在工程文件里面创建文件夹`srv`

### 创建Service文件

在`srv`文件夹下创建`query_servo_angle.srv`

`query_servo_angle.srv`

```
uint8 id
---
float32 angle
```

`Service` 与`Message`很相似,  `---` 符号上方是传入参数, 下方是回传的参数. 



### 配置`package.xml`

与`Message` 配置方式一致



### 配置`CMakeLists.txt`

注册service文件.

```cmake
## Generate services in the 'srv' folder
add_service_files(
  FILES
  query_servo_angle.srv
)
```

其他部分跟`Message`的配置方式一致。

### 构建Service

```bash
cd ~/catkin_ws
catkin_make
```







## C++节点-服务提供者

相比较上节课，又添加了一个设置舵机为阻尼模式Message 

`SetServoDamping.msg`

```
uint8 id
uint16 power
```

具体操作过程省略. 

服务提供者的完整源码如下

`src/uservo_demo_node.cpp`

```cpp
/* 
 * 舵机控制节点(Demo) 
 */
// 导入ROS依赖
#include "ros/ros.h"
#include "fashionstar_uart_servo_ros1/SetServoAngle.h"
#include "fashionstar_uart_servo_ros1/SetServoDamping.h"
#include "fashionstar_uart_servo_ros1/QueryServoAngle.h"

#include "CSerialPort/SerialPort.h"
#include "FashionStar/UServo/FashionStar_UartServoProtocol.h"
#include "FashionStar/UServo/FashionStar_UartServo.h"

using namespace fsuservo;
using namespace fashionstar_uart_servo_ros1;

// 参数定义
#define SERVO_PORT_NAME "/dev/ttyUSB0" 	// Linux下端口号名称 /dev/ttyUSB{}
#define SERVO_ID 0 				        // 舵机ID号

// 创建协议对象
FSUS_Protocol protocol(SERVO_PORT_NAME, FSUS_DEFAULT_BAUDRATE);
// 创建一个舵机对象
FSUS_Servo servo0(SERVO_ID, &protocol);

/* 舵机角度设置回调函数 */
void set_servo_angle_callback(const SetServoAngle& data){
    ROS_INFO("[RECV] Servo ID = %d Set Angle = %.1f", data.id, data.angle);
    // 设置舵机角度
    servo0.setRawAngle(data.angle, 0);
}

/* 舵机阻尼模式回调函数 */
void set_servo_damping_callback(const SetServoDamping& data){
    ROS_INFO("[RECV] Servo ID = %d, Set Damping Power = %d", data.id, data.power);
    servo0.setDamping(data.power);
}

/* 舵机角度查询 */
bool query_servo_angle_callback(QueryServoAngle::Request& req, QueryServoAngle::Response& res){
    float angle;
    // 通过SDK查询舵机角度 
    angle = servo0.queryRawAngle();
    // 填写返回数据包
    res.angle = angle;
    // 打印日志
    ROS_INFO("[RECV] Servo ID = %d  , Query Servo Angle = %.1f", req.id,  angle);
    // 注: C++版本的 服务回调函数，最后一定要返回一个bool值
    return true;
}

int main(int argc, char **argv)
{
    // 创建节点名称
    ros::init(argc, argv, "uservo_demo_node");
    // 创建NodeHandle
    ros::NodeHandle node_handle;

    // 创建接收者
    ros::Subscriber set_servo_angle_sub = node_handle.subscribe("set_servo_angle", 2, set_servo_angle_callback);
    ros::Subscriber set_servo_damping_sub = node_handle.subscribe("set_servo_damping", 2, set_servo_damping_callback);
    // 创建服务
    ros::ServiceServer query_servo_angle_srv = node_handle.advertiseService("query_servo_angle", query_servo_angle_callback);
    // 进入循环等待
    ros::spin();
}
```







## C++节点-服务接收者

`src/test_query_angle_node.cpp`

```python
/* 
 * 测试舵机角度查询节点 
 */
#include "ros/ros.h"
// 自定义消息
#include "fashionstar_uart_servo_ros1/SetServoDamping.h"
// 自定义服务
#include "fashionstar_uart_servo_ros1/QueryServoAngle.h"


using namespace fashionstar_uart_servo_ros1;

#define SERVO_ID 0 				        // 舵机ID号

int main(int argc, char **argv)
{
    // 创建节点名称
    ros::init(argc, argv, "test_set_angle_node");
    // 创建NodeHandle
    ros::NodeHandle node_handle;
    // 创建发布者
    ros::Publisher set_servo_damping_pub = node_handle.advertise<SetServoDamping>("set_servo_damping", 2);
    // 创建阻尼模式Message
    SetServoDamping damping_msg;

    // 角度查询服务客户端
    ros::ServiceClient query_angle_client = node_handle.serviceClient<QueryServoAngle>("query_servo_angle");
    // 创建服务对象
    QueryServoAngle query_angle_srv;

    // 等待角度查询服务开启
    query_angle_client.waitForExistence();

    // 设置舵机为阻尼模式
    damping_msg.id = SERVO_ID;
    damping_msg.power = 400;
    set_servo_damping_pub.publish(damping_msg);

    // 循环频率1HZ
    ros::Rate loop_rate(1);
    float angle = 90.0;
    while(ros::ok()){
        // 构造服务请求头
        query_angle_srv.request.id = SERVO_ID;
        // 发送服务请求
        if(query_angle_client.call(query_angle_srv)){
            // 服务成功
            ROS_INFO("[Send]Query Servo %d Angle %.1f", SERVO_ID, query_angle_srv.response.angle);
        }else{
            // 发送失败
            ROS_INFO("[Send]Query Servo %d Angle Failed", SERVO_ID);
        }
        // 延时等待
        loop_rate.sleep();
    }
}

```

## 配置`CMakeLists.txt`

与课程**通过ROS的Message控制舵机角度(C++)** 相比, 在原有的`CMakeLists.txt`里面追加两行配置文件

```makefile
add_executable(test_query_servo_angle src/test_query_servo_angle.cpp)
```

```makefile
target_link_libraries(test_query_servo_angle
  ${catkin_LIBRARIES}
)
```

完整的`CMakeLists.txt`

```makefile
cmake_minimum_required(VERSION 3.0.2)
project(fashionstar_uart_servo_ros1)

## Compile as C++11, supported in ROS Kinetic and newer
# add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED COMPONENTS
  roscpp
  rospy
  std_msgs
  message_generation # Message生成依赖
)


################################################
## Declare ROS messages, services and actions ##
################################################

## Generate messages in the 'msg' folder
## 这里添加msg文件夹下的msg文件名称
add_message_files(
  FILES
  SetServoAngle.msg     # 设置舵机角度
  SetServoDamping.msg   # 设置舵机为阻尼模式
)

## Generate services in the 'srv' folder
add_service_files(
  FILES
  QueryServoAngle.srv  # 舵机角度查询服务
  
)

## Generate added messages and services with any dependencies listed here
generate_messages(
  DEPENDENCIES
  std_msgs
)


###################################
## catkin specific configuration ##
###################################

catkin_package(
  INCLUDE_DIRS include
  LIBRARIES fashionstar_uart_servo_ros1
  CATKIN_DEPENDS message_runtime roscpp rospy std_msgs
  DEPENDS system_lib
)

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
set(CMAKE_INSTALL_PREFIX /usr/local)
include_directories(
# include
  ${catkin_INCLUDE_DIRS}
  ${CMAKE_INSTALL_PREFIX}/include
)

# 设置串口总线舵机链接库的位置
link_directories(
  ${CMAKE_INSTALL_PREFIX}/lib
)

## Declare a C++ executable
## With catkin_make all packages are built within a single CMake context
## The recommended prefix ensures that target names across packages don't collide
## 定义C++可执行文件
# - 串口总线舵机服务示例节点
add_executable(uservo_demo_node src/uservo_demo_node.cpp)

add_executable(test_set_angle_node src/test_set_angle_node.cpp)

add_executable(test_query_servo_angle src/test_query_servo_angle.cpp)

## Specify libraries to link a library or executable target against
target_link_libraries(uservo_demo_node
  ${catkin_LIBRARIES}
  cserialport # 轻量级串口通信库
  fsuartservo # FashionStar串口总线舵机SDK (C++)
)

target_link_libraries(test_set_angle_node
  ${catkin_LIBRARIES}
)

target_link_libraries(test_query_servo_angle
  ${catkin_LIBRARIES}
)
```



## 运行历程

**运行Master节点**

```bash
roscore
```

**运行舵机服务节点(接收者)**

```
rosrun fashionstar_uart_svo_ros1 uservo_demo_node
```



**运行服务请求节点**

```
rosrun fashionstar_uart_servo_ros1 test_query_angle_node
```



