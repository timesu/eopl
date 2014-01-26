;;EOPL
;;Exercise 2.9*
;;Add to the environment interface an observer called has-binding?
;;that takes an environment env and a variable s and tests to see 
;;if s has an associated value in env. Implement it using the a-list 
;;representation.
(define empty-env '())
(define extend-env
  (lambda (var val env)
    (cons (cons var val) env)))

(define empty-env?
  (lambda (env)
    (eqv? env empty-env)))

(define has-binding?
  (lambda (env s)
    (cond
     ((null? env) #f)
     ((eq? s (caar env)) #t)
     (else
      (has-binding? (cdr env) s)))))

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

(has-binding? e 'a)
