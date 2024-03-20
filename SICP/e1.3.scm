(define (square x) (* x x))

(define (sum-sq-largest a b c)
    (cond ((and (< a b) (< a c)) (+ (square b) (square c)))
          ((and (< b a) (< b c)) (+ (square a) (square c)))
          (else (+ (square a) (square b)))))
          
(newline)
(display (sum-sq-largest 1 2 3))