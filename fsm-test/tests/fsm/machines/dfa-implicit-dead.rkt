#lang fsm/dfa

#:states (S F)

#:alphabet (a b)

#:transitions ((S a F)
               (F b F))

#:start-state S

#:accept-states (F)

