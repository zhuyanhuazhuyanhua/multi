; Auto-generated. Do not edit!


(cl:in-package fashionstar_uart_servo_ros1-srv)


;//! \htmlinclude QueryServoAngle-request.msg.html

(cl:defclass <QueryServoAngle-request> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0))
)

(cl:defclass QueryServoAngle-request (<QueryServoAngle-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <QueryServoAngle-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'QueryServoAngle-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name fashionstar_uart_servo_ros1-srv:<QueryServoAngle-request> is deprecated: use fashionstar_uart_servo_ros1-srv:QueryServoAngle-request instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <QueryServoAngle-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fashionstar_uart_servo_ros1-srv:id-val is deprecated.  Use fashionstar_uart_servo_ros1-srv:id instead.")
  (id m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <QueryServoAngle-request>) ostream)
  "Serializes a message object of type '<QueryServoAngle-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <QueryServoAngle-request>) istream)
  "Deserializes a message object of type '<QueryServoAngle-request>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<QueryServoAngle-request>)))
  "Returns string type for a service object of type '<QueryServoAngle-request>"
  "fashionstar_uart_servo_ros1/QueryServoAngleRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'QueryServoAngle-request)))
  "Returns string type for a service object of type 'QueryServoAngle-request"
  "fashionstar_uart_servo_ros1/QueryServoAngleRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<QueryServoAngle-request>)))
  "Returns md5sum for a message object of type '<QueryServoAngle-request>"
  "3fa0610a2c670f4fbf342f6899c09e8c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'QueryServoAngle-request)))
  "Returns md5sum for a message object of type 'QueryServoAngle-request"
  "3fa0610a2c670f4fbf342f6899c09e8c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<QueryServoAngle-request>)))
  "Returns full string definition for message of type '<QueryServoAngle-request>"
  (cl:format cl:nil "uint8 id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'QueryServoAngle-request)))
  "Returns full string definition for message of type 'QueryServoAngle-request"
  (cl:format cl:nil "uint8 id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <QueryServoAngle-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <QueryServoAngle-request>))
  "Converts a ROS message object to a list"
  (cl:list 'QueryServoAngle-request
    (cl:cons ':id (id msg))
))
;//! \htmlinclude QueryServoAngle-response.msg.html

(cl:defclass <QueryServoAngle-response> (roslisp-msg-protocol:ros-message)
  ((angle
    :reader angle
    :initarg :angle
    :type cl:float
    :initform 0.0))
)

(cl:defclass QueryServoAngle-response (<QueryServoAngle-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <QueryServoAngle-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'QueryServoAngle-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name fashionstar_uart_servo_ros1-srv:<QueryServoAngle-response> is deprecated: use fashionstar_uart_servo_ros1-srv:QueryServoAngle-response instead.")))

(cl:ensure-generic-function 'angle-val :lambda-list '(m))
(cl:defmethod angle-val ((m <QueryServoAngle-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fashionstar_uart_servo_ros1-srv:angle-val is deprecated.  Use fashionstar_uart_servo_ros1-srv:angle instead.")
  (angle m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <QueryServoAngle-response>) ostream)
  "Serializes a message object of type '<QueryServoAngle-response>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'angle))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <QueryServoAngle-response>) istream)
  "Deserializes a message object of type '<QueryServoAngle-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'angle) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<QueryServoAngle-response>)))
  "Returns string type for a service object of type '<QueryServoAngle-response>"
  "fashionstar_uart_servo_ros1/QueryServoAngleResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'QueryServoAngle-response)))
  "Returns string type for a service object of type 'QueryServoAngle-response"
  "fashionstar_uart_servo_ros1/QueryServoAngleResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<QueryServoAngle-response>)))
  "Returns md5sum for a message object of type '<QueryServoAngle-response>"
  "3fa0610a2c670f4fbf342f6899c09e8c")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'QueryServoAngle-response)))
  "Returns md5sum for a message object of type 'QueryServoAngle-response"
  "3fa0610a2c670f4fbf342f6899c09e8c")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<QueryServoAngle-response>)))
  "Returns full string definition for message of type '<QueryServoAngle-response>"
  (cl:format cl:nil "float32 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'QueryServoAngle-response)))
  "Returns full string definition for message of type 'QueryServoAngle-response"
  (cl:format cl:nil "float32 angle~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <QueryServoAngle-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <QueryServoAngle-response>))
  "Converts a ROS message object to a list"
  (cl:list 'QueryServoAngle-response
    (cl:cons ':angle (angle msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'QueryServoAngle)))
  'QueryServoAngle-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'QueryServoAngle)))
  'QueryServoAngle-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'QueryServoAngle)))
  "Returns string type for a service object of type '<QueryServoAngle>"
  "fashionstar_uart_servo_ros1/QueryServoAngle")