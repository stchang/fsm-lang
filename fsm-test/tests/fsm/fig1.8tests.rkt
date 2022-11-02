#lang racket/base

(require rackunit/fsm)

;; ----------------------------------------------------------------------
;; figure 1.8: M2

(require (rename-in "machines/fig1.8dfa.rkt" [M M2]))
(check-reject M2 "110")
(check-reject M2 "")
(check-reject M2 "0")
(check-reject M2 "010")
(check-reject M2 "00")
(check-reject M2 "00110")

(check-accept M2 "1101")
(check-accept M2 "1")
(check-accept M2 "11")
(check-accept M2 "01")
(check-accept M2 "000111")
