#lang racket
(provide (rename-out [dfa-begin #%module-begin]))

(require (for-syntax syntax/parse)
         fsm/nogui
         fsm/utils)

(define-syntax dfa-begin
  (syntax-parser
    [(_ (~alt (~once (~seq #:states Q) #:name "set of states")
              (~once (~seq #:alphabet Sigma) #:name "alphabet")
              (~once (~seq #:transitions delta) #:name "transition table")
              (~once (~seq #:start-state q1) #:name "start state")
              (~once (~seq #:accept-states F) #:name "set of accept states"))
        ...)
     #'(#%module-begin
        (provide M)
        (define M
          (make-dfa 'Q 'Sigma 'q1 'F 'delta))
        (module+ main
          (command-line
           #:program "DFA"
           #:args (input)
;           (displayln input)
           (displayln (sm-apply M (input->list input))))))]))
