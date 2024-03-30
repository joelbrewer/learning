(define (A x y)
  (cond ((= y 0) 0)
	((= x 0) (* 2 y))
	((= y 1) 2)
	(else (A (- x 1)
		 (A x (- y 1))))))
(define (puts n)
  (display n) (newline))

;; (A 1 10) ;; 1024
;; (A 2 4)  ;; 65536
;; (A 3 3)  ;; 65536

;; (A 0 n) = 2n
;; (A 1 n) = 2^n for n > 0
(display "1 ")(puts (A 1 1))
(display "2 ")(puts (A 1 2))
(display "3 ")(puts (A 1 3))
(display "4 ")(puts (A 1 4))
(newline)

;; (A 2 n) = 0 for n=0, 2 for n=1, 2^(2^2^2...(n times))







