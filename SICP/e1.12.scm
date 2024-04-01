;; Resursive solution to Pascal's Triangle
(define (pascal a b)
  (cond ((= b 1) 1)
	((= b a) 1)
	(else (+ (pascal (- a 1) (- b 1))
		 (pascal (- a 1) b)))))
