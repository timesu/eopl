;;EOPL
;;LET env

(define empty-env-record
  (lambda () 
    '()))

(define extended-env-record
  (lambda (sym val old-env)
    (cons (list sym val) old-env)))
  
(define empty-env-record? null?)
  
(define environment?
  (lambda (x)
    (or (empty-env-record? x)
	(and (pair? x)
	     (symbol? (car (car x)))
	     (expval? (cadr (car x)))
	     (environment? (cdr x))))))

(define extended-env-record->sym
  (lambda (r)
    (car (car r))))

(define extended-env-record->val
  (lambda (r)
    (cadr (car r))))

(define extended-env-record->old-env
  (lambda (r)
      (cdr r)))

