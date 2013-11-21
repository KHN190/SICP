;;use method (search-for-primes n) to find smallest prime greater than n.

;;fermat test.
(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 
         1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                       m))))

;;find smallest by fermat test.
(define (fast-prime? n times)
  (cond ((= times 0) 
         true)
        ((fermat-test n) 
         (fast-prime? n (- times 1)))
        (else 
         false)))

(define (square n)
  (* n n))

;;find next odd.
(define (next-odd n)
    (if (odd? n)
        (+ 2 n)
        (+ 1 n)))

;;continue n times.
(define (continue-primes n count)
    (cond ((= count 0)
            (display "are primes."))
          ((fast-prime? n 10)
            (display n)
            (newline)
            (continue-primes (next-odd n) (- count 1)))
          (else
            (continue-primes (next-odd n) count))))

;;main body.
(define (search-for-primes n)
    (let ((start-time (runtime)))
        (continue-primes n 12)
        (- (runtime) start-time)))

;;solutions and extra explainations.
;;see here:
;;http://sicp.readthedocs.org/en/latest/chp1/24.html