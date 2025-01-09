#include <iostream>
#include <ros/ros.h>
#include <ros/package.h>
#include <AIUITester.h>
#include <signal.h>
#include "std_msgs/String.h"
#include "std_msgs/Int32.h"
#include <boost/algorithm/string/classification.hpp>
#include <boost/algorithm/string/split.hpp>
#include <thread>
#include <iostream>
#include <mutex>
#include "jsoncpp/json/json.h"
//
char pp11_[3000];
using namespace std;
vector<string> third_line;
/*  
读取配置文件数据,保存到内存中
*/
int LoadUserConfig(string config_txt)
{
	std::ifstream fd(config_txt.c_str());
	if (!fd.is_open())
	{
		cout << "can not open the user config,make sure it is readable" << endl;
		return -1;
	}
	string line;
	while (std::getline(fd, line))
	{
		vector<string> vstr;
		boost::split(vstr, line, boost::is_any_of(":"));
		if (vstr.size() != 3)
		{
			break;
		}
		vector<string> questions;

		third_line.push_back(vstr[2]);
		//cout<<"vstr_third_line:"<<vstr[2]<<endl;
		boost::split(questions, vstr[0], boost::is_any_of("|"));
		for (vector<string>::iterator it = questions.begin(); it != questions.end(); ++it)
		{
			QA_list_.insert(std::pair<std::string, std::string>(*it, vstr[1]));
			QA_list_doc.insert(std::pair<std::string, std::string>(*it, vstr[2]));
		}
	}
	return 0;
}

/*
在用户列表中查找识别到的结果,返回数据(协议)
*/
std::string FindKeyWords(std::string recognise_result)
{
	std::map<std::string, std::string>::iterator it;
	// for(it=QA_list_.begin();it!=QA_list_.end();it++){
	// 	if (recognise_result.find(it->first)!= string::npos){
	// 		return it->second;
	// 	} 
	// }
	// return "";
	auto find_result_ = recognise_result.find("。");
	if (find_result_ != string::npos)
	{
		recognise_result.erase(find_result_, 1);
	}
	auto find_result_1 = recognise_result.find(".");
	if (find_result_1 != string::npos)
	{
		recognise_result.erase(find_result_1, 1);
	}
	it = QA_list_.find(recognise_result);
	if (it != QA_list_.end())
	{
		return it->second;
	}
	else
	{
		return "";
	}
}
std::string FindDocument(std::string recognise_result)
{
	std::map<std::string, std::string>::iterator its;
	// for(it=QA_list_.begin();it!=QA_list_.end();it++){
	// 	if (recognise_result.find(it->first)!= string::npos){
	// 		return it->second;
	// 	}
	// }
	// return "";
	auto find_result_ = recognise_result.find("。");
	if (find_result_ != string::npos)
	{
		recognise_result.erase(find_result_, 1);
	}
	its = QA_list_doc.find(recognise_result);
	if (its != QA_list_doc.end())
	{
		return its->second;
	}
	else
	{
		return "";
	}
}
/**
 * @brief 串口写
 * 
 */
void write_serial()
{
/*
	

	const int numBytes = str.size() / 2;
	unsigned char *bytes = new unsigned char[numBytes];
	for (int i = 0; i < numBytes; ++i)
	{
		std::string twoChars = str.substr(2 * i, 2);
		int byte;
		std::stringstream ss(twoChars);
		ss >> std::hex >> byte;
		bytes[i] = byte;
	}
	//_serial.flush();
	_serial.write(bytes, 8);
*/
	//_serial.read(buffer, 8);
	//printf("123, =%d\n",buffer);
}
int data_send(int argc, char **argv)
{
	ros::init(argc, argv, "publisher_Node");
	ros::NodeHandle n;
	ros::Publisher pub_question = n.advertise<std_msgs::String>("/question", 10);
	ros::Publisher pub_answer = n.advertise<std_msgs::String>("/answer", 10);
	ros::Publisher pub_angle = n.advertise<std_msgs::Int32>("/angle", 1);
	string ros_package_path1 = ros::package::getPath("speech_command");
	package_path1 = const_cast<char *>(ros_package_path1.c_str());
        
	while (ros::ok())
	{
        int angle_str(angle);
                std_msgs::Int32 msg2;
		msg2.data = angle;
		pub_angle.publish(msg2);
		if ((sign_conversation_cloud == 1) || (sign_conversation_local == 1))
		{
            //count<<
			string question_str(question);
			string answer_str(answer);
			int angle_str(angle);
            cout << "angle:\t" << angle_str << "\n";
			//发送问题
			std_msgs::String msg1;
			msg1.data = question_str;
			pub_question.publish(msg1);

			//发送答案
			std_msgs::String msg3;
			msg3.data = answer_str;
			pub_answer.publish(msg3);
		
			// 串口操作
			//cout<<"456456645445454545"<<endl;
			cout << "问题:\t" << question_str << "\n"
				 << "答案:\t" << answer_str << endl;
			if (sign_conversation_local == 1)
			{
				string command_ = FindKeyWords(question_str);
				string document = FindDocument(question_str);
				cout << "下发协议:\t" << command_ << endl;
				strcpy(pp11_, package_path1);
				string  wav = string((char*)pp11_);
				std::string wav_path1 = wav.append(document);
				std::string command1 = "play "+wav_path1;
				system(command1.c_str());
				//_serial.write(command_);
			}

			sign_conversation_cloud = 0;
			sign_conversation_local = 0;
		}

        
		/*if (sign_angle == false)//false
		{
			//发送角度
			std_msgs::Int32 msg2;
			msg2.data = angle;
			pub_angle.publish(msg2);
			sign_angle = true;
			if (angle!=0)
			{
				cout<<"angle:"<<angle<<endl;
			}
		}*/
		ros::spinOnce();
	}
}
int main(int argc, char **argv)
{
	//print("%s",get_software_version());
	cout<<get_software_version()<<endl;
	try
	{
		_serial.setPort(DEV_ID);
		_serial.setBaudrate(BAUD_RATE);
		_serial.setFlowcontrol(serial::flowcontrol_none);
		_serial.setParity(serial::parity_none); //default is parity_none
		_serial.setStopbits(serial::stopbits_one);
		_serial.setBytesize(serial::eightbits);
		serial::Timeout to = serial::Timeout::simpleTimeout(1000);
		_serial.setTimeout(to);
		_serial.open();
		ROS_INFO_STREAM("Port has been open successfully");
	}
	catch (serial::IOException &e)
	{
		ROS_ERROR_STREAM("Unable to open port");
		return -1;
	}

	if (_serial.isOpen())
	{
		sleep(1/10);//ros::Duration(0.1).sleep(); // wait 0.1s
		_serial.flush();			// wait 0.1s
		ROS_INFO_STREAM("port initial successfully------");
	}
	string ros_package_path = ros::package::getPath("speech_command");
	package_path = const_cast<char *>(ros_package_path.c_str());
	// 相对位置 ->  绝对位置
	char pp_[3000], pp1_[3000], pp2_[3000], pp3_[3000], pp4_[3000], pp5_[3000], pp6_[3000], pp7_[3000], pp8_[3000], pp9_[3000], pp10_[3000];
	strcpy(pp_, package_path);
	CFG_FILE_PATH = strcat(pp_, CFG_FILE_PATH);

	strcpy(pp1_, package_path);
	SOURCE_FILE_PATH = strcat(pp1_, SOURCE_FILE_PATH);

	strcpy(pp2_, package_path);
	GRAMMAR_FILE_PATH = strcat(pp2_, GRAMMAR_FILE_PATH);

	strcpy(pp3_, package_path);
	TEST_AUDIO_PATH = strcat(pp3_, TEST_AUDIO_PATH);

	strcpy(pp4_, package_path);
	LOG_DIR = strcat(pp4_, LOG_DIR);

	strcpy(pp5_, package_path);
	CONFIG_FILE_PATH = strcat(pp5_, CONFIG_FILE_PATH);

	strcpy(pp6_, package_path);
	PCM_FILE_PATH = strcat(pp6_, PCM_FILE_PATH);

	strcpy(pp7_, package_path);
	ORIPCM_FILE_PATH = strcat(pp7_, ORIPCM_FILE_PATH);

	strcpy(pp8_, package_path);

	strcpy(pp9_, package_path);
	NO_INTERNET_RESPONSE_WAV = strcat(pp9_, NO_INTERNET_RESPONSE_WAV);



	// 加载用户离线语义表
	string user_config_path = ros_package_path + USER_CONFIG_PATH;
	LoadUserConfig(user_config_path);
	AIUITester t;



	std::thread t1(std::bind(&AIUITester::test,&t));
        std::thread t2(data_send,argc, argv);
	
	

	t1.join();
	t2.join();



	t.destory();

	return 0;
}
