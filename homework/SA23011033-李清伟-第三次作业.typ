#import "TypstTemplates/templates/assignment.typ": *
#import "@preview/cetz:0.2.2"
#import cetz.tree


#show: project.with(
  title: "第三次作业",
  authors: (
    (name: "李清伟", email: ""),
  ),
)

= 2.1

#let EpT = $E + T$
#let TmF = $T times F$
#let bE = $\( E \)$

a. $a$

#tree.tree(
  (
    $E$,
    (
      $T$,
      ($F$, $a$)
    )
  )
)

leftmost derivation:

$
E => T => F => a
$

b. $a+a$

#let apa = (
    $E$,
    (
      $E$,
      (
        $T$,
        ($F$, $a$)
      )
    ),
    (
      $+$
    ),
    (
      $T$,
      ($F$, $a$)
    )
  )

#tree.tree(
  apa
)

leftmost derivation:

$
E => E + T => T + T => F + T => a + T => a + F => a + a
$

c.


