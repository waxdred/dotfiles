;;[
;;  "do"
;;  "for"
;;  "while"
;;  "yield"
;;] @repeat

;; (integer_literal) @number
;; (floating_point_literal) @float

[
  "=>"
;; "<-"
  "@"
] @operator

[
   "try"
   "catch"
;;   "throw"
] @exception
