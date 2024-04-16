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



