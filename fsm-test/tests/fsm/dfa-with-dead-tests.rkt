#lang racket/base

(require rackunit/fsm)

(require "machines/dfa-with-dead.rkt")

(check-reject M "")
(check-reject M "bbb")
(check-reject M "abbbab")
(check-accept M "ab")
(check-accept M "abbb")
