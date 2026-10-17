;;;; Taken from <https://rosettacode.org/wiki/Factorial#Scheme>
;;;; Licensed under GFDL 1.3
(define (factorial n)
  (if (<= n 0)
      1
      (* n (factorial (- n 1)))))
(display (factorial 4))
