

(require math/number-theory)
(require math)
(require math/base)
(require plot)

(define (my_math)

    (define my_add
        (lambda (lst) (list (+ (car lst) (cadr lst)))))

    (define my_subtract
        (lambda (lst) (list (- (car lst) (cadr lst)))))

    (define my_multiply
        (lambda (lst) (list (* (car lst) (cadr lst)))))

    (define my_divide
        (lambda (lst) (list (/ (car lst) (cadr lst)))))

    (define my_exponent
        (lambda (lst) (list (expt (car lst) (cadr lst)))))



    (define my_prime
        (lambda (lst) (list (prime? (car lst)))))


    (define my_logarithm
        (lambda (lst) (list (log (car lst)))))

    (define my_factorial
        (lambda (lst) (list (factorial (car lst)))))



    (define my_sin
        (lambda (lst) (list (sin (car lst)))))

    (define my_cos
        (lambda (lst) (list (cos (car lst)))))

    (define my_sqrt
        (lambda (lst) (list (sqrt (car lst)))))



    (define (handler)
        (lambda (action)
            (cond   ((eq? action "add") my_add)
                    ((eq? action "subtract") my_subtract)
                    ((eq? action "multiply") my_multiply)
                    ((eq? action "divide") my_divide)
                    ((eq? action "exponent") my_exponent)

                    ((eq? action "prime") my_prime)

                    ((eq? action "logarithm") my_logarithm)

                    ((eq? action "factorial") my_factorial)

                    ((eq? action "sin") my_sin)
                    ((eq? action "cos") my_cos)
                    ((eq? action "sqrt") my_sqrt)
                    (else #f))))

    (handler))
