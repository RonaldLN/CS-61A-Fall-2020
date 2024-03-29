;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <the pink killa>
;;;
;;; Description:
;;;   <I am pink.
;;;    CS is green.
;;;    rip.>

(define (draw)
  (speed 10)
  (penup)
  (setposition 200 0)
  (pendown)
  (spiral 200)
  (right 180)
  (killer 1) (killer 0)
  (inno 1) (inno 0)

  (setposition -66 -12)
  (pendown)
  (setposition -68 -18)
  (setposition -59 -19)
  (setposition -66 -12)
  (penup)

  (setposition -70 -25)
  (pendown)
  (setposition -72 -31)
  (setposition -63 -30)
  (setposition -70 -25)
  (penup)

  (setposition -73 -39)
  (pendown)
  (setposition -73 -46)
  (setposition -63 -42)
  (setposition -73 -39)
  (penup)

  (teeth -57 -46)
  (teeth -43 -46)
  (teeth -32 -45)
  (eye -80 0)
  (eye 90 -10)
  (hat)

  ;spear
  (setposition -73 -50)
  (pendown) (begin_fill)
  (setposition 65 -12)
  (setposition -70 -55)
  (end_fill)(penup)
  (setposition 108 3)
  (pendown)
  (setposition 138 12)
  (penup)

  (setposition 250 0)

  (exitonclick))

(define (killer c)
  (if (= c 1) (and (color "green") (begin_fill)) (color "black"))
  (setposition -66 -7)
  (pendown)
  (setposition -79 3)
  (setposition -112 -17)
  (setposition -120 -45)
  (setposition -90 -66)
  (setposition -87 -93)
  (setposition -80 -97)
  (setposition -70 -97)
  (setposition -61 -93)
  (forward 18)
  (right 90) (forward 13)
  (right 90) (forward 15)
  (setposition -45 -92)
  (right 270) (forward 16)
  (setposition -26 -88)
  (setposition -21 -54)
  (setposition -70 -55)
  (setposition -73 -50)
  (right 270) (forward 15)
  (setposition -66 -7)
  (if (= c 1) (end_fill))
  (penup)
  (setposition -125 -54)
  (pendown)
  (if (= c 1) (begin_fill))
  (setposition -90 -75)
  (setposition -90 -66)
  (setposition -120 -45)
  (if (= c 1) (end_fill))
  (penup)
)

(define (inno c)
  (if (= c 1) (and (color "pink") (begin_fill)) (color "black"))
  (setposition 50 0)
  (pendown)
  (setposition 53 11)
  (setposition 60 18)
  (setposition 70 22)
  (setposition 80 23)
  (setposition 90 22)
  (setposition 100 14)
  (setposition 108 0)
  (setposition 110 -30)
  (setposition 110 -74)
  (setposition 107 -87)
  (setposition 103 -93)
  (setposition 96 -93)
  (setposition 90 -87)
  (setposition 90 -71)
  (setposition 80 -71)
  (setposition 79 -83)
  (setposition 74 -90)
  (setposition 65 -90)
  (setposition 58 -80)
  (setposition 55 -50)
  (setposition 52 -27)
  (setposition 50 0)
  (if (= c 1) (end_fill))
  (penup)
  (setposition 108 -8)
  (pendown)
  (if (= c 1) (begin_fill))
  (setposition 122 -8)
  (setposition 122 -55)
  (setposition 109 -55)
  (if (= c 1) (end_fill))
  (penup)
)

(define (hat)
  (setposition -135 -40)
  (color "black")
  (pendown) (begin_fill)
  (right 270) (forward 15)
  (right 90) (forward 45)
  (right 90) (forward 20)
  (setposition -126 22)
  (setposition -120 28)
  (setposition -114 28)
  (setposition -111 22)
  (right 90) (forward 32)
  (setposition -115 -27)
  (setposition -120 -40)
  (setposition -125 -54)
  (setposition -130 -62)
  (setposition -135 -61)
  (right 90) (forward 21)
  (end_fill) (penup)
)

(define (teeth x y)
  (setposition x y)
  (color "black")
  (pendown)
  (setposition (+ x 5) (- y 9))
  (setposition (- x 7) (- y 9))
  (setposition x y)
  (penup)
)

(define (eye x y)
  (setposition x y)
  (color "white") (pendown) (begin_fill)
  (circle 25) (end_fill)
  (color "black") (circle 25)
  (penup)
)

;spiral recursively
(define (spiral radius)
  (if (< radius 0) (penup)
  (begin (color "#DC143C") (circle radius 180)
  (spiral (- radius 10))))
)

; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
