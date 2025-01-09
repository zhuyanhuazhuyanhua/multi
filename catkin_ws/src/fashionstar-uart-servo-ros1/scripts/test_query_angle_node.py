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
