(define (search f neg-point)
  (let ((midpoint (average neg-point pos-point)))
    (if (close-enough? neg-point pos-point)
        midpoint
        (let ((test-value (f midpoint)))
          (cond ((positive? test-value)
                 (search f neg-point midpoint))
                ((negative? test-value)
                 (search f midpoint pos-point))
                 (else midpoint))))))

(define (close-enough? x y)
  (< (abs (- x y)) 0.001))

;;main abstraction, who calls the functions.
(define (half-interval-method f a b)
  (let ((a-value (f a))
        (b-value (f b)))
    (cond ((and (negtive? a-value) (positive? b-value))
           (search f a b))
          ((and (negtive? b-value) (positive? a-value))
           (search f b a))
          (else
           (error "Values are not of opposite sign" a b)))))

(define (average x y)
  (/ (+ x y) 2))
(define (negative? x)
  (< x 0))
(define (pasitive? x)
  (> x 0))