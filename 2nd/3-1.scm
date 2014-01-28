;;EOPL
;;2nd version
;;Ch3 3-1

#lang eopl

(define-datatype program program?
  (a-program
   (exp expression?)))

(define-datatype expression expression?
  (lit-exp (datum number?))
  (var-exp (id symbol?))
  (primapp-exp 
   (prim primitive?)
   (rands (list-of expression?))))

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
    (map (lambda (x) (eval-rand x env))
	 rands)))

(define apply-primitive
  (lambda (prim args)
    (cases primitive prim
	   (add-prim () (+ (car args) (cadr args)))
	   (substract-prim () (- (car args) (cadr args)))
	   (mult-prim () (* (car args) (cadr args)))
	   (incr-prim () (+ (car args) 1))
	   (decr-prim () (- (car args) 1)))))

(define init-env (lambda ()
		   (extend-env
		    '(i v x) '(1 5 10) (empty-env))))




;;exersice 3-1
;Exercise 3.1* Consider the fourth example above. 
;Then implement the procedure program-to-list so that it returns the list

;(a-program 
; (primapp-exp 
; (incr-prim) ((primapp-exp
;		(add-prim)
;		((lit-exp 3) (varexp x)))))

;Helper
(define list-of
  (lambda (pred)
    (lambda (val)
      (or (null? val)
          (and (pair? val)
               (pred (car val))
               ((list-of pred) (cdr val)))))))


(define program-to-list
  (lambda (the-program)
    (cases program the-program
           (a-program (exp)
                      (cons 'a-program
                            (list (expression-to-list exp)))))))
(define expression-to-list
  (lambda (exp)
    (cases expression exp
           (lit-exp (datum) (list 'lit-exp datum))
           (var-exp (id) (list 'var-exp id))
           (primapp-exp (prim rands)
                        (list 'primapp-exp
                              prim
                              (map (lambda (rand)
                                     (expression-to-list rand))
                                   rands))))))
