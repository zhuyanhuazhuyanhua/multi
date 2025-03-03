// Generated by gencpp from file fashionstar_uart_servo_ros1/QueryServoAngleRequest.msg
// DO NOT EDIT!


#ifndef FASHIONSTAR_UART_SERVO_ROS1_MESSAGE_QUERYSERVOANGLEREQUEST_H
#define FASHIONSTAR_UART_SERVO_ROS1_MESSAGE_QUERYSERVOANGLEREQUEST_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace fashionstar_uart_servo_ros1
{
template <class ContainerAllocator>
struct QueryServoAngleRequest_
{
  typedef QueryServoAngleRequest_<ContainerAllocator> Type;

  QueryServoAngleRequest_()
    : id(0)  {
    }
  QueryServoAngleRequest_(const ContainerAllocator& _alloc)
    : id(0)  {
  (void)_alloc;
    }



   typedef uint8_t _id_type;
  _id_type id;





  typedef boost::shared_ptr< ::fashionstar_uart_servo_ros1::QueryServoAngleRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::fashionstar_uart_servo_ros1::QueryServoAngleRequest_<ContainerAllocator> const> ConstPtr;

}; // struct QueryServoAngleRequest_

typedef ::fashionstar_uart_servo_ros1::QueryServoAngleRequest_<std::allocator<void> > QueryServoAngleRequest;

typedef boost::shared_ptr< ::fashionstar_uart_servo_ros1::QueryServoAngleRequest > QueryServoAngleRequestPtr;
typedef boost::shared_ptr< ::fashionstar_uart_servo_ros1::QueryServoAngleRequest const> QueryServoAngleRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::fashionstar_uart_servo_ros1::QueryServoAngleRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::fashionstar_uart_servo_ros1::QueryServoAngleRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::fashionstar_uart_servo_ros1::QueryServoAngleRequest_<ContainerAllocator1> & lhs, const ::fashionstar_uart_servo_ros1::QueryServoAngleRequest_<ContainerAllocator2> & rhs)
{
  return lhs.id == rhs.id;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::fashionstar_uart_servo_ros1::QueryServoAngleRequest_<ContainerAllocator1> & lhs, const ::fashionstar_uart_servo_ros1::QueryServoAngleRequest_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace fashionstar_uart_servo_ros1

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::fashionstar_uart_servo_ros1::QueryServoAngleRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::fashionstar_uart_servo_ros1::QueryServoAngleRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::fashionstar_uart_servo_ros1::QueryServoAngleRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::fashionstar_uart_servo_ros1::QueryServoAngleRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::fashionstar_uart_servo_ros1::QueryServoAngleRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::fashionstar_uart_servo_ros1::QueryServoAngleRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::fashionstar_uart_servo_ros1::QueryServoAngleRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "541b98e964705918fa8eb206b65347b3";
  }

  static const char* value(const ::fashionstar_uart_servo_ros1::QueryServoAngleRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x541b98e964705918ULL;
  static const uint64_t static_value2 = 0xfa8eb206b65347b3ULL;
};

template<class ContainerAllocator>
struct DataType< ::fashionstar_uart_servo_ros1::QueryServoAngleRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "fashionstar_uart_servo_ros1/QueryServoAngleRequest";
  }

  static const char* value(const ::fashionstar_uart_servo_ros1::QueryServoAngleRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::fashionstar_uart_servo_ros1::QueryServoAngleRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint8 id\n"
;
  }

  static const char* value(const ::fashionstar_uart_servo_ros1::QueryServoAngleRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::fashionstar_uart_servo_ros1::QueryServoAngleRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.id);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct QueryServoAngleRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::fashionstar_uart_servo_ros1::QueryServoAngleRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::fashionstar_uart_servo_ros1::QueryServoAngleRequest_<ContainerAllocator>& v)
  {
    s << indent << "id: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.id);
  }
};

} // namespace message_operations
} // namespace ros

#endif // FASHIONSTAR_UART_SERVO_ROS1_MESSAGE_QUERYSERVOANGLEREQUEST_H
