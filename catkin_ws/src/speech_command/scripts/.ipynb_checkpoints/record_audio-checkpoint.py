#!/usr/bin/env python
# encoding: utf-8
import os
import rospy
from std_msgs.msg import Bool
import sys
import time

def excute_recordCallback(msg):
	if msg.data == True:
		now = time.localtime()
		now_time = time.strftime("%Y-%m-%d-%H-%M-%S",now)
		os.system("arecord -D hw:2,0 -r 16000 -f s16_LE -t wav " + now_time+".wav")
	else:
		os.system("killall arecord")
def record():
	rospy.init_node("record_audio_node",anonymous=False)
	rospy.Subscriber("/record_audio",Bool,excute_recordCallback)
	rospy.spin()

if __name__ =='__main__':
	record()

