(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

; Some utility functions that you may find useful to implement

(define (zip pairs)
  'replace-this-line
  (if (equal? pairs nil) (list nil nil)
      (let ((first (car pairs)) (rest (zip (cdr pairs))))
           (list (cons (car first) (car rest))
                 (cons (cadr first) (cadr rest)))))
  )


;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 15
  'replace-this-line
  (define (helper s i)
      (if (equal? s nil) nil 
          (cons (list i (car s)) (helper (cdr s) (+ i 1)))))
  (helper s 0)
  )
  ; END PROBLEM 15

;; Problem 16

;; Merge two lists LIST1 and LIST2 according to COMP and return
;; the merged lists.
(define (merge comp list1 list2)
  ; BEGIN PROBLEM 16
  'replace-this-line
  (cond ((equal? list1 nil) list2)
        ((equal? list2 nil) list1)
        (else (let ((x (car list1)) (y (car list2)))
                   (if (comp x y)
                       (cons x (merge comp (cdr list1) list2))
                       (cons y (merge comp list1 (cdr list2)))))))
  )
  ; END PROBLEM 16


(merge < '(1 5 7 9) '(4 8 10))
; expect (1 4 5 7 8 9 10)
(merge > '(9 7 5 1) '(10 8 4 3))
; expect (10 9 8 7 5 4 3 1)

;; Problem 17

(define (nondecreaselist s)
    ; BEGIN PROBLEM 17
    'replace-this-line
    (cond ((equal? s nil) nil)
          ((equal? (cdr s) nil) (list s))
          ((> (car s) (cadr s)) (cons (list (car s)) (nondecreaselist (cdr s))))
          (else (let ((rest (nondecreaselist (cdr s))))
                     (cons (cons (car s) (car rest)) (cdr rest)))))
    )
    ; END PROBLEM 17

;; Problem EC
;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN PROBLEM EC
         'replace-this-line
         expr
         ; END PROBLEM EC
         )
        ((quoted? expr)
         ; BEGIN PROBLEM EC
         'replace-this-line
         (cons 'quote (cdr expr))
         ; END PROBLEM EC
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM EC
           'replace-this-line
        ;   (cons form (cons params body))
           (cons form (cons params (map let-to-lambda body)))
           ; END PROBLEM EC
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN PROBLEM EC
           'replace-this-line
           (let ((values (zip values)))
                ; (cons (cons 'lambda (cons (car values) body)) (cadr values)))
                (cons (cons 'lambda (cons (car values) (map let-to-lambda body))) (map let-to-lambda (cadr values))))
           ; END PROBLEM EC
           ))
        (else
         ; BEGIN PROBLEM EC
         'replace-this-line
        ;  expr
         (map let-to-lambda expr)
         ; END PROBLEM EC
         )))

