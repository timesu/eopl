;;EOPL 2nd
;;Exercise 1-10
;;[*]Eliminate the one call to subst-in-symbol-expression in subst by replacing it by its definition
;;and simplifying the resulting procedure.The result will be a version of subst that does not need 
;;subst-in-symbol-expression. This technique is called inlining , and is used by optimizing compilers.

;;Key word: inlining
;;The result will be a version of subst that does not need subst-in-symbol-expression.
;;This technique is called inlining.

;;Key word: mutually recursive
;;subst and subst-in-symbol-expression call each other recursively.


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
     ((symbol? (car slist))
      (cond
       ((eqv? (car slist) old)
	(cons new (cdr slist)))
       (else
	(cons (car slist) (subst-inlining new old (cdr slist))))))
     (else
      (cons (subst-inlining new old (car slist))
	    (subst-inlining new old (cdr slist)))))))
;;Tec fromTLS CH5 Page 81

(subst-inlining 'a 'b '((b c) (b () d)))
(subst-inlining 'a 'b '(b c))
(subst-inlining 'a 'b '((b c)))
(car '((b c)))
(cdr '((b c)))
(car '((b c) (b () d)))
(cdr '((b c) (b () d)))
(cons '() '(a b))
(cons '(a b) '())
