#lang fsm/dfa

#:states (Q1 Q2 Q3)

#:alphabet (0 1)

#:transitions ((Q1 0 Q1)
               (Q1 1 Q2)
               (Q2 0 Q3)
               (Q2 1 Q2)
               (Q3 0 Q2)
               (Q3 1 Q2))
;; #:transition-table
;;      0  1
;;      -----
;; R : R S
;; S : T S
;; T : S S

#:start-state Q1

#:accept-states (Q2)
