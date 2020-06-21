#lang racket/base

(define (runtime) (current-milliseconds))

(define (search-for-primes n count)
    (define (search-for-primes-iter cur prime-count)
        (when (> count prime-count)
            (if (timed-prime-test cur)
                (search-for-primes-iter (+ cur 1) (+ prime-count 1))
                (search-for-primes-iter (+ cur 1) prime-count))))
    (search-for-primes-iter n 0))

(define (timed-prime-test n)
    (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
    (if (prime? n)
        (report-prime n (- (runtime) start-time))
        #f))

(define (report-prime n elapsed-time)
    (display "\n *** prime ")
    (newline)
    (display n)
    (newline)
    (display elapsed-time))

(define (smallest-divisor n)
    (find-divisor n 2))

(define (find-divisor n test-devisor)
    (cond ((> (square test-devisor) n) n)
    ((dividers? test-devisor n) test-devisor)
    (else (find-divisor n (+ test-devisor 1)))))

(define (square n)
    (* n n))

(define (dividers? a b)
    (= (remainder b a) 0))

(define (prime? n)
    (= n (smallest-divisor n)))

(search-for-primes 1000 3)
(search-for-primes 10000 3)
(search-for-primes 100000 3)

(search-for-primes 1000000000 3)
(search-for-primes 10000000000 3)
(search-for-primes 100000000000 3)

(search-for-primes 1000 5)
