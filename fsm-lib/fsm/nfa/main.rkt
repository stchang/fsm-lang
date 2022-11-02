#lang racket
(provide (rename-out [nfa-begin #%module-begin])
         unquote EMP)
         ;; (for-syntax (rename-out [epsilon EPS]
         ;;                         [epsilon ε])))
         
(require (for-syntax #;(for-syntax racket/base
                                 syntax/parse)
                     syntax/parse)
         racket/stxparam
         fsm/nogui
         fsm/utils)

;; when used outside nfa def, treat as empty string
(define-syntax-parameter epsilon
  (syntax-parser
    #'null))
#;(begin-for-syntax
  (define-syntax epsilon
    (syntax-parser
      [:id #'(unquote EPS)])))

(define-syntax nfa-begin
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
          (make-ndfa 'Q 'Sigma 'q1 'F `delta)) ; quasiquote, to allow EPS
        (module+ main
          (command-line
           #:program "NFA"
           #:args (input)
;           (displayln input)
           (displayln (sm-apply M (input->list input))))))]))
