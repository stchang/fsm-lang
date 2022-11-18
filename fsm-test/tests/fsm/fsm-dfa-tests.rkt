#lang racket/base

(require rackunit/fsm)

(require (rename-in "machines/fsm-dfa.rkt" [M a*a]))

(check-reject a*a "")
(check-reject a*a "bbb")
(check-reject a*a "abbbab")
(check-accept a*a "a")
(check-accept a*a "aa")
(check-accept a*a "abbba")
