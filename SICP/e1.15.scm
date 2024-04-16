(define (cube x) (* x x x))

(define (p x) (display 'X) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))
;; a) Procedure p is applied five times when (sine 12.15) is evaluated - Missed by one because I logged the sine fxn
;; b) Order of growth:
;;    Time:  O(log n)
;;    Space: O(log n)
