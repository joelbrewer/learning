;; Recursive solution
(define (fun n)
  (cond ((< n 3) n)
	(else (+ (fun (- n 1))
		 (* (fun (- n 2)) 2)
		 (* (fun (- n 3)) 3)))))

;; Iterative solution
(define (fun-i n)
  (if (< n 3)
      n
      (fun-iter 2 1 0 (- n 3))))

(define (fun-iter a b c n)
  (if (= n 0)
      (+ a (* b 2) (* c 3))
      (fun-iter (+ a (* b 2) (* c 3)) a b (- n 1))))
