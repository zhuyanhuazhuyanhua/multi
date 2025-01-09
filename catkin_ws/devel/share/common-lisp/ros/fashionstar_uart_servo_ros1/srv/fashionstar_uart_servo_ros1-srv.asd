
(cl:in-package :asdf)

(defsystem "fashionstar_uart_servo_ros1-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "QueryServoAngle" :depends-on ("_package_QueryServoAngle"))
    (:file "_package_QueryServoAngle" :depends-on ("_package"))
  ))