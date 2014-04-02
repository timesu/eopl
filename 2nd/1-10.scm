;;EOPL 2nd
;;Exercise 1-10
;;[*]In the last line of subst-in-symbol-expression, the recursion is on se and not a smaller
;;substructure.Why is the recursion guaranteed to halt?

;;Original subst
;;Deinition
;;<s-list>  ::= ()
;;          ::= (<symbol-expression> . <s-list>)
;;<symbol-expression> ::= <symbol> | <s-list>

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

;;Since we have strictly followd the BNF definition of <s-list> and <symbol-expression>,
;;this recursion is guaranteed to halt.
;;Observe that subst and subst-in-symbol-expression call each other recursively.
;;Such procedures are said to be mutually recursive
