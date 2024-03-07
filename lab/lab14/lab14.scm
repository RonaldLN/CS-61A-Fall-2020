(define (split-at lst n)
  'YOUR-CODE-HERE
  (if (or (null? lst) (= n 0))
      (cons nil lst)
      (let ((rest (split-at (cdr lst) (- n 1))))
           (cons (cons (car lst) (car rest)) (cdr rest))))
)


(define (compose-all funcs)
  'YOUR-CODE-HERE
  (if (null? funcs)
      (lambda (x) x)
      (lambda (x) ((compose-all (cdr funcs)) ((car funcs) x))))
)

