(define (gcd a b)
  (newline)
  (display "a: ")(display a)(display "  ")(display "b: ")(display b)
  
  (if (= b 0)
      a
      (gcd b (remainder a b))))

;; Applicative order evaluation:
;; remainder(206 40) => 6
;; remainder(40 6) => 4
;; remainder(6 4) => 2
;; remainder(4 2) => 0
;; remainder(2 0) => 2

;; First call
(gcd 206 40)

(if (= 40 0)
    206
    (gcd 40 (remainder 206 40)))

;; 40 isn't 0, so we proceed to evaluate (gcd 40 (remainder 206 40))

(gcd 40 (remainder 206 40))

(if (= (remainder 206 40) 0)
    40
    (gcd (remainder 206 40)
	 (remainder 40 (remainder 206 40)))) ;; evaluate (remainder 206 40) => 6 (*1*)

(gcd (remainder 206 40)
     (remainder 40 (remainder 206 40)))

(if (= (remainder 40 (remainder 206 40)) 0) ;; evaluate (remainder 40 (remainder 206 40)) => (remainder 40 6) => 4 (*2*)
    (remainder 206 40)
    (gcd (remainder 40 (remainder 206 40))
	 (remainder (remainder 206 40)
		    (remainder 40 (remainder 206 40)))))

(gcd (remainder 40 (remainder 206 40))
     (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))

(if (= (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) 0)
    (remainder 40 (remainder 206 40))
    (gcd (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
         (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))
;; (remainder (remainder 206 40)
;;	      (remainder 40 (remainder 206 40))) => 2 (*4*)

(gcd
 (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
 (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))

(if (= (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))) 0)
 (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))
 (gcd
  (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40)))))
  (remainder (remainder (remainder 206 40) (remainder 40 (remainder 206 40))) (remainder (remainder 40 (remainder 206 40)) (remainder (remainder 206 40) (remainder 40 (remainder 206 40))))))

;; 7 more
    







    
    









;; Normal-order evaluation:

;; a    b    r
;; 206  40   6 
;; 40   6    4  
;; 6    4    2
;; 4    2    0

;; Five remainders performed in the applicative order
;; Four remainders performed in the normal order (Very wrong, ha)
;; Normal-order evaluation fully expands and then reduces. Next: write out the fully expanded expression.



(define (test x y)
  (if (> x 0)
      x
      y))









































