#import "TypstTemplates/templates/basic.typ": *
#import "local.typ": *
#import "TypstTemplates/templates/theory.typ": *

#show: project.with(
  title: "Time Complexity",
  authors: (
    (name: "Lslightly", email: ""),
  ),
)

#let linkToSlides(page) = [see #pdfPageLink("4.1.pdf", page)]

= 复杂度度量

== Time Complexity Class

#let time(a) = $"Time"(#a)$

TIME(t(n))对decidable问题按照时间进行分类

O(n log n), $A in time(n log n)$

在计算理论computability theory中，所有计算的合理模型是等价的。

在复杂度理论complexity theory中，模型选择影响时间复杂度。

== 模型之间的复杂度关联

multitape and single-tape的关系, #linkToSlides(55)

multitape使用 $t(n)$ 时间解决问题，则single-tape可以使用 $t^2(n)$ 的时间解决问题。

- 一个磁带的长度最长为 $t(n)$。时间限制为 $t(n)$
- single-tape模拟时，在每个磁带之间移动最多需要 $O(t(n))$ 的时间。即multitape的每一步需要 $O(t(n))$ 时间。multitape共 $t(n)$步，所以需要 $O(t^2(n))$ 即可解决。

非确定性图灵机的运行时间：最长分支的时间

非确定性单磁带和确定性单磁带的关系。

非确定性单磁带用 $t(n)$ 时间，则确定性单磁带用 $2^(O(t(n)))$ 时间

- 先使用多磁带进行广度优先模拟
- 假设非确定性的分支上限为c，则分支数量为 $c^(t(n))$，每个分支模拟需要 $t(n)$ 时间，则为 $t(n) c^(t(n)) = O(2^((log_2 c) t(n))) = O(2^(O(t(n))))$

- 单磁带和多磁带只是多项式的区别
- 确定性和非确定性图灵机是指数级的区别

= P问题

brute-force search，穷尽搜索。

多项式时间可求解。

$P = union_k time(n^k)$

互质判断为P问题（辗转相除法）

context-free language的多项式时间求解策略
- 自底向上动态规划归约，LR(0), LR(1)

= NP问题

哈密尔顿路径问题是NP问题。#linkToSlides(112)

$"COMPOSITE" = {x | x = p q, "for" p, q in ZZ}$。多项式可验证

$overline("COMPOSITE")$ is not 多项式可验证 #linkToSlides(115)。

verifier #linkToSlides(118)

NP: have polynomial time verifiers

A language is in NP $<=>$ decided by nondeterministic polynomial time TM

$=>$:
- 由于有多项式时间verifier，枚举所有string，然后用verifier验证。

$<=$:
- 构造verifier。将证书c作为NTM决策的描述，得到一个branch。如果这个branch accept，则accept，否则reject

#let ntime(a) = $"NTIME"(#a)$

$ntime(t(n))$ 在ntm中使用 $O(t(n))$ decide.

$"NP" = union_k ntime(n^k)$

clique，图中是否存在k结点子图为完全图 #linkToSlides(135)

= NPC问题

prevent wasting time searching for a nonexistent polynomial time algorithm to solve a particular problem.

== example: SAT

3-SAT $->$ Clique

每个clause是一个组，每个literal($a$或者$overline(a)$)是一个结点。组之间不互为相反的literal之间相连。对于k个子句的3CNF问题，如果有k-clique，即对于这k个group，可以得到不同literal之间的全连接子图，则3CNF可满足。让clique中的literal为1即可。

这里需要证明polynomial time reducible的等价性问题(3CNF有可满足的assignment $<=>$ G有k-clique)，而不是只有单向证明。

== Definition

B is NPC:
1. B is NP
2. $forall A in "NP", A <=#sub[P] B$

如果B只满足2，则B是NP-hard

== Cook-Levin Theorem

SAT is NPC #linkToSlides(178)

1. SAT is NP

a nondeterministic polynomial time machine can guess an assignment

$2^n$ machines polynomial time verification.

2. $forall A in "NP", A <=#sub[P] "SAT"$ #linkToSlides(182)

A的decidable图灵机为 $N$, 使用表格记录configuration变化过程。表格为 $n^k times n^k$，一行为一个configuration。$n^k$为运行的最长时间。由于每一步只移动一个位置，所以纸袋长度最多为 $n^k$

N accepts w $<=>$ 表格一行存在accept。

- $phi.alt_("cell")$ 一个cell可以存字符，且只能存一个字符
- $phi.alt_("start")$ 开始configuration的约束
- $phi.alt_("accept")$ 最终有accept字符串
- $phi.alt_("move")$ transfer function的约束

reduction的size为 $O(n^(2k))$，所以是多项式时间归约。

= additional NP problems

== vertex-cover

#linkToSlides(221)

m个variable, l个clause. 图中2m+3l个结点，k=m+2l

如果 $phi.alt$ 是可满足的，则 $G$ 可以找到k结点vertex-cover. #linkToSlides(227)~#linkToSlides(228)

选择true literal+clause中除某一个true literal之外的其他literal结点。

如果 G 可以找到k结点 vertex-cover，则3SAT是可满足的。

== 哈密尔顿路径



