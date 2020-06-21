#lang racket/base

(define (f-rec n)
    (if (< n 3)
        n
        (+ (f-rec (- n 1)) (f-rec (- n 2)) (f-rec (- n  3)))))

(define (f-iter n)
    (define (iter last perv perv-perv counter)
        (if (= counter n)
            last
            (iter (+ last perv perv-perv) last perv (+ counter 1))))
    (if (< n 3)
        n
        (iter 3 2 1 3)))


(module+ test
  (require rackunit)
  (test-case
    "1_11"
    (check-equal? (f-rec 0) 0)
    (check-equal? (f-rec 2) 2)
    (check-equal? (f-rec 3) 3)
    (check-equal? (f-rec 4) 6)
    (check-equal? (f-rec 1) (f-iter 1))
    (check-equal? (f-rec 5) (f-iter 5))
    (check-equal? (f-rec 8) (f-iter 8))
    (check-equal? (f-rec 10) (f-iter 10))
  )
)
