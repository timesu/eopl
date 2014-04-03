;;EOPL 2nd
;;Exercise 1-12
;;[**]In our example, we began by eliminating the Kleene star in the grammar for <s-list>. 
;;When a production is expressed using Kleene star, often the recursion can be expressed 
;;using map .
;;Write subst following the original grammar by using map .

;;subst
;;kleene star
;;<s-list> ::= ({<symbol-expression>}*)
;;<symbol-expression> ::= <symbol> | <s-list>

;;<s-list> ::= ()
;;         ::= (<symbol-expression> . <s-list>)
;;<symbol-expression> ::= <symbol> | <s-list>

;;Kleene star version

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


;;Map version
;;from https://github.com/rubenbarroso/EOPL/blob/master/src/chapter1/1_12.scm
(define subst-in-symbol-expression-map
  (lambda (new old se)
    (if (symbol? se)
        (if (eqv? se old) new se)
        (subst new old se))))

(define subst-map
  (lambda (new old slist)
    (map (lambda (se)
           (subst-in-symbol-expression new old se))
         slist)))

