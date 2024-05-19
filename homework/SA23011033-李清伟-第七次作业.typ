#import "TypstTemplates/templates/assignment.typ": *
#import "@preview/cetz:0.2.2": canvas, tree, draw
#import "@preview/cuti:0.2.0": show-cn-fakebold
#show: show-cn-fakebold

#set math.equation(numbering: "(1)")

#show: project.with(
  title: "第七次作业",
  authors: (
    (name: "李清伟", email: ""),
  ),
)

= 7.1

a. true

b. false

c. false

d. true

e. true

f. true

= 7.2

#let toinf = $lim_(n -> +infinity)$

以下直接给出 $f(n) = o(g(n))$ 形式的 $lim_(n -> +infinity) f(n)/g(n)$ 的结果以进行判断

a. false $1/2$

b. true $toinf 2/n = 0$

c. true $toinf (2/3)^n = 0$

d. true $toinf 1/n = 0$

e. false $toinf n / (log n) = + infinity$

f. false $toinf n = + infinity$

= 7.5

不是可满足的。

对于x, y的任何取值，总存在一个子句为false，所以结果为false，所以不可满足。

= 7.9

算法：对每条边 $e = (u, v)$，遍历所有点 $t$，如果存在 $(t, u), (t, v)$边，则输出true。如果所有边都不存在这样的点，则输入false。

时间复杂度为 $O(E V), E "为边数," V"为点数"$，所以为多项式时间。$"TRIANGLE" in P$。
