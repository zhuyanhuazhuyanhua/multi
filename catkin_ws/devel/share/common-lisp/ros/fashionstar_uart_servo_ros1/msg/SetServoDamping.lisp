; Auto-generated. Do not edit!


(cl:in-package fashionstar_uart_servo_ros1-msg)


;//! \htmlinclude SetServoDamping.msg.html

(cl:defclass <SetServoDamping> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:fixnum
    :initform 0)
   (power
    :reader power
    :initarg :power
    :type cl:fixnum
    :initform 0))
)

(cl:defclass SetServoDamping (<SetServoDamping>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SetServoDamping>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SetServoDamping)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name fashionstar_uart_servo_ros1-msg:<SetServoDamping> is deprecated: use fashionstar_uart_servo_ros1-msg:SetServoDamping instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <SetServoDamping>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fashionstar_uart_servo_ros1-msg:id-val is deprecated.  Use fashionstar_uart_servo_ros1-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'power-val :lambda-list '(m))
(cl:defmethod power-val ((m <SetServoDamping>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader fashionstar_uart_servo_ros1-msg:power-val is deprecated.  Use fashionstar_uart_servo_ros1-msg:power instead.")
  (power m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SetServoDamping>) ostream)
  "Serializes a message object of type '<SetServoDamping>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'power)) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'power)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SetServoDamping>) istream)
  "Deserializes a message object of type '<SetServoDamping>"
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'id)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'power)) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) (cl:slot-value msg 'power)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SetServoDamping>)))
  "Returns string type for a message object of type '<SetServoDamping>"
  "fashionstar_uart_servo_ros1/SetServoDamping")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SetServoDamping)))
  "Returns string type for a message object of type 'SetServoDamping"
  "fashionstar_uart_servo_ros1/SetServoDamping")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SetServoDamping>)))
  "Returns md5sum for a message object of type '<SetServoDamping>"
  "a5f9d7f2f2291fcc1ddba2b1e73469a0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SetServoDamping)))
  "Returns md5sum for a message object of type 'SetServoDamping"
  "a5f9d7f2f2291fcc1ddba2b1e73469a0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SetServoDamping>)))
  "Returns full string definition for message of type '<SetServoDamping>"
  (cl:format cl:nil "uint8 id~%uint16 power~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SetServoDamping)))
  "Returns full string definition for message of type 'SetServoDamping"
  (cl:format cl:nil "uint8 id~%uint16 power~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SetServoDamping>))
  (cl:+ 0
     1
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SetServoDamping>))
  "Converts a ROS message object to a list"
  (cl:list 'SetServoDamping
    (cl:cons ':id (id msg))
    (cl:cons ':power (power msg))
))
