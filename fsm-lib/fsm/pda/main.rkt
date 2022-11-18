#lang racket
(provide (rename-out [pda-begin #%module-begin])
         (all-from-out fsm/reprovides))
         
(require (for-syntax syntax/parse)
         fsm/nogui
         fsm/utils
         fsm/reprovides)

(define-syntax pda-begin
  (syntax-parser
    [(_ (~alt (~once (~seq #:states Q) #:name "set of states")
              (~once (~seq #:alphabet Sigma) #:name "alphabet")
              (~once (~seq #:stack-alphabet Gamma) #:name "stack alphabet")
              (~once (~seq #:transitions delta) #:name "transition table")
              (~once (~seq #:start-state q0) #:name "start state")
              (~once (~seq #:accept-states F) #:name "set of accept states"))
        ...)
     #'(#%module-begin
        (provide M)
        (define M
          (make-ndpda `Q 'Sigma 'Gamma 'q0 'F `delta)) ; quasiq allows consts
        (module+ main
          (command-line
           #:program "PDA"
           #:args (input)
;           (displayln input)
           (displayln (sm-apply M (input->list input))))))]))
