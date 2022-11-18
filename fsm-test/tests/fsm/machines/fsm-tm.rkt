#lang fsm/tm

; example from fsm README
; writes "a" on tape

#:states (S H)

#:alphabet (a b ,LM)

#:transitions (((S ,LM) (S ,RIGHT))
               ((S a) (H a))
               ((S b) (H a))
               ((S ,BLANK) (H a)))

#:start-state S

#:halting-states (H)
