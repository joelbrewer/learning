(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	 ((divides? test-divisor n) test-divisor)
	 (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a ) 0))

(define (square n)
  (* n n))

;; smallest divisors:
;; 199   | 199
;; 1999  | 1999

;; 19999 | 7
