(define (fast-mult b n)
  (cond ((= n 0) 0)
	((= n 1) b)
	((even? n) (double (fast-mult b (halve n))))
	(else (+ b (fast-mult b (- n 1))))))

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(define (even? n)
  (= (remainder n 2) 0))
