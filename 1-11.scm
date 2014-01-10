;;EOPL
;;Excersice 1.11
;;
;;In the last line of subst-in-s-exp, the recursion is on
;;sexp and not a smaller substructure.Why is the recursion guaranteed to halt?

The final return value is ether new sexp nor '() , since the sexp will
shrink ever time when call it in subst-in-s-exp.
