#lang racket/base

(provide (all-defined-out))

(require racket/port)

(define (input->list str)
  (for/list ([c str])
    (with-input-from-string (string c) read)))

