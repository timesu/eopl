;;EOPL
;;Exercise 1.17*
;;(down lst) wraps parentheses around each top-level
;;element of lst
;;(down '(1 2 3))
;;==> ((1) (2) (3))

;;(down '((a) (fine) (idea)))
;;==> (((a) ) ((fine)) ((idea)))

(define down
  (lambda (lst)
    (cond
     ((null? lst) (quote ()))
     ((or (number? (car lst))
	  (symbol? (car lst)))
      (cons
	     (cons (car lst) (quote()))
	     (down (cdr lst))))
     (else
      (cons (down (car lst))
	    (down (cdr lst)))))))

(cons '1 '())
(cons '(1) '(2 3))
(down '(1 2 3))
(down '((a) (fine) (idea)))
;;==> (((a) ) ((fine)) ((idea)))
