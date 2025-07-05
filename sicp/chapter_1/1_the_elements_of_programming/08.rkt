#lang racket/base

(define (square x)
  (* x x))

(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess perv-guess)
  (< (abs (- guess perv-guess)) 0.001))

(define (cube-root-iter guess x perv-guess)
  (if (good-enough? guess perv-guess)
      guess
      (cube-root-iter (improve guess x) x guess)))

(define (cube-root x)
  (cube-root-iter 1.0 x x))

(cube-root 27)
; 3.0

(module+ test
  (require rackunit)
  (test-case "1_08"
    (check-equal? (round (cube-root 1)) 1.0)
    (check-equal? (round (cube-root 8)) 2.0)
    (check-equal? (round (cube-root 27)) 3.0)
    (check-equal? (round (cube-root 64)) 4.0)
    (check-equal? (round (cube-root 125)) 5.0)))
