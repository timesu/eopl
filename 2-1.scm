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
    (display successor)
    (newline)
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

(define predecessor
  (lambda (x)
    (display predecessor)
    (newline)
    (cond
     ((null? x)
      '())
     ((eq? (car x) 0)
      (display x)
      (newline)
      (display "car is 0")
      (newline)
      (cond ((null? (cdr x)) '())
       (else (cons (- base 1) (predecessor (cdr x))))))
     (display "test")
     ((eq? (car x) 1)
      (display x)
      (newline)
      (display "car is 1")
      (newline)
      (cond ((null? (cdr x)) '())))
      (else (cons (- (car x) 1) (cdr x))))))

(define plus
  (lambda (x y)
    (display plus)
    (newline)
    (if (is-zero? y)
	x
	(successor (plus x (predecessor y))))))

(define mul
  (lambda (x y)
    (display mul)
    (newline)
    (cond 
     ((is-zero? x) zero)
     ((is-zero? y) zero)
     ((is-zero? (predecessor y)) x)
     (else (plus x (mul x (predecessor y) ))))))

(define fact
  (lambda (n)
    (cond ((is-zero? n) (successor zero))
          ((is-zero? (predecessor n)) (successor zero))
          (else (mul n (fact (predecessor n)))))))


(predecessor '(1))
(mul '(8) '(9))
(plus '(2 1) '(9))
(predecessor '(0 1))
(successor '(11 2))
(mul '(15 12) '(2))
(mul 0 1)
(fact '(1))
(fact '(4))
(fact '(5))
(time (fact '(7)))
