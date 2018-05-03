#lang racket/base
(require rackunit)

; Calculate sum of a and the absolute value of b (change expression sign by condition (if b > 0)). 

(define (a-plus-abs-b a b)
    ((if (> b 0) + -) a b))

(check-equal? (a-plus-abs-b 1 (- 1)) 2)
(check-equal? (a-plus-abs-b 2 (- 4)) 6)
(check-equal? (a-plus-abs-b 1 5) 6)