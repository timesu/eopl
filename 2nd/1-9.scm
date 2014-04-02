;;EOPL 2nd
;;Exercise 1-9
;;[*]In the definition of remove, if the inner if's alternative (cons ...) were replaced
;;by (remove s (cdr los)), what function would the resulting procedure compute?

;;Original remove

(define remove 
  (lambda (s los)
    (if (null? los)
	'()
	(if (eqv? (car los) s)
	    (remove s (cdr los))
	    ;;(cons (car los) (remove s (cdr los)))
	    ;;replaced by this exercise
	    (remove s (cdr los))
	    ))))

(remove 'a4 '(c1 a4 d1 a4))
