;; Auto-generated. Do not edit!


(when (boundp 'fashionstar_uart_servo_ros1::QueryServoAngle)
  (if (not (find-package "FASHIONSTAR_UART_SERVO_ROS1"))
    (make-package "FASHIONSTAR_UART_SERVO_ROS1"))
  (shadow 'QueryServoAngle (find-package "FASHIONSTAR_UART_SERVO_ROS1")))
(unless (find-package "FASHIONSTAR_UART_SERVO_ROS1::QUERYSERVOANGLE")
  (make-package "FASHIONSTAR_UART_SERVO_ROS1::QUERYSERVOANGLE"))
(unless (find-package "FASHIONSTAR_UART_SERVO_ROS1::QUERYSERVOANGLEREQUEST")
  (make-package "FASHIONSTAR_UART_SERVO_ROS1::QUERYSERVOANGLEREQUEST"))
(unless (find-package "FASHIONSTAR_UART_SERVO_ROS1::QUERYSERVOANGLERESPONSE")
  (make-package "FASHIONSTAR_UART_SERVO_ROS1::QUERYSERVOANGLERESPONSE"))

(in-package "ROS")





(defclass fashionstar_uart_servo_ros1::QueryServoAngleRequest
  :super ros::object
  :slots (_id ))

(defmethod fashionstar_uart_servo_ros1::QueryServoAngleRequest
  (:init
   (&key
    ((:id __id) 0)
    )
   (send-super :init)
   (setq _id (round __id))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:serialization-length
   ()
   (+
    ;; uint8 _id
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; uint8 _id
       (write-byte _id s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; uint8 _id
     (setq _id (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(defclass fashionstar_uart_servo_ros1::QueryServoAngleResponse
  :super ros::object
  :slots (_angle ))

(defmethod fashionstar_uart_servo_ros1::QueryServoAngleResponse
  (:init
   (&key
    ((:angle __angle) 0.0)
    )
   (send-super :init)
   (setq _angle (float __angle))
   self)
  (:angle
   (&optional __angle)
   (if __angle (setq _angle __angle)) _angle)
  (:serialization-length
   ()
   (+
    ;; float32 _angle
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _angle
       (sys::poke _angle (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _angle
     (setq _angle (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass fashionstar_uart_servo_ros1::QueryServoAngle
  :super ros::object
  :slots ())

(setf (get fashionstar_uart_servo_ros1::QueryServoAngle :md5sum-) "3fa0610a2c670f4fbf342f6899c09e8c")
(setf (get fashionstar_uart_servo_ros1::QueryServoAngle :datatype-) "fashionstar_uart_servo_ros1/QueryServoAngle")
(setf (get fashionstar_uart_servo_ros1::QueryServoAngle :request) fashionstar_uart_servo_ros1::QueryServoAngleRequest)
(setf (get fashionstar_uart_servo_ros1::QueryServoAngle :response) fashionstar_uart_servo_ros1::QueryServoAngleResponse)

(defmethod fashionstar_uart_servo_ros1::QueryServoAngleRequest
  (:response () (instance fashionstar_uart_servo_ros1::QueryServoAngleResponse :init)))

(setf (get fashionstar_uart_servo_ros1::QueryServoAngleRequest :md5sum-) "3fa0610a2c670f4fbf342f6899c09e8c")
(setf (get fashionstar_uart_servo_ros1::QueryServoAngleRequest :datatype-) "fashionstar_uart_servo_ros1/QueryServoAngleRequest")
(setf (get fashionstar_uart_servo_ros1::QueryServoAngleRequest :definition-)
      "uint8 id
---
float32 angle
")

(setf (get fashionstar_uart_servo_ros1::QueryServoAngleResponse :md5sum-) "3fa0610a2c670f4fbf342f6899c09e8c")
(setf (get fashionstar_uart_servo_ros1::QueryServoAngleResponse :datatype-) "fashionstar_uart_servo_ros1/QueryServoAngleResponse")
(setf (get fashionstar_uart_servo_ros1::QueryServoAngleResponse :definition-)
      "uint8 id
---
float32 angle
")



(provide :fashionstar_uart_servo_ros1/QueryServoAngle "3fa0610a2c670f4fbf342f6899c09e8c")


