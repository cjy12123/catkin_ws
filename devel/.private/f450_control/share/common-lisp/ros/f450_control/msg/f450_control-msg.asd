
(cl:in-package :asdf)

(defsystem "f450_control-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "flag" :depends-on ("_package_flag"))
    (:file "_package_flag" :depends-on ("_package"))
  ))