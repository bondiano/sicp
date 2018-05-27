#lang racket/base

(define (average x y)
  (/ (+ x y) 2))

(define (square x) 
  (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
  guess
  (sqrt-iter (improve guess x)
    x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

; Solution

(define (better-good-enough? guess perv-guess)
  (< (abs (- guess perv-guess)) 0.001))

(define (better-sqrt-iter guess x perv-guess)
  (if (better-good-enough? guess perv-guess)
  guess
  (better-sqrt-iter (improve guess x)
    x
    guess)))

(define (better-sqrt x)
    (better-sqrt-iter 1.0 x x))

(module+ test
  (require rackunit)
  (test-case
    "1_07"
      (check-equal? (round (better-sqrt 1)) 1.0)
      (check-equal? (round (better-sqrt 4)) 2.0)
      (check-equal? (round (better-sqrt 9)) 3.0)
      (check-equal? (round (better-sqrt 16)) 4.0)
      (check-equal? (round (better-sqrt 25)) 5.0)
  )
)