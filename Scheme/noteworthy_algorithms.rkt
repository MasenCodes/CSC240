#lang scheme
;write a Scheme procedure that returns a list of one
;subtracted from the square of each element in the list
;Recursive:
(define act3r
  (lambda (lst)
    (cond
      ((null? lst) '())
      (else (cons (-(* (car lst) (car lst)) 1) (act3r (cdr lst)))))))
;Higher Order Function:
(define act3
  (lambda (lst)
    (map (lambda (ele)(- (* ele ele) 1)) lst)))

;Procedure that finds the symbol 'X in any given list (including nested)
(define findx
  (lambda (lst)
    (cond
      ((null? lst) 'none)
      ((list? (car lst)) (findx (append (car lst) (cdr lst))))
      ((equal? (car lst) 'X) 'X)
      (else (findx (cdr lst))))))

;Procedure that finds the nth Fibbonacci number (tail recursion)
(define tail
  (lambda (old cur stop)
    (cond
      ((equal? stop 0) cur)
      (else (tail cur (+ cur old) (- stop 1))))))

(define fib
  (lambda (n)
    (cond
      ((equal? n 0) 0)
      ((< n 3) 1)
      (else (tail 1 2 (- n 2))))))

;Procedure which returns a list of all elements of lst that also appear in the list n
(define in?
  (lambda (lst ele)
    (cond
      ((null? lst) #f)
      ((equal? ele (car lst)) #t)
      (else (in? (cdr lst) ele)))))

(define remove-them
  (lambda (lst n)
    (cond
      ((null? lst) '())
      ((in? n (car lst)) (cons (car lst) (remove-them (cdr lst) (cdr n))))
      (else (remove-them (cdr lst) n)))))


;Procedure to reverse a list
(define reverse
  (lambda (lst)
    (if (null? lst)
        '()
        (append (reverse (cdr lst)) (list (car lst))))))




