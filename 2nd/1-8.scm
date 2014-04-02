;;EOPL 2nd
;;Exercise 1.8
;;[*] In the definition of remove-first , if the inner if 's alternative (cons
;;...) were replaced by (remove-first s (cdr los)) , what function would the 
;;resulting procedure compute?

;;##Answer: Drop those elements which appear before "eqv?" happen

;;Original remove-first

(define remove-first
  (lambda (s los)
    (if (null? los)
	'()
	(if (eqv? (car los) s)
	    (cdr los)
	   ;; (cons (car los) (remove-first s (cdr los)))
	   ;; replace it via this exercise
	    (remove-first s (cdr los))
	    ))))


(remove-first 'a '(a b c))
(remove-first 'b '(e f g))
