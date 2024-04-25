#import "TypstTemplates/templates/basic.typ": *
#import "local.typ": *
#import "TypstTemplates/templates/theory.typ": *

#show: project.with(
  title: "Decidability",
  authors: (
    (name: "Lslightly", email: ""),
  ),
)

#let linkToSlides(page) = [see #pdfPageLink("3.2.pdf", page)]

= Decidable Languages

== decidable problems for regular Languages

问题 #linkToSlides(14)。是否存在一个算法，可以判定一个DFA是否接受一个字符串。

is there a algorithm $"Alg": "DFA" -> "string" -> "bool"$

问题 #linkToSlides(25)。是否存在一个算法，可以判定一个NFA是否接受一个字符串。

1. 先将NFA转换为DFA，然后用上面的DFA算法实现。
2. 可以直接使用非确定的Turing Machine模拟NFA

问题 #linkToSlides(28)。是否存在一个算法，可以判定一个正则表达式是否接受一个字符串。

将regular expression转化为NFA然后解。

问题 #linkToSlides(30)，$L(A) = emptyset$ 表示A可以识别的language为空集。

if acceptable state is reachable, then some string can be accepted, then reject, otherwise, accept.

问题 #linkToSlides(32)

解决 #linkToSlides(34), $(L(A) sect overline(L(B))) union (overline(L(A)) sect L(B))$ 为空集。

为什么取补集和交操作是闭包运算？

= Context-free Languages

问题 #linkToSlides(40), 使用Chomsky normal form(CNF)范式。需要$2n-1$步获得w。

$A->a$使用n步，$A->B C$ 需要n-1步归约到 Start Variable

问题 #linkToSlides(50)

mark终结符。如果右部所有符号都marked，则非终结符被mark。如果start variable最终marked，则$L(G) eq.not phi.alt$，否则为 $phi.alt$

问题 #linkToSlides(54)，是undecidable。对于context-free language。不满足闭包特性。需要可规约性

每个上下文无关文法都是 decidable的。#linkToSlides(59)

#linkToSlides(60) regular, context-free, turing-decidable, turing-recognizable的关系。

= undecidability

== undecidable problem

#let atm = $A_("TM")$

#linkToSlides(70), 为什么#atm undecidable？由于M在 not accept的情况下，除了reject之外也可以进入loop状态。此时 #atm 无法给出 reject结论。

== 对角论证法

如何比对集合之间的大小 #linkToSlides(73)

one-to-one, injective单射

onto, surjective满射

one-to-one and onto, correspondence, bijective双射

如果可以找到双射函数，则集合大小相等。

可数集合A，即存在双射函数从自然数集合到该集合A。

正有理数集合是可数的。

实数集合是不可数的。

为什么实数集合是不可数的？

反证法 #linkToSlides(81)。任何key都不可能映射到这个value。通过小数点位实现。

Some languges are not Turing-recognizable #linkToSlides(88)

思路：语言集合是不可数的，Turing Machine的集合是可数的。

$atm = {angle.l M, w angle.r | M "is a TM and M accepts" w}$ 是undecidable。

思路：使用反证法。#linkToSlides(112)

== co-Turing-recognizable

co-Turing-recognizable: $forall w in A, "TM reject" w$


