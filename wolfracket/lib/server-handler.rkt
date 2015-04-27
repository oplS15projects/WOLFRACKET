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
         net/url-structs
         web-server/formlets/input)

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

    ;   PAGES
    ;   The home page
    (define (home req)
        (response/xexpr
            `(html  (head   (meta ((charset "utf-8")))
                            (title "Home")
                            (link ([rel "stylesheet"]
                                   [type "text/css"]
                                   [href "css/main.css"]))
                            (script ((src "http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js")))
                            (script ([type "application/javascript"]
                                   [src "js/main.js"]))

                    (body   (div ((class "header"))
                                (div ((class "title"))
                                     (img ([class "logo"]
                                          [src "http://www.eecs.northwestern.edu/~robby/logos/plt-logo-red-diffuse.png"]))
                                     "Racket Mathematics and Graphing API Project Page")

                                (div ((class "menu"))
                                     (ul (li (a ((href "/home")) "home"))
                                         (li (a ((href "/api")) "api documentation")))))

                                (div ((class "content"))
                                     (h2 "About the Racket Mathematics and Graphing API")
                                     (p "The API is run by a Racket web server and uses racket to produce results. Below is a test form that can be used to see the output of the Racket API.")
                                     (h2 "Test the API")
                                     (form (select ((id "method"))
                                                   (option ((value "add")) "add")
                                                   (option ((value "subtract")) "subtract")
                                                   (option ((value "exponent")) "exponent")
                                                   (option ((value "divide")) "divide")
                                                   (option ((value "prime")) "prime")
                                                   (option ((value "logarithm")) "logarithm")
                                                   (option ((value "factorial")) "factorial")
                                                   (option ((value "sin")) "sin")
                                                   (option ((value "cos")) "cos")
                                                   (option ((value "sqrt")) "sqrt"))

                                            (input ((id "num1")))
                                            (input ((id "num2")))
                                            (input ((id "num3")))
                                            (button ([id "button"]
                                                     [type "button"]
                                                     [onClick "mysubmit();"]) "Submit"))
                                    (h2 "Results")
                                    (p ((id "result")) "Submit for a value")))))))

    ;   404 page
    (define (my-404 req)
            (response/xexpr
                `(html  (head (title "404"))
                        (body (p "Resource not found, api not accessed.")))))

    ;   API INTERFACE
    (define (api-interface req [method "home"] [param "none"])
        ;(begin (display req)
                (((api) method param) req));)


    ;   URL DISPATCHING
    ;   Recieve and process request
    (define (start request)
        (dispatch request))

    (define (serve-css req [arg ""])
        (response 200 #"OK" 0 #"text/css" empty (lambda (op)
            (with-input-from-file arg (lambda () (copy-port
                (current-input-port) op))))))

    (define (serve-js req [arg ""])
        (response 200 #"OK" 0 #"application/javascript" empty (lambda (op)
            (with-input-from-file arg (lambda () (copy-port
                (current-input-port) op))))))

    ;   Determine url
    (define-values (dispatch url)
        (begin (display url)
        (dispatch-rules
            [("home") home]
            [("css" (string-arg)) serve-css]
            [("js" (string-arg)) serve-js]
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
                #:servlet-path "/"
                #:extra-files-paths (list "./htdocs")
                #:servlet-regexp #rx""))

    ;   CONTROLLER
    (define (controller m)
        (cond ((eq? m 'start) (execute))
              (else (error "Invalid Option" m))))

    controller)
