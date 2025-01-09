#!/usr/bin/env python
# encoding: utf-8
import serial 
import json
import time
import os
import rospy
from std_msgs.msg import String, Float32, Int32, Bool
woshuo = b'\xa5\x01\x01\x04\x00\x00\x00\xa5\x00\x00\x00\xb0'
queren = b'\xA5\x01\xff\x04\x00\x00\x00\xA5\x00\x00\x00\xB2'

len_r = 0
data_list = []
buf = []
buf_flag = 0
first = 0

def deal_file():
    if os.path.getsize('./file.txt') == 0:
        f = open("./file.txt",mode = 'w+')
        f.write("text!")
        f.close()
        


def deal(data_list):
    global first
    str1 = str(data_list)

    f_data = str1.find('{') 
    l_data = str1.rfind('}') 
    str1 = str1[f_data:l_data+1]

    str1 = str1.replace("\\","")
    str1 = str1.replace("', b'","")
    str1 = str1.replace('"{',"{")
    str1 = str1.replace('}"',"}")

    json_str = json.loads(str1)

    if 'code' in json_str and first == 0:
        sss = json_str['content']
        print(json_str['content'])   
        first = 1
    else:
        angle = json_str['content']['info']['ivw']['angle']
        print("angle: ", angle) 
        return angle
def getangleCallback(msg):
    print(msg.data)

try:
	rospy.init_node("record_audio_node",anonymous=False)
	angle_publisher =rospy.Publisher("/xf_angel", Int32, queue_size=100)
	angle_sub = rospy.Subscriber("/angle",Int32,getangleCallback)
	#ser=serial.Serial("/dev/ttyUSB0", 115200, 8,'N',1,timeout = 5)
	print("Open the serial")
	angle_msg = Int32()
	'''while not rospy.is_shutdown():
		rcv = ser.read_all()
		len_r = len(rcv)
		if rcv == woshuo:
			ser.write(queren)
            
		elif(len_r > 1) :
			buf.append(rcv)
			buf_flag = 1

		elif len_r < 1 and buf_flag==1:
			buf_flag = 0
			data_list = buf
			buf = []
			angle_msg = deal(data_list)
			angle_publisher.publish(angle_msg)

		time.sleep(0.5) 

	ser.close()'''
	rospy.spin()

except Exception as e:
    print("---Error---:",e)
    



