;;EOPL 2nd
;;CH3 Figure 3.2
;;A simple interpreter
#lang eopl
;;data-types
(define-datatype program program?
  (a-program
   (exp expression?)))

(define-datatype expression expression?
  (lit-exp (datum number?))
  (var-exp (id symbol?))
  (primap-exp (prim primitive?))
  (rands (list-of expression?)))

(define-datatype primitive primitive?
  (add-prim)
  (substract-prim)
  (mult-prim)
  (incr-prim)
  (decr-prim))



(define eval-program
  (lambda (pgm)
    (cases program pgm
	   (a-program (body)
		      (eval-expression body (init-env))))))

(define eval-expression
  (lambda (exp env)
    (cases expression exp
	   (lit-exp (datum) datum)
	   (var-exp (id) (apply-env env id))
	   (primapp-exp (prim rands)
			(let ((args (eval-rands rands env)))
			  (apply-primitive prim args))))))

(define eval-rands 
  (lambda (rands env)
    (map (lambda (x)
	   (eval-rand x env)) rands)))

(define eval-rand
  (lambda (rand env)
    (eval-expression rand env)))

(define apply-primitive
  (lambda (prim args)
    (cases primitive prim
	   (add-prim () (+ (car args) (cadr args)))
	   (subtract-prim () (- (car args) (cadr args)))
	   (mult-prim () (* (car args) (cadr args)))
	   (incr-prim () (+ (car args) 1))
	   (decr-prim () (- (car args) 1)))))

(define init-env 
  (lambda ()
    (extend-env '(i v x) '(1 5 10)
		(empty-env))))
