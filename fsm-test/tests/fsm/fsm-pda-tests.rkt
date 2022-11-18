#lang racket/base

(require rackunit/fsm)

(require (rename-in "machines/fsm-pda.rkt" [M pda-wcw^r]))

(check-reject pda-wcw^r "")
(check-reject pda-wcw^r "bbb")
(check-reject pda-wcw^r "abbbab")
(check-reject pda-wcw^r "a")
(check-reject pda-wcw^r "aa")
(check-reject pda-wcw^r "abbba")

(check-accept pda-wcw^r "c")
(check-accept pda-wcw^r "aca")
(check-accept pda-wcw^r "bcb")
(check-accept pda-wcw^r "abcba")
(check-reject pda-wcw^r "abcab")
(check-accept pda-wcw^r "abacaba")
(check-accept pda-wcw^r "bbacabb")
