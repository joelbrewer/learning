(use-modules (ice-9 format))

(define (fib n)
  (display "a  b  p  q  count")
  (newline)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (format #t "~d  ~d  ~d  ~d  ~d" a b p q count)
  (newline)
  (cond ((= count 0) b)
	((even? count)
	 (fib-iter a
		   b
		   1;; q ;; compute p'
		   1 ;; (+ p q) ;; compute q'
		   (/ count 2)))
	(else (fib-iter (+ (* b q) (* a q) (* a p))
			(+ (* b p) (* a q))
			p
			q
			(- count 1)))))
