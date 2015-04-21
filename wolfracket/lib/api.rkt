;   @file   api.rkt
;   @author Jose Flores <jose.flores.152@gmail.com>
;
;   This file holds the api.

;   REQUIRES
(require web-server/servlet
         web-server/servlet-env)

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

    ; PARAMETERS
    (define (get-param->string req param)
    (if (eq? #f (bindings-assq (string->bytes/utf-8 param)
                               (request-bindings/raw req)))
        ""
        (bytes->string/utf-8 (binding:form-value (bindings-assq (string->bytes/utf-8 param)
                                                               (request-bindings/raw req))))))

    ;   RESPONSES
    ;   The api documentation page
    (define (api-home req)
            (response/xexpr
                `(html  (head (title "API"))
                        (body (p "Racket Mathematics and Graphing API Project Documentation Page")))))

    ;   The addition api method
    (define (api-add req)
            (response/xexpr
                (list 'html (list 'head (list 'title "ADD"))
                        (list 'body (list 'p "Addition method") (list 'p (get-param->string req "p"))))))

    ;   The method not found page
    (define (api-404 req)
            (response/xexpr
                `(html  (head (title "404"))
                        (body (p "API Resource not found.")))))

    ;   CONTROLLER
    ;   Delegates which method to call
    (define (controller m p)
        (cond ((equal? m "home") api-home)
              ((equal? m "add") api-add)
              (else api-404)))

    controller)





