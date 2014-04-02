;;EOPL 2nd
;;1.3.2 Scope and Lexical Address
Many modern languages , including Scheme , allow regions to be nested
with each other, as when one lambda expression appears in the body of another.
Such languages are said to be block-structured, and the regions are sometimes 
called blocks.

(define x  ;;x1
  (lambda (x) ;;x2
    (map (lambda (x) ;;x3
      (+ x 1))
   x)))

(x '(1 2 3))

Here the xpression (+ x 1) is within the region o all three declarations of x.
It therefore takes its binding from the innermost declaration of x, the one on the fourth
line.
Block-structured languages whose scope rules work in this way are said to use lexical 
binding.
We define the scope of a variable declaration to be the text within which references to 
the variable refer to the declaration.Thus the scope of a declaration is the region of 
text associated with the declaration, excluding any inner regions associated with
declarations that use the same variable name. We say that the inner declaration of x
shadows the outer declarations of x, or that the inner declaration creates a hole in the
scope of the outer one.
