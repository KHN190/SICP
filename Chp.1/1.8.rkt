(define (cube-iter guess x)
  (if (good-enough? guess x)
      (improve guess x)
      (cube-iter (improve guess x)
                 x)))

(define (improve guess x)
  (/ (+ (/ x (* guess guess)) 
        (* 2 guess))
     3))

(define (good-enough? guess x)
  (< (abs (- 1 (/ guess (improve guess x)))) 0.0001))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (cube x)
  (* x x x))