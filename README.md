# fsm-lang

(Work in progress)

This package adds convenient #langs for the [`fsm`](https://github.com/morazanm/fsm) library.

Example:
```racket
#lang fsm/dfa

;; figure 1.9 from Sipser

#:states (Q1 Q2)

#:alphabet (0 1)

#:transitions ((Q1 0 Q1)
               (Q1 1 Q2)
               (Q2 0 Q1)
               (Q2 1 Q2))

#:start-state Q1

#:accept-states (Q1)
```

This defines a machine of the specified type (e.g., DFA).

It can then be either:

1) run from the command line (as a Racket program), with an input string (quotes are optional, except for empty string):
```racket
$ racket fig1.9dfa.rkt
DFA: expects 1 <input> on the command line, given 0 arguments
$ racket fig1.9dfa.rkt ""
accept
$ racket fig1.9dfa.rkt "10"
accept
$ racket fig1.9dfa.rkt "11"
reject
```

or 2) imported as a library (where the machine is named `M` by default) to be used with the main `fsm` library:
```racket
#lang racket/base

(require fsm)

;; figure 1.9 from Sipser: M3
(require (rename-in "fig1.9dfa.rkt" [M M3]))
(sm-apply M3 (input->list "110")) ; => 'accept

```

### [Examples](https://github.com/stchang/fsm-lang/tree/main/fsm-test/tests/fsm/machines) ported from [original `fsm` README](https://github.com/morazanm/fsm)

```racket
#lang fsm/dfa

; L(a*a) = {w | w starts and ends with an a}

#:states (S F A)

#:alphabet (a b)

#:transitions ((S a F)
               (F a F)
               (F b A)
               (A a F)
               (A b A))

#:start-state S

#:accept-states (F)
```

```racket
#lang fsm/nfa

; L(KLEENESTAR-abUaba) = (abUaba)*

#:states (Q-0 Q-1 Q-2 Q-3 Q-4 Q-5)

#:alphabet (a b)

#:transitions ((Q-0 a Q-1)
               (Q-1 b Q-2)
               (Q-2 a Q-3)
               (Q-3 ,EMP Q-0)
               (Q-0 a Q-4)
               (Q-4 b Q-5)
               (Q-5 ,EMP Q-0))

#:start-state Q-0

#:accept-states (Q-0)
```

```racket
#lang fsm/pda

; L = {wcw^r | w in {a, b)*}

#:states (S M N F)

#:alphabet (a b c)

#:stack-alphabet (a b)

#:transitions (((S ,EMP ,EMP) (M ,EMP))
               ((M a ,EMP) (M (a)))
               ((M b ,EMP) (M (b)))
               ((M c ,EMP) (N ,EMP))
               ((N a (a)) (N ,EMP))
               ((N b (b)) (N ,EMP))
               ((N ,EMP ,EMP) (F ,EMP)))

#:start-state S

#:accept-states (F)
```

```racket
#lang fsm/tm

; writes "a" on tape

#:states (S H)

#:alphabet (a b ,LM)

#:transitions (((S ,LM) (S ,RIGHT))
               ((S a) (H a))
               ((S b) (H a))
               ((S ,BLANK) (H a)))

#:start-state S

#:halting-states (H)
```