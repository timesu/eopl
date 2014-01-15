;;EOPL
;;EXCERCISE
;;2.1*
;;Implement the four required operations for bigits.Then use
;;your implementation to calculate the factorial of 10.
;;1.How does the excution time vary as this argument changes?
;;2.How does the excution time vary as the base changes?
;;Explain why.

(define base 16)

(define zero  '())

(define is-zero?
  (lambda (n)
     (null? n)))

(define successor
  (lambda (x)
    (cond
     ((null? x) 
      (cons 1 x))
     ((eq? (car x) (- base 1))
      (cond
       ((null? (cdr x))
	(cons 0 1))
       (else
	(cons 0 (successor (cdr x))))))
     (else
      (cons (+ 1 (car x)) (cdr x))))))

(successor '(1))
(successor '(15 9 8 7 8 2))
;(successor '(15))
(successor '(15 15 2))

(define predecessor
  (lambda (x)
    (cond
     ((null? x)
      '())
     ((eq? (car x) 0)
      (cond
       ((null? (cdr x))
	 '())
       (else
	(cons (- base 1) (predecessor (cdr x))))))
     ((eq? (car x) 1)
      (cond
       ((null? (cdr x))
	'())))
      (else
	(cons (- (car x) 1) (cdr x))))))

(predecessor '())
(predecessor '(0))
(predecessor '(1))
(predecessor '(0 1))
;(predecessor '(0 2 3 4 5 ))

(define plus
  (lambda (x y)
    (if (is-zero? x)
	y
	(successor (plus (predecessor x) y)))))

(plus (successor zero) (successor zero))

(successor zero)
(predecessor (successor zero))
(plus zero (successor zero))


(define mul
  (lambda (x y)
    (cond ((is-zero? x) zero)
          ((is-zero? y) zero)
          ((is-zero? (predecessor x)) y)
          (else (plus y (mul (predecessor x) y))))))

(mul seven (successor (successor (successor (successor zero)))))


(define fact
  (lambda (n)
    (cond ((is-zero? n) (successor zero))
          ((is-zero? (predecessor n)) (successor zero))
          (else (mul n (fact (predecessor n)))))))

(fact (successor (successor (successor (successor zero)))))

(define seven (successor (successor 
			  (successor (successor (successor 
						 (successor (successor zero))))))))
(successor (successor seven))
(fact seven)

