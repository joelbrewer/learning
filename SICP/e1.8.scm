(define (good-enough? guess prev-guess x)
  (newline) (display "new-good-enough? Guess: ") (display guess) (display " Prev guess: ") (display prev-guess)
  (< (abs(- guess prev-guess))(/ guess 10)))

(define (cube-iter guess prev-guess x)
  (if (good-enough? guess prev-guess x)
      guess
      (cube-iter (cube-better-guess x guess) guess
		 x)))

(define (cube-better-guess x y)
  (/
   (+ (/ x (* y y))
      (* y 2))
   3))

(display (cube-iter 1 2 20))
(display (cube-iter 1 2 27))
