#import "TypstTemplates/templates/basic.typ": *
#import "local.typ": *
#import "TypstTemplates/templates/theory.typ": *

#show: project.with(
  title: "Church-Turing Thesis",
  authors: (
    (name: "Lslightly", email: ""),
  ),
)

#let linkToSlides(page) = [see #pdfPageLink("3.1.pdf", page)]

= Turing Machine

go on forever if it does not enter accept or reject state, i.e. never halting.

== Definition

#linkToSlides(13)

$delta: Q times Gamma -> Q times Gamma times {L, R}$, $Gamma$ is the tape alphabet. $Gamma$ in the target type is the new content in the tape.

configuration representation $1101 q_7 01111$ $q_7$ points to the second 0.

yield: $u a q_i b v -> u q_j a c v$ has transition function. $delta(q_i, b) = (q_j, c, L)$

- Turing-recognizable，只针对可以accept的集合，不管reject和loop的情况， #linkToSlides(27)
- Turing-decidable. Decider决定是否accept或者reject某个语言。decider decides the input. #linkToSlides(30)

== Variants




