
(cl:in-package :asdf)

(defsystem "f450_vision-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "box" :depends-on ("_package_box"))
    (:file "_package_box" :depends-on ("_package"))
  ))