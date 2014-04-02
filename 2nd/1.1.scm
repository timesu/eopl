;;EOPL 2nd
;;Exercise 1.1*
;;Write a syntactic derivation that proves (-7  . (3 . (14 . ()))) is a list of numbers

BNF:

<list-of-numbers> ::= ()
                  ::= (<number>.<list-of-numbers>)

(-7 .(3 .(14 .())))
=><list-of-numbers>
=>(<number>.<list-of-numbers>)
=>(-7.(<number>.<list-of-numbers>))
=>(-7.(3 . (<number>.<list-of-numbers>)))
=>(-7 . (3 .(14 . <list-of-number>)))
=>(-7 . (3 .(14 . ())))
