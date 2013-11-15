(define (multi-iter a b)
  (multi a b 0))

(define (multi a b product)
  (cond ((= b 0)
         product) ;;Why there shouldn't be '0'??? It always output '0'.)
        ((even? b)
          (multi (double a) 
                 (halve b) 
                  product))
        ((odd? b)
          (multi a 
                 (- b 1) 
                 (+ a product)))))

(define (double x)
  (+ x x))
(define (halve x)
  (/ x 2))