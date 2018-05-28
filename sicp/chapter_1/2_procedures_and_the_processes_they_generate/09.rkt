#lang racket/base

(define (dec val) 
  (- val 1))

(define (inc val)
  (+ val 1))

(define (p a b)
  (if (= a 0)
    b
    (inc (+ (dec a) b))))

(p 4 5)
; Процедура рекурсивная
; (+ 4 5)
; (inc (+ 3 5))
; (inc (inc (+ 2 5)))
; (inc (inc (inc (+ 1 5))))
; (inc (inc (inc (+ 0 5))))
; (inc (inc (inc (inc 5))))
; (inc (inc (inc 6))))
; (inc (inc 7))
; (inc 8)
; 9

(define (i a b)
  (if (= a 0)
  b
  (i (dec a) (inc b))))

(i 4 5) 
; (+ 4 5)
; (+ 3 6)
; (+ 2 7)
; (+ 1 8)
; (+ 0 9)
; 9