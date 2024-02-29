#import "TypstTemplates/templates/basic.typ": *

#show: project.with(
  title: "2.1 Automata",
  authors: (
    (name: "Lslightly", email: ""),
  ),
)

== Regular Languages

=== Finite Automata

finite automata M recognizes language A, if $A = {w | M "accepts" w}$

Regular language if some finite automation recognizes it.

