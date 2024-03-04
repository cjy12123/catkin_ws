; Auto-generated. Do not edit!


(cl:in-package f450_control-msg)


;//! \htmlinclude flag.msg.html

(cl:defclass <flag> (roslisp-msg-protocol:ros-message)
  ((flag
    :reader flag
    :initarg :flag
    :type cl:fixnum
    :initform 0))
)

(cl:defclass flag (<flag>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <flag>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'flag)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name f450_control-msg:<flag> is deprecated: use f450_control-msg:flag instead.")))

(cl:ensure-generic-function 'flag-val :lambda-list '(m))
(cl:defmethod flag-val ((m <flag>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader f450_control-msg:flag-val is deprecated.  Use f450_control-msg:flag instead.")
  (flag m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <flag>) ostream)
  "Serializes a message object of type '<flag>"
  (cl:let* ((signed (cl:slot-value msg 'flag)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <flag>) istream)
  "Deserializes a message object of type '<flag>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'flag) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<flag>)))
  "Returns string type for a message object of type '<flag>"
  "f450_control/flag")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'flag)))
  "Returns string type for a message object of type 'flag"
  "f450_control/flag")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<flag>)))
  "Returns md5sum for a message object of type '<flag>"
  "703f20323013a67a9ef8aed4c09680ee")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'flag)))
  "Returns md5sum for a message object of type 'flag"
  "703f20323013a67a9ef8aed4c09680ee")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<flag>)))
  "Returns full string definition for message of type '<flag>"
  (cl:format cl:nil "int16 flag~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'flag)))
  "Returns full string definition for message of type 'flag"
  (cl:format cl:nil "int16 flag~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <flag>))
  (cl:+ 0
     2
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <flag>))
  "Converts a ROS message object to a list"
  (cl:list 'flag
    (cl:cons ':flag (flag msg))
))
