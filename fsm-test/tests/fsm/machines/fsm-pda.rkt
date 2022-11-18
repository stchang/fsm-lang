#lang fsm/pda

;; example from fsm README

; L = {wcw^r | w in {a, b)*}
#:states (S M N F)

#:alphabet (a b c)

#:stack-alphabet (a b)

#:start-state S

#:accept-states (F)

#:transitions (((S ,EMP ,EMP) (M ,EMP))
               ((M a ,EMP) (M (a)))
               ((M b ,EMP) (M (b)))
               ((M c ,EMP) (N ,EMP))
               ((N a (a)) (N ,EMP))
               ((N b (b)) (N ,EMP))
               ((N ,EMP ,EMP) (F ,EMP)))
