#lang racket/base

(require rackunit/fsm)

;; ----------------------------------------------------------------------
;; figure 1.9: M3

(require (rename-in "machines/fig1.9dfa.rkt" [M M3]))
(check-accept M3 "110")
(check-accept M3 "")
(check-accept M3 "0")
(check-accept M3 "010")
(check-accept M3 "00")
(check-accept M3 "00110")

(check-reject M3 "1101")
(check-reject M3 "1")
(check-reject M3 "11")
(check-reject M3 "01")
(check-reject M3 "000111")
