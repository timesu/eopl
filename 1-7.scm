;;EOPL
;;Exercise 1.7
;;1-7.scm


;;standard version
(define nth-element
  (lambda (lat n)
    (cond
     ((null? lat) 0)
     ((zero? n) (quote error!))
     ((eq? 1 n) (car lat))
     (else
      (nth-element (cdr lat) (sub1 n))))))

;;test case
(nth-element '(a b c) 5)

;;Exercise version
;;Can reprot error like
;;(a b c) does not have 8 element

(define nth-element-e
  (lambda (lat n)
    (cond
     ((and (null? lat) (> n 0))
      (display lat))
     ((null? lat) 0)
     ((zero? n) (quote error!))
     ((eq? 1 n) (car lat))
     (else
      (nth-element-e (cdr lat) (sub1 n))))))

;;test case
(nth-element-e '(a b c) 1)
(nth-element-e '(a b c) 4)
