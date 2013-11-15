(define (f-rec n)
  (if (< n 3) n
      (+ (f-rec (- n 1)) (* (f-rec (- n 2)) 2) (* (f-rec (- n 3)) 3))))

(define (f-iter n)
  (if (< n 3) n
      (plus 2 1 0 0 n)))
(define (plus a b c i n)
  (if (= i n)
      c
      (plus (+ a (* 2 b) (* 3 c))
            a
            b
            (+ i 1)
            n)))