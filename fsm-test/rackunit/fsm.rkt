#lang racket

(provide check-accept
         check-reject)

(require (for-syntax syntax/parse)
         rackunit
         fsm/nogui
         fsm/utils)

(define-syntax check-accept
  (syntax-parser
    [(_ fsm x)
     (syntax/loc this-syntax
       (check-equal?
        (sm-apply fsm (if (list? x) x (input->list x)))
        'accept))]))

(define-syntax check-reject
  (syntax-parser
    [(_ fsm x)
     (syntax/loc this-syntax
       (check-equal?
        (sm-apply fsm (if (list? x) x (input->list x)))
        'reject))]))

