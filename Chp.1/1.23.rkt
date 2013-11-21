(define (next n)
    (if (= n 2)
        3
        (+ n 2)))

(define (find-divisor n test-divisor)
    (cond ((> (square test-divisor) n)
            n)
          ((divides? test-divisor n)
            test-divisor)
          (else
            (find-divisor n (next test-divisor)))))

(define (next-odd n)
    (if (odd? n)
        (+ 2 n)
        (+ 1 n)))

(define (prime? n)
    (= n (smallest-divisor n)))

(define (smallest-divisor n)
    (find-divisor n 2))

(define (square n)
  (* n n))

(define (divides? a b)
  (= (remainder b a) 0))

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