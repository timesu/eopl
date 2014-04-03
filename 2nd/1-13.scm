;;EOPL 2nd
;;Exercise 1-13
;;[**]Rewrite the grammar for <s-list> to use Kleene star, 
;;    and rewrite notate-depth-in-s-list using map

;;Key-word: inherited attributes
;;This technique of passing additional arguments to keep
;;track of the context in which a procedure is invoked
;;is extremely useful.

;;Depth
;;<top-level> ::= <s-list>
;;<s-list> ::=()
;;         ::=(<symbol-expression> . <s-list>)
;;<symbol-expression> ::= <symbol> | <s-list>

(define notate-depth-in-s-list
  (lambda (slist d)
    (if (null? slist)
	'()
	(cons
	 (notate-depth-in-symbol-expression (car slist) d)
	 (notate-depth-in-s-list (cdr slist) d)))))

(define notate-depth-in-symbol-expression
  (lambda (se d)
    (if (symbol? se)
	(list se d)
	(notate-depth-in-s-list se (+ d 1)))))

(define notate-depth
  (lambda (slist)
    (notate-depth-in-s-list slist 0)))


(notate-depth '(a (b () c) ((d)) e))

;;Exercise
;;Kleene star
;;<top-level> ::= <s-list>
;;<s-list> ::=({symbol-expression}*)
;;<symbol-expression> ::= <symbol> | <s-list>


