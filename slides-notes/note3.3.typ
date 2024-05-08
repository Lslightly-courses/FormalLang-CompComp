#import "TypstTemplates/templates/basic.typ": *
#import "local.typ": *
#import "TypstTemplates/templates/theory.typ": *

#show: project.with(
  title: "Reducibility",
  authors: (
    (name: "Lslightly", email: ""),
  ),
)

#let linkToSlides(page) = [see #pdfPageLink("3.3.pdf", page)]

= introduction

A is reducible to B, $A <= B$

= undecidable problems from language theory

#let halt = $"HALT"_("TM")$
#let atm = $A_("TM")$

#halt, #linkToSlides(11)

if halt, return the accept
if not halt, return reject.

for a machine, if #halt accept, then use #atm's result. if #halt rejects, #atm reject because enter loop state.

所以在反证假设下 R 可以归约到 #atm ，使得 #atm decidable。但是 #atm 是undecidable。所以矛盾。

$E_("TM")$, #linkToSlides(26)

$"EQ"_("TM")$, #linkToSlides(31)。假设 EQ 机器 R，通过 $R(M, "M' which rejects all inputs")$。equal means M is empty. non-equal means M is not empty.

= PCP

#linkToSlides(74)

= Mapping Reducibility

a computable function exists that converts instances of problem A to instances of problem B.

computable: 有限步骤 #linkToSlides(81)

mapping reducibility: #linkToSlides(83)

#let mapreduceTo = $ <=#sub[m]$

$atm mapreduceTo halt$ #linkToSlides(87)。

#let conf(body) = $angle.l #body angle.r$

#figure(
  table(
    columns: 3,
    [], [#conf([M, w])], [#conf([M', w])],
    [True], [M accepts w], [M' halts on w],
    [False], [M rejects w], [M' does not halt on w]
  ),
  caption: [$atm mapreduceTo halt$]
)