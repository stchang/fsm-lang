#lang fsm/nfa

#:states (Q1 Q2 Q3 Q4)

#:alphabet (0 1)

#:transitions ((Q1 0 Q1)
               (Q1 1 Q1)
               (Q1 1 Q2)
               (Q2 0 Q3)
               (Q2 ,EMP Q3)
               (Q3 1 Q4)
               (Q4 0 Q4)
               (Q4 1 Q4))

#:start-state Q1

#:accept-states (Q4)
