#import "TypstTemplates/templates/basic.typ": *

#show: project.with(
  title: "第一次作业",
  authors: (
    (name: "李清伟", email: ""),
  ),
)

= 0.2

a. ${1, 10, 100}$

b. ${x | x in ZZ and x > 5}$

c. ${x | x in NN and x < 5}$

d. ${"\"aba\""}$

e. ${epsilon}$

#let emptySet = $phi.alt$

f. $emptySet$

= 0.3

a. no

b. yes, $forall x in B, x in A$

c. ${x, y, z}$

d. ${x, y}$

e. ${(x, x), (x, y), (y, x), (y, y), (z, x), (z, y)}$

#let Aset = ("x", "y", "z")
#let Bset = ("x", "y")

f. ${emptySet, {x}, {y}, {x, y}}$

= 0.7

a. 

b. 整数的$<=$ 关系

- 自反性:$forall a in ZZ, a <= a$
- 对称性:对于3和4，$3 <= 4 and not ( 4 <= 3)$。所以对称性不成立。
- 传递性:$forall a, b, c in ZZ, "if" a <= b and b <= c, "then", a <= c$，所以满足传递性。

= 0.8

