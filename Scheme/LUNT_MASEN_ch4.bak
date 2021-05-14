#lang scheme


(define check-it
  (lambda (x y)
    (cond
      ((< x y) (- y x))
      ((> x y) (- x y))
      (else y))))

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

(define remove-them2
  (lambda (lst n)
    (filter (lambda (ele) (not(in? n ele))) lst)))

(define swap-names
  (lambda (lst)
    (cond
      ((null? lst) '())
      ((equal? 0 (car lst)) (cons 'zero (swap-names (cdr lst))))
      ((equal? 1 (car lst)) (cons 'one (swap-names (cdr lst))))
      ((equal? 2 (car lst)) (cons 'two (swap-names (cdr lst))))
      ((equal? 3 (car lst)) (cons 'three (swap-names (cdr lst))))
      ((equal? 4 (car lst)) (cons 'four (swap-names (cdr lst))))
      ((equal? 5 (car lst)) (cons 'five (swap-names (cdr lst))))
      ((equal? 6 (car lst)) (cons 'six (swap-names (cdr lst))))
      ((equal? 7 (car lst)) (cons 'seven (swap-names (cdr lst))))
      ((equal? 8 (car lst)) (cons 'eight (swap-names (cdr lst))))
      ((equal? 9 (car lst)) (cons 'nine (swap-names (cdr lst))))
      (else (swap-names (cdr lst))))))


(newline) "check-it testing"
(check-it 5 15)
(check-it 15 5)
(check-it 5 5)
(newline) "remove-them testing"
(remove-them '(4 -2 8 2) '(-2 8))
(remove-them '(10 9 8 7 6) '(1 2 3))
(remove-them '(3 -25 8 9) '(3 9))
(newline) "remove-them2 testing"
(remove-them2 '(4 -2 8 2) '(-2 8))
(remove-them2 '(10 9 8 7 6) '(1 2 3))
(remove-them2 '(3 -25 8 9) '(3 9))
(newline) "swap-names testing"
(swap-names '())
(swap-names '(4 2 1 3 8 0 9))
(swap-names '(1 2 3 4 5 6 7 8 9 0))







    


        
