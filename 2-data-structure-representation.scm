;;EOPL
;;CH2 2.2.2 Data Structure Representation
;;Page 38
;;EXAMPLE


;The one-armed variant of if was removed from Racket to prevent bugs.
;In functional code one always uses the two-armed variant of if.
;(if test expr-on-true expr-on-false)
;Forgetting the second arm expr-on-false would not lead to a syntax-error, 
;but to a runtime error (the expression would return #<void>).
;To prevent these often occurring bugs in functional code, 
;it was decided to introduce the form when for the one-armed variant of if.
; (when test expr-on-true)
;Besides preventing accidental bugs, the new form clearly indicated to a reader of code, 
;that the code relies on side effects.
;Porting code from standard Scheme to Racket
;If you try running Scheme code in Racket and see the error message
;if: bad syntax (must have an "else" expression)
;you must rewrite the if expression to when or unless.
;Simply rewrite:
;(if test expr1)    to    (when test expr1)
;and (if (not test) expr1)   to    (unless test expr1).
;http://stackoverflow.com/questions/10863192/why-is-one-armed-if-missing-from-racket


(require "utils.scm")
#lang eopl

(define empty-env
  (lambda () (list 'empty-env)))

(define extend-env
  (lambda (var val env)
    (list 'extend-env var val env)))

(define apply-env
  (lambda (env search-var)
    (cond
     ((eqv? (car env) 'empty-env)
      (report-no-binding-found search-var))
     ((eqv? (car env) 'extend-env)
      (let ((saved-var (cadr env))
	    (saved-val (caddr env))
	    (saved-env (cadddr env)))
	(if (eqv? search-var saved-var)
	    saved-val
	    (apply-env saved-env search-var))))
     (else
      (report-invalid-env env)))))

(define report-no-bind-found
  (lambda (search-var)
    (eopl:error 'apply-env "No binding for ~s" search-var)))

(define report-invalid-env
  (lambda (env)
    (eopl:error 'apply-env "Bad environment: ~s" env)))

;;test
(define e
    (extend-env 'd 6
      (extend-env 'y 8
        (extend-env 'x 7
          (extend-env 'y 14
            (empty-env))))))


(equal?? (apply-env e 'd) 6)
(equal?? (apply-env e 'y) 8)
(equal?? (apply-env e 'x) 7)

