#import "TypstTemplates/templates/basic.typ": *
#import "local.typ": *
#import "TypstTemplates/templates/theory.typ": *

#show: project.with(
  title: "Church-Turing Thesis",
  authors: (
    (name: "Lslightly", email: ""),
  ),
)

#let linkToSlides(page) = [see #pdfPageLink("3.1.pdf", page)]
#let turingRecog = "Turing-recognizable"
#let turingDecide = "Turing-decidable"

= Turing Machine

go on forever if it does not enter accept or reject state, i.e. never halting.

== Definition

#linkToSlides(13)

$delta: Q times Gamma -> Q times Gamma times {L, R}$, $Gamma$ is the tape alphabet. $Gamma$ in the target type is the new content in the tape.

为什么 ${L, R}$ 中不添加空操作，因为可以被 ${L, R}$ 构造出来。

configuration representation $1101 q_7 01111$ $q_7$ points to the second 0.

yield: $u a q_i b v -> u q_j a c v$ has transition function. $delta(q_i, b) = (q_j, c, L)$

- #turingRecog，只针对可以accept的集合，不管reject和loop的情况， #linkToSlides(27)
- #turingDecide. Decider决定是否accept或者reject某个语言。decider decides the input. #linkToSlides(30)

== Variants

=== Multitape Turing Machine

定义 #linkToSlides(47)。一个状态 x k个磁头读入的数据 -> 另一个状态 x k个磁头写入的数据 x k个磁头的行动。

多磁带图灵机 和 单磁带图灵机等价。单磁带图灵机可以模拟多磁带图灵机。通过在磁带中记录每个图灵机的状态再模拟每个图灵机的行动即可。 #linkToSlides(48)。

一个语言是 #turingRecog $<=>$ 多磁头图灵机可以 recognize it.

#let ntm = "Nondeterministic Turing Machine"

=== #ntm

$
delta: Q times Gamma -> P(Q times Gamma times {L, R})
$

如果某个分支返回True，则进入accept state.

使用确定性Turing Machine通过在nondeterministic computation tree上的BFS搜索模拟 #ntm 。需要3个磁带。
+ 输入磁带(input tape)
+ 模拟磁带(用于模拟某个分支的过程, simulation tape)
+ 分支记录(computation上的从根到当前状态的路径)磁带(address tape)

如果所有分支都返回False，则进入reject state.

如果所有分支都*终止*，则 #ntm 也称为一个 decider。

A language is decidable $<=>$ 存在 #ntm decies it.

=== Enumerator

定义见 #linkToSlides(66)

和图灵机的等价性 #linkToSlides(67)。有两个部分。

== 算法定义

只有一个变量的多项式是否有整数根是decidable的。根据单调性。

多个变量的多项式是否有整数根是undecidable的。但是recognizable的。

算法定义标准化：
- 形式化定义。定义图灵机状态
- 实现描述
- 高层描述
  - types of input
    - string $w$
    - object $angle.l O angle.r$ as a string
    - objects $angle.l O_1, O_2, ..., O_k angle.r$
  - format
    - indent
    - first line as input

