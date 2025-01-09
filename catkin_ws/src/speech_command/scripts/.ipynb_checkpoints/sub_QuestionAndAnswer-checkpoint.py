#!/usr/bin/env python
# encoding: utf-8
import os
import rospy
from std_msgs.msg import Bool,String
import sys
import time

def sub_questionCallback(msg):
	print(msg.data)
	#os.system("arecord -D hw:2,0 -r 16000 -f s16_LE -t wav " + now_time+".wav")

def sub_ansewrCallback(msg):
	print(msg.data)
	os.system("aplay -D plughw:0,0 offline_left.map3")

def test_sub():
	rospy.init_node("sub_question",anonymous=False)
	rospy.Subscriber("/question",String,sub_questionCallback)
	rospy.Subscriber("/answer",String,sub_ansewrCallback)
	rospy.spin()

if __name__ =='__main__':
	test_sub()

