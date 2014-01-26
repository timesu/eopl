;;EOPL
;;Exercise 2.10*
;;Add to the environment interface a constructor extend-env* , and
;;implement it using the a-list representation. This constructor takes 
;;a list of variables, a list of values of the same length, and an 
;;environment, and is specified by
;;(extend-env* (var 1 ... var k ) (val 1 ... val k ) f ) = g ,
;;where g(var) =f (var) otherwise 
;;if var = var i for some i such that 1 ≤ i ≤ k , vari

(define empty-env '())
(define extend-env
  (lambda (var val env)
    (cons (cons var val) env)))

(define extend-env*
  (lambda (var val env)
    (cond
     ((null? var) env)
     (else
      (extend-env (car vars) (car vals)
		  (extend-env* (cdr vars) (cdr vals) env))))))

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

