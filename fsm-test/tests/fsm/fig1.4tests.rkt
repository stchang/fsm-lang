#lang racket/base

(require rackunit/fsm)

;; ----------------------------------------------------------------------
;; figure 1.4, 1.6: M1

(require (rename-in "machines/fig1.4dfa.rkt" [M M1]))
(check-accept M1 '(1 1 0 1))
(check-accept M1 '(1))
(check-accept M1 '(0 1))
(check-accept M1 '(1 1))
(check-accept M1 '(0 1 0 1 0 1 0 1 0 1))

(check-accept M1 "1101")
(check-accept M1 "1")
(check-accept M1 "01")
(check-accept M1 "11")
(check-accept M1 "0101010101")

(check-reject M1 "0")
(check-reject M1 "10")
(check-reject M1 "101000")

