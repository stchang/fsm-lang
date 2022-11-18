#lang racket
(provide (rename-out [tm-begin #%module-begin])
         (all-from-out fsm/reprovides))
         
(require (for-syntax syntax/parse)
         fsm/nogui
         fsm/utils
         fsm/reprovides)

(define-syntax tm-begin
  (syntax-parser
    [(_ (~alt (~once (~seq #:states Q) #:name "set of states")
              (~once (~seq #:alphabet Sigma) #:name "alphabet")
              (~once (~seq #:transitions delta) #:name "transition table")
              (~once (~seq #:start-state q0) #:name "start state")
              (~once (~seq #:halting-states H) #:name "set of halting states")
              (~optional (~seq #:accept-state qaccept) #:name "accept state"))
        ...)
     #:with tm-construct-expr
            (if (attribute qaccept)
                #'(make-tm `Q `Sigma `delta 'q0 'H 'qaccept)
                #'(make-tm `Q `Sigma `delta 'q0 'H))
     #'(#%module-begin
        (provide M)
        (define M tm-construct-expr)          
        (module+ main
          (command-line
           #:program "TM"
           #:args (input)
;           (displayln input)
           (displayln (sm-apply M (input->list input))))))]))
