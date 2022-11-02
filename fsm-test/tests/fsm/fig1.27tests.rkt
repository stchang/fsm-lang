#lang racket/base

(require rackunit/fsm)

;; ----------------------------------------------------------------------
;; figure 1.27 N1

(require (rename-in "machines/fig1.27nfa.rkt" [M N1]))

(check-accept N1 "010110")
(check-accept N1 "101")
(check-accept N1 "11")

(check-reject N1 "")
(check-reject N1 "010")
