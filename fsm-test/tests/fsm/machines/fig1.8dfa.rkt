#lang fsm/dfa

#:states (Q1 Q2)

#:alphabet (0 1)

#:transitions ((Q1 0 Q1)
               (Q1 1 Q2)
               (Q2 0 Q1)
               (Q2 1 Q2))

#:start-state Q1

#:accept-states (Q2)
