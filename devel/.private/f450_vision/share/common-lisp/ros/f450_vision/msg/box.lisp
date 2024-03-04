; Auto-generated. Do not edit!


(cl:in-package f450_vision-msg)


;//! \htmlinclude box.msg.html

(cl:defclass <box> (roslisp-msg-protocol:ros-message)
  ((box_center_X
    :reader box_center_X
    :initarg :box_center_X
    :type cl:float
    :initform 0.0)
   (box_center_Y
    :reader box_center_Y
    :initarg :box_center_Y
    :type cl:float
    :initform 0.0)
   (box_center_W
    :reader box_center_W
    :initarg :box_center_W
    :type cl:float
    :initform 0.0)
   (box_center_H
    :reader box_center_H
    :initarg :box_center_H
    :type cl:float
    :initform 0.0))
)

(cl:defclass box (<box>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <box>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'box)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name f450_vision-msg:<box> is deprecated: use f450_vision-msg:box instead.")))

(cl:ensure-generic-function 'box_center_X-val :lambda-list '(m))
(cl:defmethod box_center_X-val ((m <box>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader f450_vision-msg:box_center_X-val is deprecated.  Use f450_vision-msg:box_center_X instead.")
  (box_center_X m))

(cl:ensure-generic-function 'box_center_Y-val :lambda-list '(m))
(cl:defmethod box_center_Y-val ((m <box>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader f450_vision-msg:box_center_Y-val is deprecated.  Use f450_vision-msg:box_center_Y instead.")
  (box_center_Y m))

(cl:ensure-generic-function 'box_center_W-val :lambda-list '(m))
(cl:defmethod box_center_W-val ((m <box>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader f450_vision-msg:box_center_W-val is deprecated.  Use f450_vision-msg:box_center_W instead.")
  (box_center_W m))

(cl:ensure-generic-function 'box_center_H-val :lambda-list '(m))
(cl:defmethod box_center_H-val ((m <box>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader f450_vision-msg:box_center_H-val is deprecated.  Use f450_vision-msg:box_center_H instead.")
  (box_center_H m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <box>) ostream)
  "Serializes a message object of type '<box>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'box_center_X))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'box_center_Y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'box_center_W))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'box_center_H))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <box>) istream)
  "Deserializes a message object of type '<box>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'box_center_X) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'box_center_Y) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'box_center_W) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'box_center_H) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<box>)))
  "Returns string type for a message object of type '<box>"
  "f450_vision/box")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'box)))
  "Returns string type for a message object of type 'box"
  "f450_vision/box")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<box>)))
  "Returns md5sum for a message object of type '<box>"
  "f1a4a641427c15bc39cb4de0679f2e54")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'box)))
  "Returns md5sum for a message object of type 'box"
  "f1a4a641427c15bc39cb4de0679f2e54")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<box>)))
  "Returns full string definition for message of type '<box>"
  (cl:format cl:nil "float32 box_center_X~%float32 box_center_Y~%float32 box_center_W~%float32 box_center_H~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'box)))
  "Returns full string definition for message of type 'box"
  (cl:format cl:nil "float32 box_center_X~%float32 box_center_Y~%float32 box_center_W~%float32 box_center_H~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <box>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <box>))
  "Converts a ROS message object to a list"
  (cl:list 'box
    (cl:cons ':box_center_X (box_center_X msg))
    (cl:cons ':box_center_Y (box_center_Y msg))
    (cl:cons ':box_center_W (box_center_W msg))
    (cl:cons ':box_center_H (box_center_H msg))
))
