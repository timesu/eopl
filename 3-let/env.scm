;;EOPL
;;CH3 LET language
;;Base on 
;;https://github.com/skanev/playground/blob/master/scheme/
;;eopl/03/cases/let/env.scm

(define (empty-env)
  '())

(define (extend-env var val env)
  (cons (list var val)
        env))

(define (extend-env* vars vals env)
  (if (null? vars)
      env
      (extend-env* (cdr vars)
                   (cdr vals)
                   (extend-env (car vars) (car vals) env))))

(define (apply-env env var)
  (cond ((null? env) (eopl:error 'apply-env "Variable not found"))
        ((eqv? (caar env) var) (cadar env))
        (#t (apply-env (cdr env) var))))
