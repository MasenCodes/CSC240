#lang scheme
(require "project3test.scm")


(define remove-next-to-last
  (lambda (lst)
    (cond
      ((null? lst) 'null-list)
      ((null? (cdr (cdr lst))) (cdr lst))
      (else (cons (car lst) (remove-next-to-last (cdr lst)))))))

(define slope
  (lambda (a b)
    (cond
      ((or (not (pair? a)) (not (pair? b))) 'invalid-input)
      (else (/ (- (cdr a) (cdr b)) (- (car a) (car b)))))))

(define in?
  (lambda (lst ele)
    (cond
      ((null? lst) #f)
      ((equal? (car lst) ele) #t)
      (else (in? (cdr lst) ele)))))

(define remove-all-dups
  (lambda (lst)
     (cond
       ((null? lst) '())
       ((in? (cdr lst) (car lst)) (remove-all-dups (cdr lst)))
       (else (cons (car lst) (remove-all-dups (cdr lst)))))))

(define remove-dups
  (lambda (lst)
    (cond
      ((null? lst) '())
      ((null? (cdr lst)) lst)
      ((equal? (car lst) (car (cdr lst))) (remove-dups (cdr lst)))
      (else (cons (car lst) (remove-dups (cdr lst)))))))

(define invert
  (lambda (lst)
    (cond
      ((not (list? lst)) lst)
      ((null? lst) '())
      ((list? (car lst)) (append (invert (cdr lst)) (list (invert (car lst)))))
      (else (append (invert (cdr lst)) (list(car lst)))))))

(define largest
  (lambda (cur lst)
    (cond
      ((null? lst) (list cur))
      ((< cur (car lst)) (largest (car lst) (cons cur (cdr lst))))
      (else (cons (car lst) (largest cur (cdr lst)))))))

(define merge-sort
  (lambda (lst len)
    (cond
      ((= 0 len) lst)
      (else (merge-sort (largest (car lst) (cdr lst)) (- len 1))))))

; to have the function play nice with test cases I named the primary
; function accordingly, at heart this is a merge sort algo
(define insertion-sort
  (lambda (lst)
    (merge-sort lst (length lst))))

(define power
  (lambda (x n)
    (cond
      ((eq? n 0) 1)
      ((* x (power x (- n 1)))))))

(define eval-poly
  (lambda (p x)
    (cond
      ((null? p) 0)
      (else (+ (* (car (car p)) (power x (cdr (car p)))) (eval-poly (cdr p) x))))))

(define get-poly-fun
  (lambda (p)
    (lambda (x)
      (eval-poly p x))))

; Test code
; Thanks for a fun unit, I enjoyed solving these problems :)
(test-remove-next-to-last remove-next-to-last)
(test-slope slope)
(test-remove-dups remove-dups)
(test-invert invert)
(test-insertion-sort insertion-sort)
(test-eval-poly eval-poly)
(test-get-poly-fun get-poly-fun)


      





 

    
      






      



                                







