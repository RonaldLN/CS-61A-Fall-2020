;;; Scheme Recursive Art Contest Entry
;;;
;;; Please do not include your name or personal info in this file.
;;;
;;; Title: <Your title here>
;;;
;;; Description:
;;;   <It's your masterpiece.
;;;    Use these three lines to describe
;;;    its inner meaning.>

(define (draw)
    (color "#f2d024")
    (setposition -250 -300)
    (begin_fill)
    (forward 600)
    (right-then-forward 90 500)
    (right-then-forward 90 600)
    (right-then-forward 90 500)
    (end_fill)
    (draw-body)
    (draw-backpack)
    (draw-eye)
    (draw-shade)
    (exitonclick))

(define (draw-body)
  (penup)
  (right 90)
  (setposition 150 -300)
  (pendown)
  (color "#d11708")
  (begin_fill)
  (draw-body-helper)
  (end_fill)
  (setposition 150 -300)
  (right 180)
  (color "black")
  (draw-body-helper)
  (right -90)
  (forward 340)
)

(define (draw-body-helper)
  (forward 400)
  (circle 170 180)
  (forward 400)
)

(define (draw-eye)
  (penup)
  (right-then-forward 90 450)
  (right-then-forward 90 35)
  (left 90)
  (pendown)
  (color "#185678")
  (begin_fill)
  (turn-circle left 90 70 180)
  (turn-circle right 20 300 35)
  (turn-circle right 15 70 180)
  (turn-circle right 15 410 30)
  (end_fill)
  (color "#7bbde0")
  (begin_fill)
  (turn-circle left 15 70 30)
  (circle 45 90)
  (turn-circle left 15 410 30)
  (circle 45 90)
  (circle 300 6)
  (turn-circle left 45 300 40)
  (end_fill)
  (penup)
  (left-then-forward 40 20)
  (right 50)
  (pendown)
  (color "white")
  (begin_fill)
  (circle 15 180)
  (turn-circle right 15 400 20)
  (circle 15 180)
  (turn-circle right 20 400 20)
  (end_fill)
)

(define (draw-backpack)
  (color "#d11708")
  (begin_fill)
  (left-then-forward 90 300)
  (right-then-forward 90 60)
  (right-then-forward 90 300)
  (right-then-forward 90 60)
  (end_fill)
  (color "black")
  (right-then-forward 90 300)
  (right-then-forward 90 60)
  (right-then-forward 90 300)
  (right-then-forward 90 400)
)


(define (draw-shade)
  (penup)
  (left-then-forward 75.5 150)
  (pendown)
  (color "#820419")
  (begin_fill)
  (turn-circle left 10 400 30)
  (turn-circle left 40 400 25)
  (turn-circle left 40 410 40)
  (right-then-forward 181.5 357)
  (right-then-forward 90 340)
  (right-then-forward 90 320)
  (end_fill)
  (penup)
  (setposition 151 -40)
  (pendown)
  (begin_fill)
  (right-then-forward 90 59)
  (right-then-forward 90 259)
  (right-then-forward 90 59)
  (right-then-forward 90 259)
  (end_fill)
)

(define (right-then-forward r f)
  (right r)
  (forward f)
)

(define (left-then-forward l f)
  (left l)
  (forward f)
)

(define (turn-circle direction d r s)
  (direction d)
  (circle r s)
)




; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)
