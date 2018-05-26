#lang racket/base

(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)
; 5

(new-if (= 1 1) 0 5)
; 0

(define (average x y)
    (/ (+ x y) 2))

(define (square x) 
    (* x x))

(define (improve guess x)
    (average guess (/ x guess)))

(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))

(define (sqrt-iter guess x)
    (new-if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x)
        x)))

(define (sqrt x)
    (sqrt-iter 1.0 x))

; Из-за аппликативного порядка вычислений Lisp интерпретатор сперва попробует вычислить аргументы, перед тем, как выполнить процедуру
; (new-if) и тк sqrt-iter рекурсивна, мы уходим в бесконечную рекурсию