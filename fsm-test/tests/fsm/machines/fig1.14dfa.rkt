#lang fsm/dfa

#:states (Q0 Q1 Q2)

#:alphabet (0 1 2 r)

#:transitions ((Q0 0 Q0)
               (Q0 1 Q1)
               (Q0 2 Q2)
               (Q0 r Q0)
               (Q1 0 Q1)
               (Q1 1 Q2)
               (Q1 2 Q0)
               (Q1 r Q0)
               (Q2 0 Q2)
               (Q2 1 Q0)
               (Q2 2 Q1)
               (Q2 r Q0))
               
#:start-state Q0

#:accept-states (Q0)
