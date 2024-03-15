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