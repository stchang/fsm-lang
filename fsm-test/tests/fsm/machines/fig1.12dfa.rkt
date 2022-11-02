#lang fsm/dfa

#:states (S Q1 Q2 R1 R2)

#:alphabet (a b)

#:transitions ((S a Q1)
               (S b R1)
               (Q1 a Q1)
               (Q1 b Q2)
               (Q2 a Q1)
               (Q2 b Q2)
               (R1 a R2)
               (R1 b R1)
               (R2 a R2)
               (R2 b R1))

#:start-state S

#:accept-states (Q1 R1)
