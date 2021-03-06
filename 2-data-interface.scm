;;EOPL
;;EXAMPLE
;;2.1 Specifying Data via Interfaces
;;PAGE 31
;;https://github.com/mwand/eopl3/blob/master/chapter2/sec2.1.scm
(require "utils.scm")
#lang eopl

(let ()
  ;; Unary Representation
  ;; page 33
  (define zero (lambda () '()))
  (define is-zero? (lambda (n) (null? n)))
  (define successor (lambda (n) (cons #t n)))
  (define predecessor (lambda (n) (cdr n)))
  
  ;; Need this style of definition to define a recursive function
  ;; inside a let, sorry.
  (define (plus x y)
    (if (is-zero? x)
        y
        (successor (plus (predecessor x) y))))
  
  (define (scheme-int->my-int n)
    (if (zero? n) (zero)
        (successor (scheme-int->my-int (- n 1)))))
  
  (define (my-int->scheme-int x)
    (if (is-zero? x) 0
        (+ 1 (my-int->scheme-int (predecessor x)))))
  
  (equal??
   (my-int->scheme-int
    (plus
     (scheme-int->my-int 3)
     (scheme-int->my-int 7)))
   10)
  
  (report-unit-tests-completed 'unary-representation)
  )

(let ()
    ;; Scheme number representation
    ;; page 33
    (define zero (lambda () 0))
    (define is-zero? (lambda (n) (zero? n)))
    (define successor (lambda (n) (+ n 1)))
    (define predecessor (lambda (n) (- n 1)))

    (define (plus x y)
      (if (is-zero? x)
        y
        (successor (plus (predecessor x) y))))

    (equal?? (plus 3 7) 10)

    (report-unit-tests-completed 'scheme-number-representation)

    )

