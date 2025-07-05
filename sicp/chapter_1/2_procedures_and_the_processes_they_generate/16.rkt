#lang racket/base

(define (even? n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))

(define (fast-expt-rec b n)
  (cond
    [(= n 0) 1]
    [(even? n) (square (fast-expt-rec b (/ n 2)))]
    [else (* b (fast-expt-rec b (- n 1)))]))

(define (fast-expt-iter b n invariant)
  (cond
    [(= n 0) invariant]
    [(even? n) (fast-expt-iter (square b) (/ n 2) invariant)]
    [(fast-expt-iter b (- n 1) (* b invariant))]))

(define (fast-expt b n)
  (fast-expt-iter b n 1))

(module+ test
  (require rackunit)
  (test-case "1_16"
    (check-equal? (even? 1) #f)
    (check-equal? (even? 2) #t)
    (check-equal? (even? 3) #f)
    (check-equal? (fast-expt-rec 3 2) 9)
    (check-equal? (fast-expt 1 0) (fast-expt-rec 1 0))
    (check-equal? (fast-expt 1 3) (fast-expt-rec 1 3))
    (check-equal? (fast-expt 5 1) (fast-expt-rec 5 1))
    (check-equal? (fast-expt 3 2) (fast-expt-rec 3 2))
    (check-equal? (fast-expt 3 3) (fast-expt-rec 3 3))
    (check-equal? (fast-expt 3 4) (fast-expt-rec 3 4))
    (check-equal? (fast-expt 2 7) (fast-expt-rec 2 7))))
