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

(define (corner_l) (circle 2 90))
(define (h size)
  (setheading 0)
  (forward size)
  (corner_l)
  (forward (/ size 11))
  (corner_l)
  (forward (/ size 2.3))
  (rt 90)
  (forward (/ size 5))
  (rt 90)
  (forward (/ size 2.3))
  (corner_l)
  (forward (/ size 11))
  (corner_l)
  (forward size)
  (corner_l)
  (forward (/ size 11))
  (corner_l)
  (forward (/ size 2.3))
  (rt 90)
  (forward (/ size 5))
  (rt 90)
  (forward (/ size 2.3))
  (corner_l)
  (forward (/ size 11)))

(define (color_back c angle)
  (cond ((= angle 360) (forward 400))
  ((= 1 1) (begin (forward 400) (backward 400) (lt 30) (color_back 1 (+ angle 30))))
  (else (color_back c (+ 30 angle)))))

(define (shadow_outline)
  (penup)
  (goto 0 0)
  (lt 210)
  (lt 60)
  (forward 150)
  (rt 150)
  (forward 130)
  (lt 90)
  (forward 43)
  (rt 90)
  (forward 105)
  (lt 90)
  (pendown)
  (color (rgb 0 0 0))
  (lt 80)
  (circle 1200 5)
  (lt 10)
  (circle 1200 5)
  (lt 160)
  (circle 1200 5)
  (lt 10)
  (circle 1200 5)
  (pendown))

(define (visor_outline)
  (penup)
  (color (rgb 0 0 0))
  (goto 0 0)
  (lt 180)
  (lt 60)
  (forward 150)
  (rt 150)
  (pendown)
  (forward 260)
  (lt 120)
  (forward 100)
  (lt 60)
  (forward 160)
  (lt 60)
  (forward 100)
  )
(define (head_outline)
  (color (rgb 0 0 0))
  (penup)
  (goto 0 0)
  (lt 135)
  (forward 300)
  (rt 225)
  (pendown)
  (forward 424)
  (lt 90)
  (circle 900 5)
  (circle 850 5)
  (circle 800 5)
  (circle 750 5)
  (circle 300 20)
  (circle 150 50)
  (circle 150 50)
  (circle 300 20)
  (circle 750 5)
  (circle 800 5)
  (circle 850 5)
  (circle 900 5)
  )


  (define (yellow_circles n d)
  (cond
  ((= n 0) (goto 0 0))
  (else
  (rt d)
  (color (rgb 1 0.75 0))
  (begin_fill)
  (forward 400)
  (lt 90)
  (circle 400 30)
  (lt 90)
  (forward 400)
  (end_fill)
  (lt d)
  (yellow_circles (- n 1) (+ d 30)))))

 (define (head)
  (color (rgb 0.6 0 0))
  (penup)
  (goto 0 0)
  (lt 135)
  (forward 300)
  (rt 225)
  (pendown)
  (begin_fill)
  (forward 424)
  (lt 90)
  (circle 900 5)
  (circle 850 5)
  (circle 800 5)
  (circle 750 5)
  (circle 300 20)
  (circle 150 50)
  (circle 150 50)
  (circle 300 20)
  (circle 750 5)
  (circle 800 5)
  (circle 850 5)
  (circle 900 5)
  (end_fill))

  (define (visor)
  (penup)
  (color (rgb 0.75 0.75 0.75))
  (goto 0 0)
  (lt 180)
  (lt 60)
  (forward 150)
  (rt 150)
  (pendown)
  (begin_fill)
  (forward 260)
  (lt 120)
  (forward 100)
  (lt 60)
  (forward 160)
  (lt 60)
  (forward 100)
  (end_fill))

  (define (shadow)
  (penup)
  (goto 0 0)
  (lt 210)
  (lt 60)
  (forward 150)
  (rt 150)
  (forward 130)
  (lt 90)
  (forward 43)
  (rt 90)
  (forward 105)
  (lt 90)
  (pendown)
  (color (rgb 0.5 0.5 0.5))
  (begin_fill)
  (lt 80)
  (circle 1200 5)
  (lt 10)
  (circle 1200 5)
  (lt 160)
  (circle 1200 5)
  (lt 10)
  (circle 1200 5)
  (end_fill)
  (pendown))

  (define (finger)
  (color (rgb 0.7 0.13 0.13))
  (begin_fill)
  (forward 300)
  (circle 15 180)
  (forward 140)
  (setheading -40)
  (circle 20 100)
  (setheading -40)
  (circle 20 100)
  (setheading -40)
  (circle 20 100)
  (setheading -40)
  (circle 20 100)
  (setheading -180)
  (forward 80)
  (circle 100 120)
  (end_fill))

  (define (finger_outline)
  (color (rgb 0 0 0))
  (forward 300)
  (circle 15 180)
  (forward 140)
  (setheading -40)
  (circle 20 100)
  (setheading -40)
  (circle 20 100)
  (setheading -40)
  (circle 20 100)
  (setheading -40)
  (circle 20 100)
  (setheading -180)
  (forward 80)
  (circle 100 120))

  ;;;main code
  (bgcolor (rgb 0 0 0))
  (penup)
  (goto 400 0)
  (pendown)
  (color (rgb 1 0.5 0))
  (begin_fill)
  (circle 400)
  (end_fill)

  (goto 0 0)
  (penup)
  (goto 0 0)
  (lt 90)
  (pendown)
  (yellow_circles 2 127)
  (rt 30)
  (yellow_circles 2 100)
  (lt 135)
  (yellow_circles 2 50)
  (rt 15)

  (define (lambda_drawing)
  (rt 90)
  (begin_fill)
  (forward 50)
  (lt 60)
  (forward 200)
  (lt 120)
  (forward 50)
  (lt 60)
  (forward 200)
  (end_fill)
  (lt 120)
  (penup)
  (forward 200)
  (pendown)
  (lt 120)
  (begin_fill)
  (forward 250)
  (rt 120)
  (forward 50)
  (rt 60)
  (forward 250)
  (rt 120)
  (forward 50)
  (end_fill)
  (rt 60)
  (forward 250)
  (lt 60)
  (begin_fill)
  (forward 30)
  (rt 90)
  (forward 10)
  (rt 90)
  (forward 75)
  (rt 60)
  (forward 30)
  (end_fill)
  )


  ;;;(color_back 1 0)
  (color (rgb 0.6 0 0))
  (head)
  (visor)
  (shadow)


  (lt 80)
  (head_outline)
  (visor_outline)
  (shadow_outline)

  (penup)
  (goto 50 -300)
  (pendown)
  (setheading 0)
  (finger)
  (penup)
  (goto 50 -300)
  (pendown)
  (setheading 0)
  (finger_outline)

  (penup)
  (goto -135 125)
  (pendown)
  (lt 80)
  (lambda_drawing)

  (hideturtle)
  (exitonclick))


; Please leave this last line alone.  You may add additional procedures above
; this line.
(draw)



