;;EOPL 2nd
;;1.3.1 Free and Bound Variables

;;*
((lambda (x) x) y)
;;**
(lambda (y)
  ((lambda (x) x) y))

Lambda calculus expressions without free variables are called combinators

;;occurs-free
(define occurs-free?
  (lambda (var exp)
    (cond 
     ((symbol? exp) (eqv? exp var))
     ((eqv? (car exp) 'lambda)
      (and (not (eqv? (caadr exp) var))
	   (occurs-free? var (caddr exp))))
     (else 
      (or (occurs-free? var (car exp))
	  (occurs-free? var (cadr exp)))))))

;;occurs-bound
(define occurs-bound?
  (lambda (var exp)
    (cond
     ((symbol? exp) #f)
     ((eqv? (car exp) 'lambda)
      (or (occurs-bound? var (caddr exp))
	  (and (eqv? (caadr exp) var)
	       (occurs-free? var (caddr exp)))))
     (else
      (or (occurs-bound? var (car exp))
	  (occurs-bound? var (cadr exp)))))))
