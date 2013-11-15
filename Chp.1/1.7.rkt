(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      (improve guess x)
      (sqrt-iter (improve guess x)
                 x)))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (good-enough? guess x)
  (< (abs (- 1 (/ guess (improve guess x)))) 0.0001))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (square x)
  (* x x))
