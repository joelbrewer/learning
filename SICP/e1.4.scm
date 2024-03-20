;; if b is greater than 0, add a and b, otherwise subtract b from a
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 3 -4) ;; 7
(a-plus-abs-b -2 -4) ;; 2