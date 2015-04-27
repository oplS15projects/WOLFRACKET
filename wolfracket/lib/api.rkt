;   @file   api.rkt
;   @author Jose Flores <jose.flores.152@gmail.com>
;
;   This file holds the api.

;   REQUIRES
(require racket/include
         web-server/servlet
         web-server/servlet-env)

(include "param-handler.rkt")
(include "math.rkt")

;   @name api
;
;   The api recieves requests from the server-handler and processes them through
;   a json parsing class, and then executing the requests. It then repackages
;   the requests and returns them to the caller.
;
;   Methods are currently limited and are created as placeholders
;
;   @usage      (((api) m) req)
;
;   @param      m       the api page being accessed
;   @param      req     the request being made
;
;   @return     json    the calculated output or error message
(define (api)



    ;   RESPONSES
    ;   The API Documentation page
    (define (api-home req)
            (response/xexpr
                `(html  (head (title "API"))
                        (body (p "Racket Mathematics and Graphing API Project Documentation Page")))))

    ;   API Function Execution
    (define (api-func method param min-param req)
        (response/xexpr
                #:mime-type #"application/json"
                (string-join (list "["
                                    (((param-handler) "list->string" )
                                        (if (param-count? min-param (((param-handler) "string->list") req
                                                                                            param))
                                            (((my_math) method) (((param-handler) "string->list") req
                                                                                            param))
                                            (list "error")))
                                    "]")
                             "")))

    (define (param-count? min-param lst)
        (>= (length lst) min-param))

    ;   The API Methods
    (define (api-add req)
        (api-func "add" "j" 2 req))

    (define (api-subtract req)
        (api-func "subtract" "j" 2 req))

    (define (api-exponent req)
        (api-func "exponent" "j" 2 req))

    (define (api-divide req)
        (api-func "divide" "j" 2 req))

    (define (api-prime req)
        (api-func "prime" "j" 1 req))

    (define (api-logarithm req)
        (api-func "logarithm" "j" 1 req))

    (define (api-factorial req)
        (api-func "factorial" "j" 1 req))

    (define (api-sin req)
        (api-func "sin" "j" 1 req))

    (define (api-cos req)
        (api-func "cos" "j" 1 req))

    (define (api-sqrt req)
        (api-func "sqrt" "j" 1 req))


    ;   The Method not found page
    (define (api-404 req)
            (response/xexpr
                `(html  (head (title "404"))
                        (body (p "API Resource not found.")))))

    ;   CONTROLLER
    ;   Delegates which method to call
    (define (controller action p)
        (begin  ;(set! msg m)
                (cond ((equal? action "home") api-home)
                      ((equal? action "add") api-add)
                      ((equal? action "subtract") api-subtract)
                      ((equal? action "exponent") api-exponent)
                      ((equal? action "divide") api-divide)
                      ((equal? action "prime") api-prime)
                      ((equal? action "logarithm") api-logarithm)
                      ((equal? action "factorial") api-factorial)
                      ((equal? action "sin") api-sin)
                      ((equal? action "cos") api-cos)
                      ((equal? action "sqrt") api-sqrt)
                      (else api-404))))

    controller)





