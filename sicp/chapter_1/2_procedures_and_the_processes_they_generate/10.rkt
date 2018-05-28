#lang racket/base

(define (A x y)
    (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
            (A x (- y 1))))))

(A 1 10)
; 1024

(A 2 4)
; 65536

(A 3 3)
; 65536

(define (f n) (A 0 n))
; (f n) = 2*n - из определения
(module+ test
  (require rackunit)
 
  (test-case
    "1_10 (f n)"
    (check-equal? (f 0) 0)
    (check-equal? (f 1) 2)
    (check-equal? (f 2) 4)
    (check-equal? (f 3) 6)
    (check-equal? (f 4) 8)
    (check-equal? (f 5) 10)
  )
)

(define (g n) (A 1 n))
; (g n) = 2^n, n>0,
; (g 0) = 0.
(module+ test
  (require rackunit)
 
  (test-case
    "1_10 (g n)"
    (check-equal? (g 0) 0)
    (check-equal? (g 1) 2)
    (check-equal? (g 2) 4)
    (check-equal? (g 3) 8)
    (check-equal? (g 4) 16)
    (check-equal? (g 5) 32)
    (check-equal? (g 10) 1024)
  )
)

(define (h n) (A 2 n))
; (h n) = 2^(2^(2^...)), число степеней равно n, при n > 0,
; (h 0) = 0.
(module+ test
  (require rackunit)
 
  (test-case
    "1_10 (h n)"
    (check-equal? (h 0) 0)
    (check-equal? (h 1) 2)
    (check-equal? (h 2) 4)
    (check-equal? (h 3) 16)
    (check-equal? (h 4) 65536)
  )
)

(define (k n) (* 5 n n))
; 5*n^2