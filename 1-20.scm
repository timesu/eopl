;;EOPL
;;Exercise 1.20*
;;(count-occurrences s slist) returns the number of 
;;occurences of s in slist.
;;(count-occurrences 'x '((f x) y (((x z ) x))))
;;==> 3
;;(count-occurrences 'w '((f x) y (((x z) x))))

;;TLS CH5 PAGE 85 , function occur*

(define count-occurrences 
  (lambda (s slist)
    (cond
     ((null? slist) 0)
     ((or (number? (car slist))
	  (symbol? (car slist)))
      (cond
       ((eq? s (car slist))
	(add1 (count-occurrences s (cdr slist))))
       (else
	(count-occurrences s (cdr slist)))))
     (else
      (+ (count-occurrences s (car slist))
	    (count-occurrences s (cdr slist)))))))


(count-occurrences 'x '((f x) y (((x z ) x))))
(count-occurrences 'w '((f x) y (((x z) x))))
