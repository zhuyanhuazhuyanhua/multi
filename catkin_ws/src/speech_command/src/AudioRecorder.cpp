#include <AudioRecorder.h>

using namespace std;
bool AudioRecorder::if_success_boot;
bool AudioRecorder::if_awake;
hid_device *AudioRecorder::handle;
AudioRecorder::AudioRecorder(const string& audioPath)
{

}

AudioRecorder::~AudioRecorder()
{
    cout << ">>>>>销毁AIUI代理!\n" << endl;  
    cout << ">>>>>停止所有录音\n" << endl;
}

bool AudioRecorder::startRecord(){

    cout << ">>>>>开始录降噪音频\n" << endl;
    return true;
}

void AudioRecorder::stopRecord(){

    cout << ">>>>>停止录降噪音频\n" << endl;
}

bool AudioRecorder::startRecordOriginal(){


    cout << ">>>>>开始录音原始音频\n" << endl;
    return true;
}
void AudioRecorder::stopRecordOriginal(){

    cout << ">>>>>停止录原始音频\n" << endl;
}

bool AudioRecorder::setRecordAngle(int angle){
    if(!if_success_boot)
    {
        return false;
    }
    //set_mic_angle(angle);
    return true;
}


