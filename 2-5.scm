;;EOPL 
;;Exercise 2.5
;;
; We can use any data structure for representing environments, if we can
; distinguish empty environments from non-empty ones, and in which one can
; extract the pieces of a non-empty environment. Implement environments using
; a representation in which the empty environment is represented as the empty
; list, and in which extend-env builds an environment that looks like
;
; +---+---+
; | o | o ---> saved-env
; +-|-+---+
; |
; V
; +---+---+
; | o | o ---> saved-val
; +-|-+---+
; |
; V
; saved-var
;
; This is called an a-list or association-list representation.
;;https://github.com/skanev/playground/blob/master/scheme/eopl/02/05.scm


(require "utils.scm")
#lang eopl

(define (empty-env)
  '())
;(define empty-env1 '())

;;accociation list
(define extend-env
  (lambda (var val env)
    (cons (cons var val )
	  env)))

;;lookup function 
(define (apply-env env var)
  (display env)
  (newline)
  (cond 
   ((null? env) (eopl:error 'apply-env "Variable not found"))
   ((eqv? (caar env) var) (cdar env))
   (else (apply-env (cdr env) var))))

(define report-no-bind-found
  (lambda (search-var)
    (eopl:error 'apply-env "No binding for ~s" search-var)))

(define report-invalid-env
  (lambda (env)
    (eopl:error 'apply-env "Bad environment: ~s" env)))

(define e
  (extend-env 'y 2
	      (extend-env 'x 1
			  (empty-env))))

(apply-env e 'x)
(equal?? (apply-env e 'y) 2)
(equal?? (apply-env e 'x) 1)
(cons (cons 'x 1) '())
