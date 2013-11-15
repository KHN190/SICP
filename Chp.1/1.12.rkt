;;;solve this problem by iteration.

(define (pascal row col)
    (/ (factorial row)
       (* (factorial col)
          (factorial (- row col)))))

(define (factorial n)
  (fact-iter 1 1 n))

(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))