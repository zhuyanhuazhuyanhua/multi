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
SERVO_PORT_NAME =  u'/dev/ttyTHS1'		# 舵机串口号 <<< 修改为实际串口号
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
