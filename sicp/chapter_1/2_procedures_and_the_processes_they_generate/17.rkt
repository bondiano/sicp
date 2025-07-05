#lang racket

(define (fast-mul a b)
  (cond
    [(= a 0) 0]
    [(even? a) (fast-mul (/ a 2) (+ b b))]
    [else (+ b (fast-mul (- a 1) b))]))
