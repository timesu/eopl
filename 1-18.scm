;;EOPL
;;Exercise 1.18*
;;(swapper s1 s2 slist) returns a list the same as slist,
;;but with all occurrences of s1 replaced by s2 and
;;all occurrences of s2 replaced by s1.

;;(swapper 'a 'd '(a b c d))
;;==> (d b c a)

;;(swapper 'x 'y '((x) y) (z (x)))
;;==> ((y) x (z (y)))

(define swapper
  (lambda (s1 s2 slist)
    (cond
     ((null? slist) (quote()))
     ((or (number? (car slist))
	   (symbol? (car slist)))
      (cond
       ((eq? (car slist) s1)
	(cons s2 (swapper s1 s2 (cdr slist))))
       ((eq? (car slist) s2)
	(cons s1 (swapper s1 s2 (cdr slist))))
       (else
	(cons (car slist) (swapper s1 s2 (cdr slist))))))
     (else
      (cons (swapper s1 s2 (car slist))
		     (swapper s1 s2 (cdr slist)))))))

(swapper 'a 'd '((c (a b) b c d)))
(swapper 'a 'b '())
(swapper 'x 'y '((x) y (z (x))))
(swapper 'a 'd '(a d () c d))
