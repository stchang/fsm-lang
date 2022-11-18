#lang fsm/dfa

#:states (S F ,DEAD)

#:alphabet (a b)

#:transitions ((S a F)
               (S b ,DEAD)
               (F a ,DEAD)
               (F b F)
               (,DEAD a ,DEAD)
               (,DEAD b ,DEAD))

#:start-state S

#:accept-states (F)

