(define (p) (p))

(define (test x y)
  (if (= x 0)
    0
    y))

(+ 4 4)



(display (test 0 (p)))

;; Normal-order
;; (test 0 (p))
;; (if (= 0 0)
;;   0
;;   p))
;; Never has to evaluate p, because the logic stops before it gets there, so it returns 0

;; Applicative-order
;; Immediately evaluates and gets stuck in a loop:
;; (test 0 (p))
;; p gets evaluated to p, which gets evaluated to p, which...
