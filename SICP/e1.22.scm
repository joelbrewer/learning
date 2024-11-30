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

(define (prime? n)
  (= n (smallest-divisor n)))

;; (define (search-for-primes s e max-primes)
;;   (define (iter e c count)
;;     (if (and (<= c e) (< count max-primes))
;;         (begin
;;           (if (= (remainder (- c 1) 2) 0) ;; num is odd
;;               (begin
;;                 (timed-prime-test c)
;;                 (iter e (+ c 1) (+ count 1))))
;;           (iter e (+ c 1) count))))
;;   (iter e s 0))

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
;; 1,000      | 3,000
;; 10,000     | 6,000
;; 100,000    | 21,000
;; 1,000,000  | 72,000

