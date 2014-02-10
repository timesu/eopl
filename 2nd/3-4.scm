;;EOPL 2nd
;;Exercise 3-4
;;Test eval-program using both run and a read-eval-print loop

#lang eopl

(load "/home/tsu/Code/eopl/2nd/r5rs.scm")
(load "/home/tsu/Code/eopl/2nd/define-datatype.scm")
(load "/home/tsu/Code/eopl/2nd/2-3-2.scm")
(load "/home/tsu/Code/eopl/2nd/3-3.scm")
(load "/home/tsu/Code/eopl/2nd/3-eval.scm")

(define run
  (lambda (x)
    (eval-program (parse-program x))))

(run '(add1 3))
(run '5)
(run '(+ 2 1))
(run '(+ (add1 2) (- 6 4)))

(define read-eval-print
  (lambda ()
    (begin
      (display "--> ")
      (write (eval-program (parse-program (read))))
      (newline)
      (read-eval-print))))

(read-eval-print)
