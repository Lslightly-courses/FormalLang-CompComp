#import "TypstTemplates/templates/assignment.typ": *

#show: project.with(
  title: "第二次作业",
  authors: (
    (name: "李清伟", email: ""),
  ),
)

= 1.3

状态图如 @1_3 所示。

#figure(
  image("1.3.png", width: 40%),
  caption: "题1.3"
) <1_3>

= 1.6

#let alphabet = $sum$

令 $alphabet = {0, 1}$

a. 正则表达式为 $1 alphabet^* 0$，化简得到的DFA如 @1.6.a 所示。

#figure(
  image("1.6.a.png", width: 40%),
  caption: "题1.6 a"
) <1.6.a>

b. 如 @1.6.b 所示。

#figure(
  image("1.6.b.png", width: 40%),
  caption: "题1.6 b",
) <1.6.b>

c. 如 @1.6.c 所示。

#figure(
  image("1.6.c.png", width: 60%),
  caption: "题1.6 c",
) <1.6.c>

