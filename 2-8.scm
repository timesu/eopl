;;EOPL
;;Exercise 2-8*
;;Add to the environment interface an observer called empty-env?
;;and implement it using the a-list representation.

(define empty-env '())
(define extend-env
  (lambda (var val env)
    (cons (cons var val) env)))

(define empty-env?
  (lambda (env)
    (eqv? env empty-env)))

(define apply-env
  (lambda (env search-var)
    (cond
     ((null? env) (quote no binding found))
     ((eq? search-var (caar env))
      (cdr (car env)))
     (else
      (apply-env (cdr env) search-var)))))

(define e
  (extend-env 'd 6
	      (extend-env 'y 8
			  empty-env)))
(apply-env e 'y)
(apply-env e 'd)
(apply-env e 'a)
(empty-env? e)
(display e)
(display (cadr e))
(display (cdr (car e)))
