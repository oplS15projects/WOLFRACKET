;   @file   param-handler.rkt
;   @author Jose Flores <jose.flores.152@gmail.com>
;
;   This file holds the param-handler class.


(require json)
;   @name param-handler
(define (param-handler)

    ; PARAMETERS
    (define (get-param->string req param)
    (if (eq? #f (bindings-assq (string->bytes/utf-8 param)
                               (request-bindings/raw req)))
        ""
        (bytes->string/utf-8 (binding:form-value (bindings-assq (string->bytes/utf-8 param)
                                                               (request-bindings/raw req))))))

    (define (converter->string input)
        (cond ((number? input) (number->string input))
              ((string? input)  input)
              ((boolean? input) (if input
                                 "\"true\""
                                 "\"false\""))
             (else "error")))

    (define (cs-string->list str)
        (begin (display (jsexpr->string str))

                (for-each (lambda (arg)
                                 (printf "~a~n" arg))
                         (string-split (substring str 1 (- (string-length str) 1)) ","))

               (map string->number (string-split (substring str 1 (- (string-length str) 1)) ","))))


    (define (param->list req id)
        (cs-string->list (get-param->string req id)))

    (define (list->param lst)
        (string-join (map converter->string lst) ","))

    ;   CONTROLLER
    ;   Delegates which method to call
    (define (controller m)
        (begin  (display m)
        (cond ((equal? m "string->list") param->list)
              ((equal? m "list->string") list->param)
              (else "api-404"))))

    controller)
