
(cl:in-package :asdf)

(defsystem "fashionstar_uart_servo_ros1-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "SetServoAngle" :depends-on ("_package_SetServoAngle"))
    (:file "_package_SetServoAngle" :depends-on ("_package"))
    (:file "SetServoDamping" :depends-on ("_package_SetServoDamping"))
    (:file "_package_SetServoDamping" :depends-on ("_package"))
  ))