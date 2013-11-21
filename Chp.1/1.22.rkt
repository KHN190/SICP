;;use method (search-for-primes n) to find smallest prime greater than n.

;;display n and runtime.
(define (time-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))
;;above is an example. they are not used in main program.

;;find smallest divisor.
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test)
  (cond ((> (square test) n) n)
        ((divides? test n) test)
        (else (find-divisor n (+ test 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square n)
  (* n n))

;;check if prime.
(define (prime? n)
  (= n (smallest-divisor n)))

;;find next odd.
(define (next-odd n)
    (if (odd? n)
        (+ 2 n)
        (+ 1 n)))

;;continue n times.
(define (continue-primes n count)
    (cond ((= count 0)
            (display "are primes."))
          ((prime? n)
            (display n)
            (newline)
            (continue-primes (next-odd n) (- count 1)))
          (else
            (continue-primes (next-odd n) count))))

;;main body.
(define (search-for-primes n)
    (let ((start-time (runtime)))
        (continue-primes n 3)
        (- (runtime) start-time)))