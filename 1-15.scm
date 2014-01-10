;;EOPL  
;;Excersice 1-15
;;use #lang eopl to require lib functions
;;(duple n x) returns a list containning n copies of x
;;(duple 2 3)
;;==> (3 3)

(define duple
  (lambda (n x)
    (cond
     ((zero? n) (quote()))
     (else
      (cons x (duple (sub1 n) x))))))

(duple 2 3)
(duple 4 '(ha ha))
(duple 0 '(blah))
