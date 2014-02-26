;;EOPL 2nd
;;2-2-1 define-datatype and cases
;;bintree ::= number | symbol bintree bintree

;;define-datatype protype
;;(define-datatype type-name type-predicate-name
;{(variant-name {(field-name predicate)}*)}*)


#lang eopl

(define-datatype bintree bintree?
  (leaf-node (datum number?))
  (interior-node (key symbol?)
		 (left bintree?)
		 (right bintree?)))

(define-datatype s-list s-list?
  (empty-s-list)
  (non-empty-s-list (first symbol-exp?)
		    (rest s-list?)))

(define-datatype symbol-exp symbol-exp?
  (symbol-symbol-exp (data symbol?))
  (s-list-symbol-exp (data s-list?)))

(define-datatype s-list-s s-list-s?
  (an-s-list (data (list-of symbol-exp?))))
(define list-of
  (lambda (pred)
    (lambda (val)
      (or (null? val)
	  (and (pair? val)
	       (pred (car val))
	       ((list-of pred) (cdr val)))))))

;;here (list-of pred) builds a predicate that tests to see 
;;if its argument is a list , and that each of its elements 
;;satisfies pred.
