(define (fast-expt-iter a b n)
  (cond ((= n 0) a)
	((even? n)
	 (fast-expt-iter
	  (* a (square b))
	  (square b)
	  (- (/ n 2) 1)))
	(else (fast-expt-iter (* a b) b (- n 1)))))

(define (square n)
  (* n n))

(define (even? n)
  (= (remainder n 2) 0))


	 

