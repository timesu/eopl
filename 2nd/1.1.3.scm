;;EOPL
;;2nd Ch 1
;;1.1.3

;;<bintree> ::= <number> | (<symbol> <bintree> <bintree>)
;;is always odd.Let us write a procedure count-nodes to count these
;;nodes.If s is a number, then (count-nodes s) shoulde be 1.
;;If s is of the form (sym s1 s2), then (count-nodes s) 
;;shoulde be (count-nodes s1) + (count-nodes s2) + 1.

(define count-nodes 
  (lambda (s)
    (if (number? s)
	1
	(+ (count-nodes (cadr s))
	   (count-nodes (caddr s))
	   1))))
