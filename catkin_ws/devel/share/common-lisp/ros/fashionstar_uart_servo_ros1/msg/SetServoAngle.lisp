; Auto-generated. Do not edit!


(cl:in-package fashionstar_uart_servo_ros1-msg)


;//! \htmlinclude SetServoAngle.msg.html

(cl:defclass <SetServoAngle> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass SetServoAngle (<SetServoAngle>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetServoAngle>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetServoAngle)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name fashionstar_uart_servo_ros1-msg:<SetServoAngle> is deprecated: use fashionstar_uart_servo_ros1-msg:SetServoAngle instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <SetServoAngle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fashionstar_uart_servo_ros1-msg:id-val is deprecated.  Use fashionstar_uart_servo_ros1-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <SetServoAngle>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fashionstar_uart_servo_ros1-msg:angle-val is deprecated.  Use fashionstar_uart_servo_ros1-msg:angle instead.")
  (angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetServoAngle>) ostream)
  "Serializes a message object of type '<SetServoAngle>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetServoAngle>) istream)
  "Deserializes a message object of type '<SetServoAngle>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetServoAngle>)))
  "Returns string type for a message object of type '<SetServoAngle>"
  "fashionstar_uart_servo_ros1/SetServoAngle")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetServoAngle)))
  "Returns string type for a message object of type 'SetServoAngle"
  "fashionstar_uart_servo_ros1/SetServoAngle")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetServoAngle>)))
  "Returns md5sum for a message object of type '<SetServoAngle>"
  "39fc2bc02ee4598568e833e115b496ba")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetServoAngle)))
  "Returns md5sum for a message object of type 'SetServoAngle"
  "39fc2bc02ee4598568e833e115b496ba")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetServoAngle>)))
  "Returns full string definition for message of type '<SetServoAngle>"
  (cl:format cl:nil "uint8 id~%float32 angle~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetServoAngle)))
  "Returns full string definition for message of type 'SetServoAngle"
  (cl:format cl:nil "uint8 id~%float32 angle~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetServoAngle>))
  (cl:+ 0
     1
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetServoAngle>))
  "Converts a ROS message object to a list"
  (cl:list 'SetServoAngle
    (cl:cons ':id (id msg))
    (cl:cons ':angle (angle msg))
))
