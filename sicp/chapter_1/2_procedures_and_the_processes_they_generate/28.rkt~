#lang racket

(define (square x)
  (* x x))

(define (miller-rabin-expmod base exp m)
  (define (squaremod-with-check x)
    (define (check-nontrivial-sqrt1 x rem-square)
      (if (and (= rem-square 1) (not (= x 1)) (not (= x (- m 1)))) 0 rem-square))

    (check-nontrivial-sqrt1 x (remainder (square x) m)))

  (cond
    [(= exp 0) 1]
    [(even? exp) (squaremod-with-check (miller-rabin-expmod base (/ exp 2) m))]
    [else (remainder (* base (miller-rabin-expmod base (- exp 1) m)) m)]))

(define (miller-rabin-test n)
  (define (try-it a)
    (define (check-it x)
      (and (not (= x 0)) (= x 1)))
    (check-it (miller-rabin-expmod a (- n 1) n)))
  (try-it (+ 1 (random (- n 1)))))

(module+ test
  (require rackunit)
  (test-case "1_28"
    (check-equal? (miller-rabin-test 3) #t)
    (check-equal? (miller-rabin-test 4) #f)
    (check-equal? (miller-rabin-test 561) #f)
    (check-equal? (miller-rabin-test 1105) #f)
    (check-equal? (miller-rabin-test 1729) #f)
    (check-equal? (miller-rabin-test 2465) #f)
    (check-equal? (miller-rabin-test 2821) #f)
    (check-equal? (miller-rabin-test 6601) #f)
    (check-equal? (miller-rabin-test 19999) #f)
    (check-equal? (miller-rabin-test 1999) #t)))
