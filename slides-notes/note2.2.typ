#import "TypstTemplates/templates/basic.typ": *
#import "local.typ": *
#import "TypstTemplates/templates/theory.typ": *

#show: project.with(
  title: "Context-Free Languages",
  authors: (
    (name: "Lslightly", email: ""),
  ),
)

= Context-Free Grammars

== Definition

#let linkToSlides(page) = [see #pdfPageLink("2.2.pdf", page)]

#linkToSlides(14)

yield: one step 一步推导

derive: multiple step 多步推导

== Formal Definition

#linkToSlides(26)

== Ambiguity

通过多种方式产生相同字符串，则称为二义文法。

leftmost derivation 最左推导

一个文法是二义的，如果对于同一个字符串，存在两个或多个最左推导。

== Chomsky Normal Form

$
A -> B C "(B, C can not be start variable)"\
A -> a\
S -> epsilon\
S -> B C "(B, C can not be start variable)"\
$

#theorem[
  任何context-free language可以被Chomsky normal form的CFG生成。#linkToSlides(46)
]

#proof[
  1. 添加新start variable. $S_0 -> S$。防止start variable在production中出现。
  2. 删除所有 $A -> epsilon$ 规则，A不是start variable。
    1. 如果有 $R -> u A v, "where" u, v "are strings"$，则添加 $R -> u v$。
    2. 如果有 $R -> A$，则添加 $R -> epsilon$，除非之前 $R -> epsilon$ 已经被删除。
  3. 删除 $A -> B$。对于 $B -> u$，添加 $A->u$。
  4. $A -> u_1 u_2 ... u_n$, $A -> u_1 A_1$, ...
]

== Pushdown Automata(PDA)

PDA相比DFA的区别就是存在一个栈。

#figure(
  image("PDA.jpg"),
  caption: "DFA v.s. PDA",
)

#let trans(input, old, new) = $#input, #old -> #new$

#trans("a", "b", "c"): input a, replace string b in stack with sting c.

PDA有 $epsilon$，而且允许多条 $trans(epsilon, epsilon, epsilon)$，所以是非确定的。

== Equivalence between PDA and Context Free Grammars

#theorem[
  a context free language can be recognized by PDA
]

CFG如何构造PDA(自顶向下自动机)。#linkToSlides(67)

产生式的入栈顺序，为逆序。#linkToSlides(68)。

#theorem[
  the language PDA recognize is context-free language
]

#linkToSlides(73). x means: 

case1: the symbol poped at the end(to empty stack) is the symbol pushed at the beginning(from empty stack).

$A_(p q) -> a A_(r s) b$, $p ->^(trans(a, epsilon, u)) r, A_(r s), s ->^(trans(b, u, epsilon)) q$.

case2: the symbol poped at the end is not the symbol pushed at the beginning.

$A_(p q) -> A_(p r) A_(r q)$

case3: 

$A_(p p) -> epsilon$

$A(q_0, q_("accept"))$ 是start variable.

two claims. #linkToSlides(80)

claim1 基于推导步数的归纳证明，#linkToSlides(82)

claim2 基于transfer次数的归纳证明，#linkToSlides(94), #linkToSlides(97)

regular language is PDA which ignores the stack, i.e. no change in stack state. All edge add stack change $trans([sigma in Sigma], epsilon, epsilon)$

== Non Context Free Language

