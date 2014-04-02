;;EOPL 2nd
;;Exercise 1.2
;;Rewrite the <datum> grammar without using the Kleene star or plus. Then indicate the
;;changes to the above derivation that are required by this revised grammar.
;;Refer https://github.com/rubenbarroso/EOPL/blob/master/src/chapter1/1_2.txt


datum grammar:
<list> ::= ({<datum>}*)
<dotted-datum> ::= ({<datum>}+.<datum>)
<vector>   ::= #({<datum>}*)
<datum>    ::= <number> | <symbol> | <boolean> | <string>
           ::= <list> | <dotted-datum> | <vector>

Transer between BNF and kleene star:

<list-of-numbers> ::= () | (<number>.<list-of-numbers>)
<list-of-numbers> ::= ({<number>}*)

Solution:
<list> ::= () | (<datum>.<list>)
<dotted-datum> ::= (<datum>.<datum>) | (<datum>.<dotted-datum>)
<vector> ::= #() | #(<datum>.vector)
<datum>  ::= same as above
