# 通过ROS的Service查询舵机角度(Python)



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







## Python节点-服务提供者

相比较上节课，又添加了一个设置舵机为阻尼模式Message 

`SetServoDamping.msg`

```
uint8 id
uint16 power
```

具体操作过程省略. 

服务提供者的完整源码如下

`uservo_demo_node.py`

```bash
#!/usr/bin/env python
#coding:utf-8
'''
舵机控制节点(Demo)
'''
import rospy
import serial
from uservo import UartServoManager
from fashionstar_uart_servo_ros1.msg import SetServoAngle, SetServoDamping
from fashionstar_uart_servo_ros1.srv import QueryServoAngle, QueryServoAngleResponse

# 参数配置
# 角度定义
SERVO_PORT_NAME =  u'/dev/ttyUSB0'		# 舵机串口号 <<< 修改为实际串口号
SERVO_BAUDRATE = 115200			        # 舵机的波特率
SERVO_ID = 0					        # 舵机的ID号
SERVO_HAS_MTURN_FUNC = False	        # 舵机是否拥有多圈模式

# 初始化串口
uart = serial.Serial(port=SERVO_PORT_NAME, baudrate=SERVO_BAUDRATE,\
					 parity=serial.PARITY_NONE, stopbits=1,\
					 bytesize=8,timeout=0)
# 初始化舵机管理器
uservo = UartServoManager(uart)

def set_servo_angle_callback(data):
    '''回调函数-设置舵机角度'''
    rospy.loginfo("[Recv] Servo ID ={} Set Angle={}".format(data.id, data.angle))
    # 调用舵机SDK - 设置舵机的角度
    uservo.set_servo_angle(data.id, data.angle, interval=0)

def set_servo_damping_callback(data):
    '''回调函数-设置舵机为阻尼模式'''
    rospy.loginfo("[Recv] Servo ID ={} Set Damping Power={}".format(data.id, data.power))
    # 调用舵机SDK - 设置舵机为阻尼模式
    uservo.set_damping(data.id, data.power)

def query_servo_angle_callback(req):
    '''回调函数-查询舵机角度'''
    # 创建回传对象
    response = QueryServoAngleResponse()
    # 查询舵机的角度
    angle = uservo.query_servo_angle(req.id)
    # 填充回传对象的内容
    response.angle = angle
    rospy.loginfo("[Recv] Servo ID ={} Query Angle={}".format(req.id, angle))

    return response

def uart_manager():    
    # 初始化节点
    rospy.init_node('uservo_node', anonymous=True)
    # 舵机角度设置订阅者
    rospy.Subscriber("set_servo_angle", SetServoAngle, set_servo_angle_callback)
    # 舵机阻尼模式订阅者
    rospy.Subscriber("set_servo_damping", SetServoDamping, set_servo_damping_callback)
    # 舵机角度查询服务
    rospy.Service('query_servo_angle', QueryServoAngle, query_servo_angle_callback)
    # 持续等待， 直到节点结束
    rospy.spin()

if __name__ == '__main__':
    uart_manager()
```





## Python节点-服务接收者

`test_query_angle_node.py`

```python
#!/usr/bin/env python
#coding:utf-8
'''
电机角度查询节点
'''
import rospy
from fashionstar_uart_servo_ros1.msg import SetServoDamping
from fashionstar_uart_servo_ros1.srv import QueryServoAngle

SERVO_ID = 0 # 测试的电机ID

def test_query_servo_angle():
    '''回调函数'''
    # 创建节点
    rospy.init_node('test_query_angle_node', anonymous=True) 
    # 等待角度查询服务开启
    srv_query_servo_angle = rospy.ServiceProxy('query_servo_angle', QueryServoAngle)
    # 创建发布者 - 舵机阻尼模式发布器
    set_servo_damping_pub = rospy.Publisher('set_servo_damping', SetServoDamping, queue_size=1)
    # 构造Damping控制指令
    damping_msg = SetServoDamping()
    damping_msg.id = SERVO_ID   # 舵机ID
    damping_msg.power = 400    # 功率
    rospy.sleep(2)
    set_servo_damping_pub.publish(damping_msg) # 设置为Damping模式
    rospy.loginfo("Servo #{} Set Damping Mode, Power={} mW".format(SERVO_ID, damping_msg.power))

    # 设置发送节拍 0.2HZ 
    rate = rospy.Rate(1)

    while not rospy.is_shutdown():
        # 设置舵机为阻尼模式
        # 理论上来讲，发一次就可以了， 但是实际上因为message通信模式
        # 不能保证发出的一定被接受到，所以保险还是多发几次
        # set_servo_damping_pub.publish(damping_msg)
        
        # 请求query_servo_angle的服务
        try:
            response = srv_query_servo_angle(SERVO_ID)
            # 提取查询的角度
            angle = response.angle
            # 输出角度查询日志
            rospy.loginfo("Servo #{} Angle={}".format(SERVO_ID, angle))
        except rospy.ServiceException as e:
            # 服务并不总是可以被处理，会存在一定概率的服务请求失败的问题
            print("Service Call Failed : {}".format(e))

        # 等待
        rate.sleep()

if __name__ == '__main__':
    test_query_servo_angle()

```

## 运行历程

**运行Master节点**

```bash
roscore
```

**运行舵机服务节点(接收者)**

```
rosrun fashionstar_uart_svo_ros1 uservo_demo_node.py
```

*日志*

```
[INFO] [1623680166.047112]: [Recv] Servo ID =0 Set Damping Power=400
[INFO] [1623680166.059935]: [Recv] Servo ID =0 Query Angle=213.0
[INFO] [1623680167.058688]: [Recv] Servo ID =0 Query Angle=213.7
[INFO] [1623680168.058797]: [Recv] Servo ID =0 Query Angle=213.7
[INFO] [1623680169.059673]: [Recv] Servo ID =0 Query Angle=213.7
[INFO] [1623680170.058740]: [Recv] Servo ID =0 Query Angle=219.3
[INFO] [1623680171.058555]: [Recv] Servo ID =0 Query Angle=294.5
[INFO] [1623680172.058776]: [Recv] Servo ID =0 Query Angle=271.4
[INFO] [1623680173.058616]: [Recv] Servo ID =0 Query Angle=215.9
[INFO] [1623680174.059845]: [Recv] Servo ID =0 Query Angle=215.9
[INFO] [1623680175.064720]: [Recv] Servo ID =0 Query Angle=215.9
[INFO] [1623680176.060884]: [Recv] Servo ID =0 Query Angle=215.9
[INFO] [1623680177.058585]: [Recv] Servo ID =0 Query Angle=215.9

```

**运行服务请求节点**

```
rosrun fashionstar_uart_servo_ros1 test_query_angle_node.py 
```

*日志*

```
kyle@turing:~/catkin_ws$ rosrun fashionstar_uart_servo_ros1 test_query_angle_node.py 
[INFO] [1623680166.047034]: Servo #0 Set Damping Mode, Power=400 mW
[INFO] [1623680166.064096]: Servo #0 Angle=213.0
[INFO] [1623680167.062041]: Servo #0 Angle=213.699996948
[INFO] [1623680168.061747]: Servo #0 Angle=213.699996948
[INFO] [1623680169.063210]: Servo #0 Angle=213.699996948
[INFO] [1623680170.061164]: Servo #0 Angle=219.300003052
[INFO] [1623680171.062365]: Servo #0 Angle=294.5
[INFO] [1623680172.062211]: Servo #0 Angle=271.399993896
[INFO] [1623680173.062281]: Servo #0 Angle=215.899993896
[INFO] [1623680174.063616]: Servo #0 Angle=215.899993896
[INFO] [1623680175.069219]: Servo #0 Angle=215.899993896
[INFO] [1623680176.064861]: Servo #0 Angle=215.899993896
[INFO] [1623680177.062190]: Servo #0 Angle=215.899993896

```

