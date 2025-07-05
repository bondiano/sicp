#lang racket/base

(define (f x)
  (if (< x 3)
      x
      (+ (f (- x 1)) (* 2 (f (- x 2))) (* 3 (f (- x 3))))))

(define (f-iter x)
  (define (iter-step a b c count)
    (if (= count 0)
        c
        (iter-step (+ a (* 2 b) (* 3 c)) a b (- count 1))))
  (if (< x 3)
      x
      (iter-step 2 1 0 x)))

(module+ test
  (require rackunit)
  (test-case "1_11"
    (check-equal? (f 4) 11)
    (check-equal? (f-iter 4) 11)
    (check-equal? (f 3) 4)
    (check-equal? (f-iter 1) 1)))
