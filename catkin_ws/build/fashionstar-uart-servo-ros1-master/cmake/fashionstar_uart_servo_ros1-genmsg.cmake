# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "fashionstar_uart_servo_ros1: 2 messages, 1 services")

set(MSG_I_FLAGS "-Ifashionstar_uart_servo_ros1:/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg;-Istd_msgs:/opt/ros/melodic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(fashionstar_uart_servo_ros1_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg/SetServoDamping.msg" NAME_WE)
add_custom_target(_fashionstar_uart_servo_ros1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "fashionstar_uart_servo_ros1" "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg/SetServoDamping.msg" ""
)

get_filename_component(_filename "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg/SetServoAngle.msg" NAME_WE)
add_custom_target(_fashionstar_uart_servo_ros1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "fashionstar_uart_servo_ros1" "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg/SetServoAngle.msg" ""
)

get_filename_component(_filename "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/srv/QueryServoAngle.srv" NAME_WE)
add_custom_target(_fashionstar_uart_servo_ros1_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "fashionstar_uart_servo_ros1" "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/srv/QueryServoAngle.srv" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(fashionstar_uart_servo_ros1
  "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg/SetServoDamping.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fashionstar_uart_servo_ros1
)
_generate_msg_cpp(fashionstar_uart_servo_ros1
  "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg/SetServoAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fashionstar_uart_servo_ros1
)

### Generating Services
_generate_srv_cpp(fashionstar_uart_servo_ros1
  "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/srv/QueryServoAngle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fashionstar_uart_servo_ros1
)

### Generating Module File
_generate_module_cpp(fashionstar_uart_servo_ros1
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fashionstar_uart_servo_ros1
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(fashionstar_uart_servo_ros1_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(fashionstar_uart_servo_ros1_generate_messages fashionstar_uart_servo_ros1_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg/SetServoDamping.msg" NAME_WE)
add_dependencies(fashionstar_uart_servo_ros1_generate_messages_cpp _fashionstar_uart_servo_ros1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg/SetServoAngle.msg" NAME_WE)
add_dependencies(fashionstar_uart_servo_ros1_generate_messages_cpp _fashionstar_uart_servo_ros1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/srv/QueryServoAngle.srv" NAME_WE)
add_dependencies(fashionstar_uart_servo_ros1_generate_messages_cpp _fashionstar_uart_servo_ros1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(fashionstar_uart_servo_ros1_gencpp)
add_dependencies(fashionstar_uart_servo_ros1_gencpp fashionstar_uart_servo_ros1_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS fashionstar_uart_servo_ros1_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(fashionstar_uart_servo_ros1
  "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg/SetServoDamping.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fashionstar_uart_servo_ros1
)
_generate_msg_eus(fashionstar_uart_servo_ros1
  "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg/SetServoAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fashionstar_uart_servo_ros1
)

### Generating Services
_generate_srv_eus(fashionstar_uart_servo_ros1
  "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/srv/QueryServoAngle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fashionstar_uart_servo_ros1
)

### Generating Module File
_generate_module_eus(fashionstar_uart_servo_ros1
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fashionstar_uart_servo_ros1
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(fashionstar_uart_servo_ros1_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(fashionstar_uart_servo_ros1_generate_messages fashionstar_uart_servo_ros1_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg/SetServoDamping.msg" NAME_WE)
add_dependencies(fashionstar_uart_servo_ros1_generate_messages_eus _fashionstar_uart_servo_ros1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg/SetServoAngle.msg" NAME_WE)
add_dependencies(fashionstar_uart_servo_ros1_generate_messages_eus _fashionstar_uart_servo_ros1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/srv/QueryServoAngle.srv" NAME_WE)
add_dependencies(fashionstar_uart_servo_ros1_generate_messages_eus _fashionstar_uart_servo_ros1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(fashionstar_uart_servo_ros1_geneus)
add_dependencies(fashionstar_uart_servo_ros1_geneus fashionstar_uart_servo_ros1_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS fashionstar_uart_servo_ros1_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(fashionstar_uart_servo_ros1
  "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg/SetServoDamping.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fashionstar_uart_servo_ros1
)
_generate_msg_lisp(fashionstar_uart_servo_ros1
  "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg/SetServoAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fashionstar_uart_servo_ros1
)

### Generating Services
_generate_srv_lisp(fashionstar_uart_servo_ros1
  "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/srv/QueryServoAngle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fashionstar_uart_servo_ros1
)

### Generating Module File
_generate_module_lisp(fashionstar_uart_servo_ros1
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fashionstar_uart_servo_ros1
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(fashionstar_uart_servo_ros1_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(fashionstar_uart_servo_ros1_generate_messages fashionstar_uart_servo_ros1_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg/SetServoDamping.msg" NAME_WE)
add_dependencies(fashionstar_uart_servo_ros1_generate_messages_lisp _fashionstar_uart_servo_ros1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg/SetServoAngle.msg" NAME_WE)
add_dependencies(fashionstar_uart_servo_ros1_generate_messages_lisp _fashionstar_uart_servo_ros1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/srv/QueryServoAngle.srv" NAME_WE)
add_dependencies(fashionstar_uart_servo_ros1_generate_messages_lisp _fashionstar_uart_servo_ros1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(fashionstar_uart_servo_ros1_genlisp)
add_dependencies(fashionstar_uart_servo_ros1_genlisp fashionstar_uart_servo_ros1_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS fashionstar_uart_servo_ros1_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(fashionstar_uart_servo_ros1
  "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg/SetServoDamping.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fashionstar_uart_servo_ros1
)
_generate_msg_nodejs(fashionstar_uart_servo_ros1
  "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg/SetServoAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fashionstar_uart_servo_ros1
)

### Generating Services
_generate_srv_nodejs(fashionstar_uart_servo_ros1
  "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/srv/QueryServoAngle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fashionstar_uart_servo_ros1
)

### Generating Module File
_generate_module_nodejs(fashionstar_uart_servo_ros1
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fashionstar_uart_servo_ros1
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(fashionstar_uart_servo_ros1_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(fashionstar_uart_servo_ros1_generate_messages fashionstar_uart_servo_ros1_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg/SetServoDamping.msg" NAME_WE)
add_dependencies(fashionstar_uart_servo_ros1_generate_messages_nodejs _fashionstar_uart_servo_ros1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg/SetServoAngle.msg" NAME_WE)
add_dependencies(fashionstar_uart_servo_ros1_generate_messages_nodejs _fashionstar_uart_servo_ros1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/srv/QueryServoAngle.srv" NAME_WE)
add_dependencies(fashionstar_uart_servo_ros1_generate_messages_nodejs _fashionstar_uart_servo_ros1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(fashionstar_uart_servo_ros1_gennodejs)
add_dependencies(fashionstar_uart_servo_ros1_gennodejs fashionstar_uart_servo_ros1_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS fashionstar_uart_servo_ros1_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(fashionstar_uart_servo_ros1
  "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg/SetServoDamping.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fashionstar_uart_servo_ros1
)
_generate_msg_py(fashionstar_uart_servo_ros1
  "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg/SetServoAngle.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fashionstar_uart_servo_ros1
)

### Generating Services
_generate_srv_py(fashionstar_uart_servo_ros1
  "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/srv/QueryServoAngle.srv"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fashionstar_uart_servo_ros1
)

### Generating Module File
_generate_module_py(fashionstar_uart_servo_ros1
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fashionstar_uart_servo_ros1
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(fashionstar_uart_servo_ros1_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(fashionstar_uart_servo_ros1_generate_messages fashionstar_uart_servo_ros1_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg/SetServoDamping.msg" NAME_WE)
add_dependencies(fashionstar_uart_servo_ros1_generate_messages_py _fashionstar_uart_servo_ros1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/msg/SetServoAngle.msg" NAME_WE)
add_dependencies(fashionstar_uart_servo_ros1_generate_messages_py _fashionstar_uart_servo_ros1_generate_messages_check_deps_${_filename})
get_filename_component(_filename "/home/jetson/catkin_ws/src/fashionstar-uart-servo-ros1-master/srv/QueryServoAngle.srv" NAME_WE)
add_dependencies(fashionstar_uart_servo_ros1_generate_messages_py _fashionstar_uart_servo_ros1_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(fashionstar_uart_servo_ros1_genpy)
add_dependencies(fashionstar_uart_servo_ros1_genpy fashionstar_uart_servo_ros1_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS fashionstar_uart_servo_ros1_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fashionstar_uart_servo_ros1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/fashionstar_uart_servo_ros1
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(fashionstar_uart_servo_ros1_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fashionstar_uart_servo_ros1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/fashionstar_uart_servo_ros1
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(fashionstar_uart_servo_ros1_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fashionstar_uart_servo_ros1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/fashionstar_uart_servo_ros1
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(fashionstar_uart_servo_ros1_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fashionstar_uart_servo_ros1)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/fashionstar_uart_servo_ros1
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(fashionstar_uart_servo_ros1_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fashionstar_uart_servo_ros1)
  install(CODE "execute_process(COMMAND \"/usr/bin/python2\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fashionstar_uart_servo_ros1\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/fashionstar_uart_servo_ros1
    DESTINATION ${genpy_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(fashionstar_uart_servo_ros1_generate_messages_py std_msgs_generate_messages_py)
endif()
