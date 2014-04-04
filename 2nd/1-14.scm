;;EOPL 2nd
;;Exercise 1-14
;;[**]Given the assumption 0 <= n <  length(von),prove that
;;    partial-vector-sum is correct.

;;#problem: summing all the values in a vector

;;1.2.3
;;If we were summing the values in a list,we could follow
;;the grammar to recur on the cdr of the list to get
;;a procedure like
(define list-sum
  (lambda (lon)
    (if (null? lon)
	0
	(+ (car lon) (list-sum (cdr lon))))))

;;We define partial-vector-sum, which takes a vector of numbers,
;;von, and a number, n, and returns the sum of the first n values in von
(define partial-vector-sum
  (lambda (von n)
    (if (zero? n)
	0
	(+ (vector-ref von (- n 1))
	   (partial-vector-sum von (- n 1))))))

(define vector-sum
  (lambda (von)
    (partial-vector-sum 
     von (vector-length von))))

(define vector-sum-letrec
  (lambda (von)
    (letrec 
	((partial-sum 
	  (lambda (n)
		(if (zero? n)
		    0 
		    (+ (vector-ref von (- n 1))
		       (partial-sum (- n 1)))))))
	  (partial-sum (vector-length von)))))
