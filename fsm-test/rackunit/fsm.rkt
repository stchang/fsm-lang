#lang racket

(provide check-accept
         check-reject
         check-tm-halt
         check-tm-fail)

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

(define-syntax check-tm-halt
  (syntax-parser
    [(_ M x)
     (syntax/loc this-syntax
       (begin
         (check-equal? (sm-type M) 'tm)
         (let ([res (sm-apply M (if (list? x) x (input->list x)))])
           (check-true (list? res))
           (check-equal? (car res) 'Halt:))))]))          

(define-syntax check-tm-fail
  (syntax-parser
    [(_ M x)
     (syntax/loc this-syntax
       (begin
         (check-equal? (sm-type M) 'tm)
         (let ([res (sm-apply M (if (list? x) x (input->list x)))])
           (check-true (string? res))
           (check-equal? 
            res
            "Failed computation: did not reach a halting state. Check your transition rules."))))]))
