#lang racket

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-devisor)
  (cond
    [(> (square test-devisor) n) n]
    [(dividers? test-devisor n) test-devisor]
    [else (find-divisor n (+ test-devisor 1))]))

(define (square n)
  (* n n))

(define (dividers? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(smallest-divisor 199)
(prime? 199)
(smallest-divisor 1999)
(prime? 1999)
(smallest-divisor 19999)
(prime? 19999)
