#lang racket/base
(require rackunit)


(define (smallest a b) (if (< a b) a b))

(check-equal? (smallest 1 2) 1)
(check-equal? (smallest 25 4) 4)
(check-equal? (smallest 100 10) 10)


(define (smallest-of-three first second third) 
    (smallest
    (smallest first second)
    (smallest second third)))

(check-equal? (smallest-of-three 1 2 3) 1)
(check-equal? (smallest-of-three 100 200 340) 100)
(check-equal? (smallest-of-three 228 322 1488) 228)


(define (square num) (* num num))

(check-equal? (square 1) 1)
(check-equal? (square 3) 9)
(check-equal? (square 14) 196)


(define (sum-of-three-squares first second third)
    (+ (square first) (square second) (square third)))

(check-equal? (sum-of-three-squares 1 2 3) 14)
(check-equal? (sum-of-three-squares 5 6 5) 86)
(check-equal? (sum-of-three-squares 2 2 2) 12)

(define (sum-of-two-greater-squares first second third)
    (- 
        (sum-of-three-squares first second third)
        (square (smallest-of-three first second third))))
 
(check-equal? (sum-of-two-greater-squares 1 2 3) 13)
(check-equal? (sum-of-two-greater-squares 5 4 1) 41) ; 25+16
(check-equal? (sum-of-two-greater-squares 10 5 2) 125) 
