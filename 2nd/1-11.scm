;;EOPL 2nd
;;Exercise 1-10
;;[*]Eliminate the one call to subst-in-symbol-expression in subst by replacing it by its definition
;;and simplifying the resulting procedure.The result will be a version of subst that does not need 
;;subst-in-symbol-expression. This technique is called inlining , and is used by optimizing compilers.


;;Original subst
(define subst
  (lambda (new old slist)
    (if (null? slist)
	'()
	(cons
	 (subst-in-symbol-expression new old (car slist))
	 (subst new old (cdr slist))))))

(define subst-in-symbol-expression
  (lambda (new old se)
    (if (symbol? se)
	(if (eqv? se old) new se)
	(subst new old se))))

(subst 'a 'b '((b c) (b () d)))

;;Exercise
(define subst-inlining
  (lambda (new old slist)
    (cond
     ((null? slist) (quote ()))
     ((symbol? )))))
