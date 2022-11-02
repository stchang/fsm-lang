#lang racket/base

(require rackunit/fsm)

;; ----------------------------------------------------------------------
;; figure 1.14 M5

(require (rename-in "machines/fig1.14dfa.rkt" [M M5]))

(check-accept M5 "")
(check-accept M5 "0111")
(check-accept M5 "12")
(check-accept M5 "21")
(check-accept M5 "111r111")
(check-accept M5 "111r")

(check-reject M5 "1")
(check-reject M5 "2")
(check-reject M5 "11")
(check-reject M5 "22")
(check-reject M5 "111r1")
(check-reject M5 "11r1")
