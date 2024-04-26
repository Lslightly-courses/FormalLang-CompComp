#import "TypstTemplates/templates/assignment.typ": *
#import "@preview/cetz:0.2.2": canvas, tree, draw
#import "@preview/cuti:0.2.0": show-cn-fakebold
#show: show-cn-fakebold

#set math.equation(numbering: "(1)")

#show: project.with(
  title: "第五次作业",
  authors: (
    (name: "李清伟", email: ""),
  ),
)

= 4.1

#let ADFA = $A_("DFA")$
#let conf(body) = $angle.l body angle.r$

a. Yes。因为使用 #ADFA 模拟 M 读入 0100，可以发现最终状态停在左上角的接受状态，即 M 输出 accept，所以 $#conf[M, 0100] in ADFA$ 

b. No。和a类似，最终会停在底部的状态上，M输出reject，所以 $#conf[M, 011] in.not ADFA$

c. No。因为输入类型和 #ADFA 要求的类型不同，所以 $#conf[M] in.not ADFA$

d. No。因为 $M$ 的类型不是正则表达式类型，类型不匹配。

e. No。因为开始状态就是接受状态，所以从开始状态出发标记状态一定会标记到accept state，所以reject，$#conf[M] in.not E_("DFA")$

f. Yes。

构造$L(C) = overline(overline(L(A)) union L(B)) union overline(L(A) union overline(L(B)))$，其中 A, B均为 M。证明 $L(C) = phi.alt$ 即可证明 $L(A) = L(B)$

$overline(L(M))$ 对应的机器如 @notM 所示。

#figure(
  image("figures/notM.png", width: 30%),
  caption: [$overline(L(M))$对应的DFA]
) <notM>

$L(M) union overline(L(M))$ 对应的DFA 可以接受所有0和1组成的字符串。其状态机如 @all 所示。

#align(center)[
#grid(
  columns: 2,
  column-gutter: 3mm,
  [
  #figure(
    image("figures/all.png"), caption: [$L(M) union overline(L(M))$ 对应的DFA]
  ) <all>
  ],
  [
    #figure(
      image("figures/empty.png"),
      caption: [$overline(L(M) union overline(L(M)))$ 对应的DFA]
    ) <empty>
  ]
)
]

$overline(L(M) union overline(L(M)))$ 对应的DFA如 @empty 所示。所以没有可达的accept状态，所以 $L(C) = phi.alt union phi.alt = phi.alt$，所以 $#conf[M, M] in "EQ"_("DFA")$

= 4.3

#let Acc = $"Acc"$

1. 检查开始状态是否为接受状态，如果不是，则reject。
2. 记从开始状态可达的接受状态集合为 $Acc$
3. 对于所有接受状态 $s in Acc$，检查在输入任意 $c in Sigma$ 的情况下，$delta (s, a)$是否都为接受状态。如果存在一个 $s$ 使得存在 $c in Sigma$, $delta(s, a) in.not "接受状态集合"$，则reject，否则accept。

证明为什么这个检查步骤是对的。思路为归纳法证明。

#let A = $A$

证明：首先有： $Sigma^0 = {epsilon} subset.eq L(A)$，即对应上述第1步，在读入0个字符时可达的状态是接受状态。如果不是接受状态，则显然 $L(A) eq.not Sigma^*$，则reject。

然后有：$forall n in NN$, 如果 $Sigma^(n) subset.eq L(A)$，则 $Sigma^(n+1) subset.eq L(A)$。在读入 $Sigma^n$ 的任意字符串之后，#A 一定停在 $Acc$ 的某个状态中，如果上述第三步返回accept，则说明 $Sigma^(n+1) subset.eq L(A)$，否则说明 $Sigma^(n+1) subset.eq.not L(A), L(A) eq.not Sigma^*$，应该reject。

根据归纳法可知，$forall i subset.eq NN, Sigma^(i) subset.eq L(A)$，从而得到 $Sigma^(*) subset.eq L(A)$。而 $L(A) subset.eq Sigma^*$，所以 $L(A) = Sigma^*$，确实应该accept。

所以用上述步骤检查是正确的。

= 4.6

a. f不是one-to-one单射，存在 $1, 3 in X, 1 eq.not 3, f(1) = f(3) = 6$

b. f不是onto满射，$exists y = 8, 9, 10 in Y$, 不存在 $x in X, s.t. f(x) = y$

c. f不是correspondence双射，因为不同时是单射和满射

d. g是one-to-one单射，$forall a, b in X. a eq.not b => f(a) eq.not f(b)$

e. g是onto满射，$forall y in Y. exists x in X. f(x) = y$

f. g是correspondence双射。因为它既是单射又是满射。

= 4.7

#let languageSet = $cal(B)$
#let loc(s, i) = $"loc"(#s, #i)$

$languageSet = {s | s "is infinite binary sequence"}$。假设 #languageSet 是countable的，则存在一个双射 $f: NN^+ -> languageSet$。

记一个二进制序列t的从左往右第i ($i in NN^+$)位为 $loc(t, i) in {0, 1}$。

可以构造一个无限二进制序列 $t in languageSet$, 使得 $forall n in NN^+. loc(t, n) eq.not loc(f(n), n)$，即 $forall n in NN^+. t eq.not f(n)$，即 $exists.not n in NN^+. t = f(n)$。这与 $f$ 的满射性质矛盾。所以 #languageSet 是uncountable的。

