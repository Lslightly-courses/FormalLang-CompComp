#import "TypstTemplates/templates/assignment.typ": *

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

d. ${"aba"}$

e. ${epsilon}$

#let emptySet = $phi.alt$

f. $emptySet$

= 0.3

a. no

b. yes, $forall x in B, x in A$

c. ${x, y, z}$

d. ${x, y}$

#let Aset = ("x", "y", "z")
#let Bset = ("x", "y")

#{
  let AxB = for a in Aset {
    for b in Bset {
      ([($#a$, $#b$)],)
    }
  }
  let AxB = AxB.join(", ")
[e. {#AxB}]
}



f. ${emptySet, {x}, {y}, {x, y}}$

= 0.7

a. 欧式空间中两点之间的距离 < 1m 定义为关系 $R$

- 自反性: $forall a in G. a R a$，每个点自己距离自己距离一定小于1m。
- 对称性: $forall a, b in G. "if" a R b , "then" b R a$。如果a 和 b之间的距离小于1m，则b和a之间的距离小于1m。
- 传递性: $exists a, b, c in G. a R b and b R c, "but" not (a R c)$。如果a, b, c按照顺序排列在一条直线上，且(a, b), (b, c)之间的距离大于0.5m，那么a和c之间的距离就 > 1m，就不满足 $a R c$。

b. 整数的$<=$ 关系

- 自反性:$forall a in ZZ, a <= a$
- 对称性:对于3和4，$3 <= 4 "但是" not (4 <= 3)$。所以对称性不成立。
- 传递性:$forall a, b, c in ZZ, "if" a <= b and b <= c, "then", a <= c$，所以满足传递性。

c. 令定义域为 $X = {0, 1, 2}$, 关系 $R = {(0, 0), (0, 1), (1, 0), (0, 0)}$

此时 $forall a, b in X, a R b -> b R a$，满足对称性。$forall a, b, c in X, a R b and b R c -> a R c$。但是对于2，$(2, 2) in.not R$，所以不满足自反性。

= 0.8


#figure(
  image("graph.png", width: 20%),
  caption: "0.8题图"
) <08题图>

如 @08题图 所示。结点度数如 @结点度数 所示。路径为 $3 -> 2 -> 4$。

#let values = (
  ("结点编号", "度数"),
  (1, 3),
  (2, 3),
  (3, 2),
  (4, 2),
)

#let row(r) = {
  ([#r.at(0)], [#r.at(1)])
}

#figure(
  table(
    columns: 2,
    ..values.map(row).flatten()
  ),
  caption: "结点度数"
) <结点度数>