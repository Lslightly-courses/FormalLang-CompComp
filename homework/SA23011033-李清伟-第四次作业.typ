#import "TypstTemplates/templates/assignment.typ": *
#import "@preview/cetz:0.2.2": canvas, tree, draw
#import "@preview/cuti:0.2.0": show-cn-fakebold
#show: show-cn-fakebold

#set math.equation(numbering: "(1)")

#show: project.with(
  title: "第四次作业",
  authors: (
    (name: "李清伟", email: ""),
  ),
)

= 3.1

#let box(c) = $space #c space$
#let q1 = $box(q_1)$
#let q2 = $box(q_2)$
#let q3 = $box(q_3)$
#let q4 = $box(q_4)$
#let q5 = $box(q_5)$
#let q6 = $box(q_6)$
#let q7 = $box(q_7)$
#let q8 = $box(q_8)$
#let acc = $box(q_("accept"))$
#let rej = $box(q_("reject"))$
#let cross = $box(times)$
#let b0 = $box(0)$
#let b1 = $box(1)$
#let bsharp = $box(\#)$
#let bound = $box(bracket.b)$

a.

$
& q1 b0 bound\
& bound q2 bound\
& bound bound acc
$

b.

$
& q1 b0 b0 bound\
& bound q2 b0 bound \
& bound cross q3 bound \
& bound q5 cross bound \
& q5 bound cross bound \
& bound q2 cross bound \
& bound cross q2 bound \
& bound cross bound acc
$

c.

$
& q1 b0 b0 b0 bound\
& bound q2 b0 b0 bound\
& bound cross q3 b0 bound\
& bound cross b0 q4 bound\
& bound cross b0 bound rej
$

d.

$
& q1 b0 b0 b0 b0 b0 b0 bound\
& bound q2 b0 b0 b0 b0 b0 bound\
& bound cross q3 b0 b0 b0 b0 bound\
& bound cross b0 q4 b0 b0 b0 bound\
& bound cross b0 cross q3 b0 b0 bound\
& bound cross b0 cross b0 q4 b0 bound\
& bound cross b0 cross b0 cross q3 bound\
& bound cross b0 cross b0 q5 cross bound\
& bound cross b0 cross q5 b0 cross bound\
& bound cross b0 q5 cross b0 cross bound\
& bound cross q5 b0 cross b0 cross bound\
& bound q5 cross b0 cross b0 cross bound\
& q5 bound cross b0 cross b0 cross bound\
& bound q2 cross b0 cross b0 cross bound\
& bound cross q2 b0 cross b0 cross bound\
& bound cross cross q3 cross b0 cross bound\
& bound cross cross cross q3 b0 cross bound\
& bound cross cross cross b0 q4 cross bound\
& bound cross cross cross b0 cross q4 bound\
& bound cross cross cross b0 cross bound rej
$

= 3.2

a.

$
& q1 b1 b1 bound\
& cross q3 b1 bound\
& cross b1 q3 bound\
& cross b1 bound rej
$

b.

$
& q1 b1 bsharp b1 bound\
& cross q3 bsharp b1 bound\
& cross bsharp q5 b1 bound\
& cross q6 bsharp cross bound\
& q7 cross bsharp cross bound\
& cross q1 bsharp cross bound\
& cross bsharp q8 cross bound\
& cross bsharp cross q8 bound\
& cross bsharp cross bound acc
$

c.

$
& q1 b1 bsharp bsharp b1 bound\
& cross q3 bsharp bsharp b1 bound\
& cross bsharp q5 bsharp b1 bound\
& cross bsharp bsharp rej b1 bound\
& cross bsharp bsharp b1 rej bound\
& cross bsharp bsharp b1 bound rej
$

d.

$
& q1 b1 b0 bsharp b1 b1 bound\
& cross q3 b0 bsharp b1 b1 bound\
& cross b0 q3 bsharp b1 b1 bound\
& cross b0 bsharp q5 b1 b1 bound\
& cross b0 q6 bsharp cross b1 bound\
& cross q7 b0 bsharp cross b1 bound\
& q7 cross b0 bsharp cross b1 bound\
& cross q1 b0 bsharp cross b1 bound\
& cross cross q2 bsharp cross b1 bound\
& cross cross bsharp q4 cross b1 bound\
& cross cross bsharp cross q4 b1 bound\
& cross cross bsharp cross b1 rej bound\
& cross cross bsharp cross b1 bound rej
$

e.

$
& q1 b1 b0 bsharp b1 b0 bound\
& cross q3 b0 bsharp b1 b0 bound\
& cross b0 q3 bsharp b1 b0 bound\
& cross b0 bsharp q5 b1 b0 bound\
& cross b0 q6 bsharp cross b0 bound\
& cross q7 b0 bsharp cross b0 bound\
& q7 cross b0 bsharp cross b0 bound\
& cross q1 b0 bsharp cross b0 bound\
& cross cross q2 bsharp cross b0 bound\
& cross cross bsharp q4 cross b0 bound\
& cross cross bsharp cross q4 b0 bound\
& cross cross bsharp q6 cross cross bound\
& cross cross q6 bsharp cross cross bound\
& cross q7 cross bsharp cross cross bound\
& cross cross q1 bsharp cross cross bound\
& cross cross bsharp q8 cross cross bound\
& cross cross bsharp cross q8 cross bound\
& cross cross bsharp cross cross q8 bound\
& cross cross bsharp cross cross bound acc
$

= 3.7

根据Matijasevic theorem，为一个多变量多项式计算边界是不可能的，所以不是合法图灵机。

= 3.8

#import "@preview/algo:0.3.3": algo, i, d, comment, code

a.


#algo(
  title: "Equal01",
  parameters: ($w$, [empty tape $t$]),
)[
  #let begin = [#i#linebreak(justify: false)]
  #let end = [#d#linebreak(justify: false)]
  write \# in tape $t$\
  for character c in $w$: #i\
    if c = 0: #i\
      move head to the right
    #d\ else: #i\
      move head to the left
    #d
  #d\
  c = read the character under head\
  return accept if c is \# else reject
]

b.

#algo(
  title: "Twise1Equal0",
  parameters: ($w$, [empty tape $t$])
)[
  write \# in tape $t$\
  for character c in $w$:#i\
    if c = 0: #i\
      move head to the right *once*
    #d\ else: #i\
      move head to the left *twice*
    #d
  #d\
  c = read the character under head\
  return accept if c is \# else reject
]

c.

#algo(
  title: "NotTwise1Equal0",
  parameters: ($w$, [empty tape $t$])
)[
  return accept if #smallcaps[Twise1Equal0] ($w$, $t$) is reject else accept
]

