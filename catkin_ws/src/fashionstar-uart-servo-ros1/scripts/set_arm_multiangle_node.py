#!/usr/bin/env python
#coding:utf-8
'''
电机角度控制测试节点
'''
import rospy
from fashionstar_uart_servo_ros1.msg import SetServoAngle

SERVO_IDS = [0, 1, 2, 3, 4, 5] # 测试的电机ID列表

def test_set_servo_angles():
    '''回调函数'''
    # 创建节点
    rospy.init_node('test_set_angle_node', anonymous=True) 
    # 创建发布者 
    # - Topic名称为:  'set_servo_angle'
    # - Message格式类型: set_servo_angle
    # - queue_size 消息队列尺寸，自定义
    pub = rospy.Publisher('set_servo_angle', SetServoAngle, queue_size=10) # 增加队列大小以适应多个电机
    # 设置发送节拍 0.2HZ 
    rate = rospy.Rate(0.2)
    # 电机角度
    angle = 90.0
    # 创建信息对象列表
    msgs = [SetServoAngle() for _ in SERVO_IDS]

    while not rospy.is_shutdown():
        # 修改电机角度
        angle *= -1.0
        # 填充Message
        for i, msg in enumerate(msgs):
            msg.id = SERVO_IDS[i]
            msg.angle = angle
            rospy.loginfo('Set Servo {} = {}'.format(msg.id, msg.angle))
        for msg in msgs:
            pub.publish(msg) # 发布每个电机的角度
        rate.sleep()

if __name__ == '__main__':
    test_set_servo_angles()