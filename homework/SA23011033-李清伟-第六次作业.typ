#import "TypstTemplates/templates/assignment.typ": *
#import "@preview/cetz:0.2.2": canvas, tree, draw
#import "@preview/cuti:0.2.0": show-cn-fakebold
#show: show-cn-fakebold

#set math.equation(numbering: "(1)")

#show: project.with(
  title: "第六次作业",
  authors: (
    (name: "李清伟", email: ""),
  ),
)

= 5.1

#let atm = $A_("TM")$
#let eqCFG = $"EQ"_("CFG")$
#let allCFG = $"ALL"_("CFG")$
#let conf(body) = $angle.l #body angle.r$
#let machine(body) = $"TM" #body$
#let tminput = $conf(#[$M$, $w$])$

首先证明 $allCFG = {conf(G) | G "is a CFG and" L(G) = Sigma^*}$ 是undecidable的。

假设 #allCFG 是decidable的，则存在 #machine("R") decides #allCFG。

即 $R "accepts" conf(G) <=> L(G) "accepts all strings"$

基于 #tminput，我们可以找到 CFG $G$，它产生的字符串:
1. 不以 #tminput 的初始configuration为前缀
2. 不以 #tminput 的接受configuration为后缀
3. 当进入 $C_i$ 状态之后，基于 $M$ 的规则，不会产生 $C_(i+1)$ 的configuration字符串

此时:
- 当 $M$ accepts $w$ 时，L(G) 会产生除了 $M$ 在接受 $w$ 时所产生的configuration字符串之外的字符串
- 当 $M$ rejects $w$ 时，L(G) 会产生所有字符串

基于 $R$ 构造 $atm$ 的decider: 在面对输入 $tminput$ 时，根据 $tminput$ 构造 $G$。然后将 $G$ 作为 $R$ 的输入。如果 $R$ accepts，则reject #tminput。否则如果 $R$ rejects，则accept #tminput。

所以 #atm 可以归约到 #allCFG 上。根据假设 #allCFG 是decidable，所以 #atm decidable，这与undecidable性质矛盾，所以 #allCFG 是undecidable的。

在证明完成 #allCFG 是undecidable的之后，使用 #allCFG 来证明 #eqCFG 是undecidable的。

定义 CFG $G' = (V, Sigma, R, S), V = {S}, S "是 start variable"$。对于每个终结符 $c in Sigma$，规则集合$R$中包含 $S -> c S$，同时 $R$ 也包含 $S->epsilon$。此时，$L(G') = Sigma^*$ ，因为可以通过 $S -> c S$ 和 $S -> epsilon$ 产生长度，包含任意字符的字符串。

假设 #eqCFG 是decidable的，则存在 #machine("R") decides #eqCFG。使用 $R$ 来构造 $S$ 来判断 #allCFG 问题，如下所示：

给定 $conf(G)$，将 $conf(#[$G$, $G'$])$作为 $R$ 的输入。其中 $L(G')=Sigma^*$

- 当 $R$ accepts时，$S$ accepts
- 当 $R$ rejects时，$S$ rejects

所以 #allCFG 可归约到 $eqCFG$，所以 #allCFG 是decidable的，矛盾。所以 #eqCFG 是undecidable的。

= 5.3

#let d1 = $["ab"/"abab"]$
#let d2 = $["b"/"a"]$
#let d3 = $["aba"/"b"]$
#let d4 = $["aa"/"a"]$

aa aa b ab

aa aa b ab

$
d4, d4, d2, d1
$

= 5.7

#let mapreduce = $<=#sub[m] space$

如果A是 Turing-recognizable的，则 $forall w in A$, $A "accepts" w$。

由于 $A mapreduce overline(A)$，所以存在 computable function $f$，使得对于任意 $w$, $w in A <=> f(w) in overline(A)$。

如果 $f(w) in A$(即$A$ accepts $f(w)$)，则 $f(w) in.not overline(A)$，$w in.not A$。所以可以通过 $f(w) in A$ 来断定 rejects w。

所以对于任意字符串 $w$，都可以通过 $A "accepts" w$ 或者 $A "accepts" f(w)$ 来判断 $w$ 是否被 $A$ accepts或者rejects。所以 $A$ 是decidable的。
