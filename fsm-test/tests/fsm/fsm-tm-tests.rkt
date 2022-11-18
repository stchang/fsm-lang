#lang racket/base

(require rackunit/fsm)

(require (rename-in "machines/fsm-tm.rkt" [M Ma]))

; (check-tm-halt Ma "") ; buggy?
(check-tm-halt Ma "bbb")
(check-tm-halt Ma "abbbab")
(check-tm-halt Ma "a")
(check-tm-halt Ma "aa")
(check-tm-halt Ma "abbba")

(check-tm-fail Ma "c")
(check-tm-halt Ma "aca")
(check-tm-halt Ma "bcb")
(check-tm-halt Ma "abcba")
(check-tm-halt Ma "abcab")
(check-tm-halt Ma "abacaba")
(check-tm-halt Ma "bbacabb")
