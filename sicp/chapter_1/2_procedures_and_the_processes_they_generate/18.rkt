#lang racket

(define (mul-iter a b)
  (define (iter A B acc)
    (cond
      [(= B 0) acc]
      [(even? B)
       (iter (+ A A) (/ B 2) acc)] ; very interesting that acc isn't modified in this iteration
      [else (iter A (- B 1) (+ acc A))]))
  (iter a b 0))
