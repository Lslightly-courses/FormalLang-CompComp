#import "TypstTemplates/templates/basic.typ": *
#import "local.typ": *
#import "TypstTemplates/templates/theory.typ": *

#show: project.with(
  title: "2.1 Automata & Regular Language",
  authors: (
    (name: "Lslightly", email: ""),
  ),
)

#let linkToSlides(page) = [see #pdfPageLink("2.1.pdf", page)]
= Regular Languages
== Finite Automata

finite automata M recognizes language A, if $A = {w | M "accepts" w}$

Regular language if some finite automation recognizes it.

=== Design finite automata

1. determine finite list of possibilities
2. assign states
3. assign the transitions
4. add start/accept states

=== Define regular operations

#let concat = $compose$

- Union $A union B$
- Concat $A concat B $
- star $A^* = {epsilon} union A union (A concat A) union (A concat A concat A) union ...$

=== Closed

#linkToSlides(55): Closed is a property of a collection of objects under some operations if applying that operation to members of the collection returns an object still in the collection.

=== Closed under Union

#theorem[
  Regular language is closed under *Union* operation.
]

#proof[
  Proof by Construction

  $(r_1, r_2)$ as states

  $delta ((r_1, r_2), a) = (delta_1(r_1, a), delta_2(r_2, a))$

  $q_0 = (r_1, r_2)$

  $F = {(r_1, r_2)|r_1 in F_1 or r_2 in F_2}$
]

=== introduce NFA

for #concat operation, nondeterminism/NFA is introduced. Just consider the accept states of M1 as input states of M2 is unsafe becuase accept states will have multiple output for one input, which is nondeterministic and violate the DFA definition. Thus nondeterminism should be introduced. 

NFA accept if any one of NFA copy machine is in accept state, NFA accepts the string.

=== Equivalence of NFA and DFA

Powerset of NFA states are the running states of NFA copy machines. Each running state is a set of NFA states.

construct the DFA for NFA's running state(configuration). #linkToSlides(95)

=== Closed Under Concat

#theorem[
  Regular language is closed under *Concat* operation. #linkToSlides(98)
]

#proof[
  see transfer function. #linkToSlides(99)
]

=== Closed Under Star

#theorem[
  Regular language is closed under *Star* operation. #linkToSlides(100)
]

#proof[
  see construction. #linkToSlides(100)
]

=== Regular operations and theorems $->$ Regular Expressions

Regular Expressions Definition, #linkToSlides(111).

*special regular expressions* $emptyset^* = {epsilon}$, #linkToSlides(118)

#theorem[
  Language designed by regular expression is regular language.
]

#proof[
  Proof by construction, #linkToSlides(123)
]

#theorem[
  if a language is regular, then it can be described by regular expression, #linkToSlides(129)
]

#proof[
GNFA, #linkToSlides(131)

steps, #linkToSlides(129)

step1, #linkToSlides(138)，初始状态添加一个新的初始状态，添加 $epsilon$ 边。对所有接受状态，添加 $epsilon$ 边到新唯一接受状态，将同向的同src和dst的边通过“或”合并。对于没要边相连的结点，添加 $emptyset$ 边，即转不过去。

step2, #linkToSlides(141)。在repair的过程中，对于所有入结点和出结点，添加入结点到出结点的“或”正则表达式部分。
]

=== Non-regular Languages

example: ${0^n 1^n | n >= 0}$

#theorem[Pumping Lemma for regular languege. if A is a regular language, then there exists pumping length p, where if s is a string of A of length >= p, then s may be divided to xyz and satisfy 3 conditions. #linkToSlides(164)]

第三点是如何证明的？The length > p，总是可以缩减。

#theorem[${0^n 1^n}$ is not regular language. #linkToSlides(171)]

p is the pumping length.

$0^p 1^p$ 拆分为 $x y z$，y可能为:
1. 包含0
2. 包含1
3. 包含0，1。模式只能为 $0^x 1^x$，但是拼接时顺序不一致。


