(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (good-enough? guess x)
  (newline)
  (display 'good-enough?)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x )
 (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x) (* x x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
		 x)))

;; new-if gets stuck in a loop because it always evaluates
;; all three of its parameters, including the else-clause.
;; Similar to recursion with no base case.
;; The if statement is a special form: it first evaluates the predicate, and
;; then evaluates the consequent (if the predicate evaluates to #t) or the
;; alternative (if the predicate evaluates to #f).

(define (new-sqrt-iter guess x)
  (newline) (display "new-sqrt-iter - guess: ") (display guess)
  (new-if (good-enough? guess x)
          guess
          (new-sqrt-iter (improve guess x)
                     x)))

