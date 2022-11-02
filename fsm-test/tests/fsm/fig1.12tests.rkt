#lang racket/base

(require rackunit/fsm)

;; ----------------------------------------------------------------------
;; figure 1.12 M4

(require (rename-in "machines/fig1.12dfa.rkt" [M M4]))

(check-accept M4 "a")
(check-accept M4 "b")
(check-accept M4 "aa")
(check-accept M4 "bb")
(check-accept M4 "aaaabbba")

(check-reject M4 "")
(check-reject M4 "ab")
(check-reject M4 "ba")
(check-reject M4 "abb")
(check-reject M4 "aab")
(check-reject M4 "bbba")
