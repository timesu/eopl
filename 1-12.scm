;;EOPL
;;Excersice 1.12*
;;Eliminate the on call to subst-in-s-exp in subst by replacing it by 
;;its definition and simplifying the resulting procedure.The result will
;;be a version of subst that does not need subst-in-s-exp.
;;This technique is called inlining , and is used by optimizing compilers.

;;original code in 1-subst.scm
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

(subst 'a 'b '((b c) (b () d)))

;;1-12 version
;;inlining tech
(define subst-e
  (lambda (new old slist)
    (cond
     ((null? slist) (quote ()))
     ((symbol? (car slist))
      (cond
       ((eqv? (car slist) old)
	(cons new (subst-e new old (cdr slist))))
       (else
	(cons (car slist) (subst-e new old (cdr slist))))))
     (else
      (cons (subst-e new old (car slist))
	    (subst-e new old (cdr slist)))))))

(subst-e 'a 'b '((b c) (b () d)))

