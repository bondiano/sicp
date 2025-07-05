#lang racket

(define (carmichael-test n)
  (define (try-it n a)
    (cond
      [(= a 1) #t]
      [(not (= (expmod a n n) a)) #f]
      [else (try-it n (- a 1))]))
  (try-it n (- n 1)))

(define (expmod base exp m)
  (cond
    [(= exp 0) 1]
    [(even? exp) (remainder (square (expmod base (/ exp 2) m)) m)]
    [else (remainder (* base (expmod base (- exp 1) m)) m)]))

(define (square a)
  (* a a))

(module+ test
  (require rackunit)
  (test-case "1_27"
    (check-equal? (carmichael-test 4) #f)
    (check-equal? (carmichael-test 3) #t)
    (check-equal? (carmichael-test 561) #t)
    (check-equal? (carmichael-test 1105) #t)
    (check-equal? (carmichael-test 1729) #t)
    (check-equal? (carmichael-test 2465) #t)
    (check-equal? (carmichael-test 2821) #t)
    (check-equal? (carmichael-test 6601) #t)))
