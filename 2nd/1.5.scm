;;EOPL 2nd
;;Exercise 1.5*
;;This version of list-of-numbers? works properly only when its argument is a list. 
;;Extend the definition of list-of-numbers? so that it will work on an arbitrary 
;;Scheme <datum> and return #f on any argument that is not a list.

<list> ::= () | (<datum>.<list>)
<list-of-numbers> := () | (<number>.<list-of-numbers>)

;;list-of-numbers
(define list-of-numbers?
  (lambda (lst)
    (if (null? lst)
	#t
	(and
	 (number? (car lst))
	 (list-of-numbers? (cdr lst))))))

(list-of-numbers? '(1 2 3))
(list-of-numbers? '())
(list-of-numbers? '(1 a))
(list-of-numbers? '(3))
