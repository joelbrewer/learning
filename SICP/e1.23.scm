(define (timed-prime-test n)
  (start-prime-test n (get-internal-real-time)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (get-internal-real-time) start-time))))

(define (report-prime prime elapsed-time)
  (newline)
  (display " Prime: ")
  (display prime)
  (newline)
  (display " Elapsed ")
  (display elapsed-time)
  (newline))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)               ;; If n isn't prime, it must have a divisor less <= sqrt(n)
	((divides? test-divisor n) test-divisor)      ;; If the current test divides n, return it
	(else (find-divisor n (next test-divisor)))))  ;; If the current test doesn't divide n, increment by one and test again

(define (next n)
  (cond ((= n 2) 3)
	(else (+ n 2))))

(define (divides? a b)
  (= (remainder b a ) 0))

(define (square n)
  (* n n))


(define (search-for-primes s e max-primes)
  (define (iter e c n)
    (if (and (< n max-primes) (<= c e))
	(if (= (remainder (- c 1) 2) 0)
	    (if (prime? c)
		(begin
		  (timed-prime-test c)
		  (iter e (+ c 1) (+ n 1)))
		(iter e (+ c 1) n))
	    (iter e (+ c 1) n))))
  (iter e s 0))


(define (display-prime n)
  (display n)
  (newline))

;; n          | time
;; 1,000      | 2,500
;; 10,000     | 6,000
;; 100,000    | 15,000
;; 1,000,000  | 33,000

;; At higher numbers, this algorithm runs about twice as fast. It isn't as noticeable at lower numbers
