;;EOPL 2nd 
;;Ch 1
;;1.2.1 Deriving Programs from BNF Data Specifications

;;<list> ::= () | (<datum>.<list>)
;;<list-of-numbers> ::= () | (<number>.<list-of-numbers>)

(define list-of-numbers?
  (lambda (lst)
    (if (null? lst)
	#t
	(and
	 (number? (car lst))
	 (list-of-numbers? (cdr lst))))))
