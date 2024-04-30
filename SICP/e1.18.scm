(define (fast-mult-iter a b n)
  (cond ((= n 1) (+ a b))
	((= n 0) 0)
	((even? n)
	 (fast-mult-iter a (double b) (/ n 2)))
	(else (fast-mult-iter (+ a b) b (- n 1)))))

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(define (even? n)
  (newline)
  (= (remainder n 2) 0))


	 
