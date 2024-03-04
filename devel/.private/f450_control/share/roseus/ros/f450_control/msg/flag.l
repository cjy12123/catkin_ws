;; Auto-generated. Do not edit!


(when (boundp 'f450_control::flag)
  (if (not (find-package "F450_CONTROL"))
    (make-package "F450_CONTROL"))
  (shadow 'flag (find-package "F450_CONTROL")))
(unless (find-package "F450_CONTROL::FLAG")
  (make-package "F450_CONTROL::FLAG"))

(in-package "ROS")
;;//! \htmlinclude flag.msg.html


(defclass f450_control::flag
  :super ros::object
  :slots (_flag ))

(defmethod f450_control::flag
  (:init
   (&key
    ((:flag __flag) 0)
    )
   (send-super :init)
   (setq _flag (round __flag))
   self)
  (:flag
   (&optional __flag)
   (if __flag (setq _flag __flag)) _flag)
  (:serialization-length
   ()
   (+
    ;; int16 _flag
    2
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16 _flag
       (write-word _flag s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16 _flag
     (setq _flag (sys::peek buf ptr- :short)) (incf ptr- 2)
   ;;
   self)
  )

(setf (get f450_control::flag :md5sum-) "703f20323013a67a9ef8aed4c09680ee")
(setf (get f450_control::flag :datatype-) "f450_control/flag")
(setf (get f450_control::flag :definition-)
      "int16 flag
")



(provide :f450_control/flag "703f20323013a67a9ef8aed4c09680ee")


