#lang fsm/dfa
; L(a*a) = {w | w starts and ends with an a}

#:states (S F A)
#:alphabet (a b)
#:start-state S
#:accept-states (F)
#:transitions ((S a F)
               (F a F)
               (F b A)
               (A a F)
               (A b A))
