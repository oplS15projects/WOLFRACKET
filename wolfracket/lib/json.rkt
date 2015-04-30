;   @file   json.rkt
;   @author Jose Flores <jose.flores.152@gmail.com>
;
;   This file holds the json class.

;   REQUIRES
(require json)

;   Namespace for eval
(define-namespace-anchor anc)


; Structure definition
(struct user (first-name last-name password))

; Struct to jsexpr converter
(define (user->jsexpr user)
  (hasheq 'first-name (user-first-name user)
          'last-name (user-last-name user)
          'password (user-password user)))


;   @name json
(define (json)

    ;   LIST METHODS
    ; List of structs converter to jsexpr
    (define list:struct->jsexpr
        (lambda (struct-type lst)
            (define string->proc
                (lambda (x) ((eval (read (open-input-string (string-append struct-type
                                                                           "->jsexpr")))
                                    ns) x)))
            (map string->proc lst)))

    ; Struct to jsexpr converter
    (define (jsexpr->user my-hash)
        (hash-values my-hash))

    ;   READ

    ;   WRITE

    ;   CONTROLLER
    ;   Delegates which method to call
    (define (controller m)
        (begin  (display m)
        (cond ((equal? m "read") json-read)
              ((equal? m "write") json-write)
              (else api-404))))

    controller)
