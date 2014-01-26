;;EOPL
;;Exercise 2.11**
;A naive implementation of extend-env* from the preceding exercise requires
; time proportional to k to run. It is possible to represent environments so
; that extend-env* requires only constant time: represent the empty
; environment by the empty list, and represent a non-empty environment by the
; data structure
;
; +---+---+
; | o | o ---> saved-env
; +-|-+---+
; |
; V
; +---+---+
; | o | o ---> saved-vals
; +-|-+---+
; |
; V
; saved-vars
;
; Such an environment might look like
;
; backbone
; +---+---+ V +---+---+ +---+---+
; | o | o ---------------->| o | o ------------->| o | o ------> rest of environment
; +-|-+---+ +-|-+---+ +-|-+---+
; | | |
; V V V
; +---+---+ +---+---+ +---+---+
; | o | o ---> (11 12 13) | o | o ---> (66 77) | o | o ---> (88 99)
; +-|-+---+ +-|-+---+ +-|-+---+
; | | |
; V V V
; (a b c) (x z) (x y)
;
; This is called the ribcage representation. The environment is represented as
; a list of pairs called ribs; each left rib is a list of variables and each
; right rib is the corresponding list of values.
;
; Implement the environment interface, including extend-env*, in this
; representation.




(define empty-env '())
(define extend-env
  (lambda (var val env)
    (cons (cons var val) env)))

(define extend-env-rib
  )

(define extend-env-muchtime*
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
