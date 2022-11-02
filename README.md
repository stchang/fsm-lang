# fsm-lang

(Work in progress)

This package adds convenient #langs for the [`fsm`](https://github.com/morazanm/fsm) library.

Example:
```racket
#lang fsm/dfa

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