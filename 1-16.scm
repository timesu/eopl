;;EOPL
;;Exercise 1.16*
;;(invert lst), where lst is a list of 2-lists (lists of length two),
;;returns a list with each 2-list reversed.
;;example
;;(invert '((a 1) (a 2) (1 b) (2 b)))
;;==> ((1 a) (2 a) (b 1) (b 2))

;;Treat (or number? symbol?)
;;as atom? 


(define invert
  (lambda (lst)
    (cond
     ((null? lst) (quote()))
     ((or (number? (car lst))
	 (symbol? (car lst)))
	       (cons (cadr lst)
		     (car lst)))
     (else
      (cons (invert (car lst))
	    (invert (cdr lst)))))))

(define test
  (lambda (lst)
    (cons
     (cadr lst)
     (car lst))))

(invert '((1 a) (a 1) (2 b) (b 2)))
(cons '(a) 'b)
(test '(a b))
(symbol? (car '(1 a)))

	     
