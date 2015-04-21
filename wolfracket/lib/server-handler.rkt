;   @file   server-handler.rkt
;   @author Jose Flores <jose.flores.152@gmail.com>
;
;   This file holds the web server.

;   REQUIRES
(require racket/include
         web-server/servlet
         web-server/servlet-env
         web-server/dispatch
         web-server/dispatchers/dispatch-servlets
         net/url-structs)

(require net/url)
(require web-server/http/request-structs)
;   Including the api, this is needed because the server has an api interface
(include "api.rkt")

;   @name server-handler
;
;   The server-handler delegates page requests and generates responses. It
;   integrates the api with the system
;
;   Pages are currently limited and are created as placeholders
;
;   @usage      ((server-handler) 'start)
;
;   @param      m       the server action to take
;
;   @return     json    the calculated output or error message
(define (server-handler)

    ; PARAMETERS
    (define (get-param->string req param)
        (if (eq? #f (bindings-assq (string->bytes/utf-8 param)
                                   (request-bindings/raw req)))
            ""
            (bytes->string/utf-8 (binding:form-value (bindings-assq (string->bytes/utf-8 param)
                                                                   (request-bindings/raw req))))))

    ;   PAGES
    ;   The home page
    (define (home req)
        (response/xexpr
            `(html  (head (title "Home"))
                    (body (p "Racket Mathematics and Graphing API Project Page")))))
    ;   404 page
    (define (my-404 req)
            (response/xexpr
                `(html  (head (title "404"))
                        (body (p "Resource not found, api not accessed.")))))

    ;   API INTERFACE
    (define (api-interface req [method "home"] [param "none"])
        ;(begin (display req)
                (((api) method param) req));)

    ; test
    (define (test req [arg ""])
        (response/xexpr
            `(html  (head (title "500"))
                    (body (p "hello")))))

    ;   URL DISPATCHING
    ;   Recieve and process request
    (define (start request)
        (dispatch request))

    ;   Determine url
    (define-values (dispatch url)
        (begin (display url)
        (dispatch-rules
            [("home") home]
            [("test" (string-arg)) test]
            [("api") api-interface]
            [("api" (string-arg)) api-interface]
            [("api" (string-arg) (string-arg)) api-interface]
            [else my-404])))

    ;   SERVER
    ;   start server
    (define (execute)
            (serve/servlet start
                #:port 8080
                #:listen-ip #f          ;   listen for external requests
                #:servlet-path ""
                #:servlet-regexp #rx""))

    ;   CONTROLLER
    (define (controller m)
        (cond ((eq? m 'start) (execute))
              (else (error "Invalid Option" m))))

    controller)
