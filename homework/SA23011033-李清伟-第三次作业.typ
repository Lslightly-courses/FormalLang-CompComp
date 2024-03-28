#import "TypstTemplates/templates/assignment.typ": *
#import "@preview/cetz:0.2.2": canvas, tree, draw
#import "@preview/cuti:0.2.0": show-cn-fakebold
#show: show-cn-fakebold

#set math.equation(numbering: "(1)")

#show: project.with(
  title: "第三次作业",
  authors: (
    (name: "李清伟", email: ""),
  ),
)

= 2.1

#let EpT = $E + T$
#let TmF = $T times F$
#let bE = $( E )$
#let atoT = (
  $T$,
  ($F$, $a$)
)
#let apa = (
  $E$,
  (
    $E$,
    atoT,
  ),
  $+$,
  atoT
)
#let Etobracket(t) = (
  $E$,
  (
    $T$,
    (
      $F$,
      "(",
      t,
      ")",
    )
  )
)

a. $a$

#figure(
  canvas({
    import draw: *
    set-style(content: (padding: .2))
    tree.tree(
      (
        $E$,
        atoT,
      )
    )
  }),
  caption: "2.1.a parse tree",
) <2.1.a.pt>


leftmost derivation:

$
E => T => F => a
$

b. $a+a$

#figure(
  canvas({
    import draw: *
    set-style(content: (padding: .2))
    tree.tree(
      apa
    )
  }),
  caption: "2.1.b parse tree",
) <2.1.b.pt>

leftmost derivation:

$
E => E + T => T + T => F + T => a + T => a + F => a + a
$

c. $a + a + a$

#figure(
  canvas({
    import draw: *
    set-style(content: (padding: .2))
    tree.tree(
      (
        $E$,
        apa,
        $+$,
        atoT
      )
    )
  }),
  caption: "2.1.c parse tree",
) <2.1.c.pt>

leftmost derivation:

$
E
& =>E+T=>E+T+T\
& =>T+T+T=>F+T+T=>a+T+T\
& =>a+F+T=>a+a+T\
& =>a+a+F=>a+a+a
$

d. $((a))$

#figure(
  canvas({
    import draw: *
    set-style(content: (padding: .2))
    tree.tree(
      Etobracket(
        Etobracket(
          (
            $E$,
            atoT
          ),
        )
      )
    )
  })
)

leftmost derivation:

$
E
& => T => F => (E)\
& => (T) => (F) => ((E))\
& => ((T)) => ((F)) => ((a))
$

= 2.9

$
& S -> L C | A R\
& L -> a L b | epsilon \
& C -> c C | epsilon\
& A -> a A | epsilon\
& R -> b R c | epsilon
$

语法是二义的。例如对于 $a b c$，可以有两个最左推导。如 @derive1 和 @derive2 所示。所以是二义的。

$
S => L C => a L b C => a b C=>a b c C=>a b c
$ <derive1>

$
S => A R => a A R =>a R =>a b R c => a b c
$ <derive2>

= 2.10

PDA有开始状态和结束状态，开始状态先通过转移函数 $epsilon, epsilon-> \$$ 将 \$ 符号push到栈中，然后push开始变量 S到栈中，进入到循环状态。从循环状态出发，对于每个产生式 $A -> s$，会将产生式右部的符号按照逆序push到栈中(即: 将变量$A$替换为产生式右部符号序列 $s$ 的逆序 $"rev"(s)$，即 $epsilon, A -> "rev"(s)$ 转移函数)，push完成之后回到循环状态。然后对于每个终结符 a, 循环状态会通过 $a, a -> epsilon$ 转移函数从栈中pop。最后通过 $epsilon, \$-> epsilon $ 到接受状态。图形式上类似于2.2.pdf的第40页内容。

= 2.14

原始CFG为：

$
& A -> B A B | B | epsilon\
& B -> 0 0 | epsilon
$

step1: add $S$

$
& S -> A\
& A -> B A B | B | epsilon\
& B -> 0 0 | epsilon
$

step2: eliminate $A->epsilon$-like production

$A->epsilon$:

$
& S -> A | epsilon\
& A -> B A B | B | B B\
& B -> 0 0 | epsilon
$

$B -> epsilon$:

$
& S -> A | epsilon\
& A -> B A B | B | B B | A B | B A | A | B\
& B -> 0 0
$

即:

$
& S -> A | epsilon\
& A -> B A B | B | B B | A B | B A\
& B -> 0 0
$

step3: eliminate $A->B$-like production

$S -> A$:

$
& S -> B A B | B | B B | A B | B A | epsilon\
& A -> B A B | B | B B | A B | B A\
& B -> 0 0
$

$S -> B$:

$
& S -> B A B |  0 0 | B B | A B | B A | epsilon\
& A -> B A B | B | B B | A B | B A\
& B -> 0 0
$

$A -> B$:

$
& S -> B A B |  0 0 | B B | A B | B A | epsilon\
& A -> B A B | 0 0 | B B | A B | B A\
& B -> 0 0
$

step4: convert to proper form

$
& S -> B C | O O | B B | A B | B A | epsilon\
& A -> B C | O O | B B | A B | B A\
& B -> O O\
& C -> A B\
& O -> 0
$

= 2.33

#let vy = $v, y$
#let ab = $a, b$

Proof:

假设 $K in ZZ^+, |K| > 1, F = {a^i b^j |i = k j, k in K}$ 是上下文无关文法，则根据Pumping Lemma，存在pumping length p。

假设 $K$ 是个无限集合，则存在 $k > p , k in K$，则对于字符串 $a^(k p) b^p$，其可以分为五个部分 $u v x y z$，且满足:
1. $forall i >= 0, u v^i x y^i z in F$
2. $|v y| > 0$
3. $|v x y| <= p$

此时 #vy 为满足条件1必须有性质: $v = a^(k t), y = b^t, t >= 1$，否则一定存在 $i$ 使得 $u v^i x y^i z$ 中 #ab 的个数不满足 $k$ 倍关系。但此时 $|v x y| >= |v|+|y| = (k+1) t >= k + 1 > p$，不满足条件3。所以不存在满足条件的 #vy。不可划分。

*所以当 $K$ 是无限集合时*, $F$ 不是上下文无关的。

*但是*如果 $K = {k_1,k_2, ...}$ 是有限的，则 $F$ 是上下文无关的。因为可以构造如下文法:

$
& F -> F_1 | ... | F_(|K|)\
& F_1 -> a^(k_1) F_1 b | epsilon\
& ...
$
