;;EOPL
;;Section 1.2.5 subst


;;subst: Sym * Sym  * S-list -> S-list
(define subst
  (lambda (new old slist)
    (if (null? slist)
	'()
	(cons 
	 (subst-in-s-exp new old (car slist))
	 (subst new old (cdr slist))))))

;;subst-in-s-exp : Sym * Sym * S-exp --> S-exp
(define subst-in-s-exp
  (lambda (new old sexp)
    (if (symbol? sexp)
	(if (eqv? sexp old) new sexp)
	(subst new old sexp))))

;;example
(subst 'a 'b '((b c) (b () d)))
