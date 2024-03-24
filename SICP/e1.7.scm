(define (good-enough? guess x)
  (newline) (display "good-enough? Guess: ") (display guess)
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

;; good-enough? will not be very effective for finding sq roots of small numbers.
;; show example of test failing with small numbers

;; Our current implementation of good-enough? breaks down when the square of the guess is less than 0.002
;; Any number smaller than 0.002 will cause the test to pass, regardless of how close the guess is.
;; Here's an example of a failing test. The actual square root is 0.01, but the closest the
;; program gets is 0.0323
(display (sqrt-iter 1 0.0001))

;; In real computers, arithmetic operations are almost always performed
;; with limited precision, making test inadequate for very large numbers.
;; show example of test failing with large numbers

;; Our current implementation of good-enough? breaks down when calculating the square of a large number
;; See the below example:

(display (sqrt-iter 1 100000))

;; Our new implementation of good enough compares the difference between our guesses
;; and returns true when the next guess is within a hundredth of the previous guess
(define (new-good-enough? guess prev-guess x)
  (newline) (display "new-good-enough? Guess: ") (display guess) (display " Prev guess: ") (display prev-guess)
  (< (abs(- guess prev-guess))(/ guess 100)))

(define (new-sqrt-iter guess prev-guess x)
  (if (new-good-enough? guess prev-guess x)
      guess
      (new-sqrt-iter (improve guess x) guess
		 x)))

(display (new-sqrt-iter 1 2 0.0001))
(display (new-sqrt-iter 1 2 100000))
