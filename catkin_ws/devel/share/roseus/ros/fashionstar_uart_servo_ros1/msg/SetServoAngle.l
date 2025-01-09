;; Auto-generated. Do not edit!


(when (boundp 'fashionstar_uart_servo_ros1::SetServoAngle)
  (if (not (find-package "FASHIONSTAR_UART_SERVO_ROS1"))
    (make-package "FASHIONSTAR_UART_SERVO_ROS1"))
  (shadow 'SetServoAngle (find-package "FASHIONSTAR_UART_SERVO_ROS1")))
(unless (find-package "FASHIONSTAR_UART_SERVO_ROS1::SETSERVOANGLE")
  (make-package "FASHIONSTAR_UART_SERVO_ROS1::SETSERVOANGLE"))

(in-package "ROS")
;;//! \htmlinclude SetServoAngle.msg.html


(defclass fashionstar_uart_servo_ros1::SetServoAngle
  :super ros::object
  :slots (_id _angle ))

(defmethod fashionstar_uart_servo_ros1::SetServoAngle
  (:init
   (&key
    ((:id __id) 0)
    ((:angle __angle) 0.0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _angle (float __angle))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:serialization-length
   ()
   (+
    ;; uint8 _id
    1
    ;; float32 _angle
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _id
       (write-byte _id s)
     ;; float32 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;; float32 _angle
     (setq _angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get fashionstar_uart_servo_ros1::SetServoAngle :md5sum-) "39fc2bc02ee4598568e833e115b496ba")
(setf (get fashionstar_uart_servo_ros1::SetServoAngle :datatype-) "fashionstar_uart_servo_ros1/SetServoAngle")
(setf (get fashionstar_uart_servo_ros1::SetServoAngle :definition-)
      "uint8 id
float32 angle
")



(provide :fashionstar_uart_servo_ros1/SetServoAngle "39fc2bc02ee4598568e833e115b496ba")


