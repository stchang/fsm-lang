#lang racket/base

(require rackunit/fsm)

(require (rename-in "machines/fsm-nfa.rkt" [M KLEENESTAR-abUaba]))

(check-accept KLEENESTAR-abUaba "")
(check-reject KLEENESTAR-abUaba "bbb")
(check-reject KLEENESTAR-abUaba "abbbab")
(check-accept KLEENESTAR-abUaba "ab")
(check-accept KLEENESTAR-abUaba "aba")
(check-accept KLEENESTAR-abUaba "abab")
(check-accept KLEENESTAR-abUaba "abaaba")
(check-accept KLEENESTAR-abUaba "ababaab")
(check-accept KLEENESTAR-abUaba "abaababa")
