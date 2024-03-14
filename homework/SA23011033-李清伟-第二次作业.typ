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

= 1.16

(a)

#let q0 = $q'_0 = {1}$
#let q1 = $q'_1 = {1, 2}$
#let q2 = $q'_2 = {2}$
#let emptySet = $phi.alt$

#grid(
  columns: 2,
  [
    \
    #figure(
      table(
        columns: 3,
        "状态R", $delta'(R, a)$, $delta'(R, b)$,
        [#q0], [#q1], [#q2],
        [#q1], [#q1], [#q1],
        [#q2], [#emptySet], [#q0],
      ),
      caption: "(a)NFA转换得到的DFA状态转移函数表",
    ) <aNFA2DFA>
    \
  ],
  [
    #figure(
      image("1.16.a.png", width: 47%),
      caption: "(a)结果DFA"
    ) <116aDFA>
  ]
)

NFA转换到DFA得到的状态转移函数表如 @aNFA2DFA 所示。其中接受状态为 $q'_0, q'_1$。 其DFA图如 @116aDFA 所示。

(b)

#let q0 = $q'_0 = {1, 2}$
#let q1 = $q'_1 = {1, 2, 3}$
#let q2 = $q'_2 = {2, 3}$

#grid(
  columns: 2,
  [
    \
    #figure(
      table(
        columns: 3,
        "状态R", $delta'(R, a)$, $delta'(R, b)$,
        [#q0],    [#q1],          [#emptySet],
        [#q1],    [#q1],          [#q2],
        [#q2],    [#q0],          [#q2],
      ),
      caption: "(b)NFA转换得到的DFA状态转移函数表",
    ) <bNFA2DFA>
  ],
  [
    #figure(
      image("1.16.b.png", width: 47%),
      caption: "(b)结果DFA"
    ) <116bDFA>
  ]
)


NFA转换到DFA得到的状态转移函数表如 @aNFA2DFA 所示。所有状态均包含2，皆为接受状态。 其DFA图如 @116bDFA 所示。

= 1.21

(a)

#grid(
  columns: 2,
  row-gutter: 1cm,
  [
#figure(
  image("1.21.a.1.png", width: 70%),
  caption: "1.21(a) step 1",
) <121a1>
  ],
  [
#figure(
  image("1.21.a.2.png", width: 70%),
  caption: "1.21(a) step 2",
) <121a2>
  ],
  [
#figure(
  image("1.21.a.3.png", width: 50%),
  caption: "1.21(a) step 3",
) <121a3>
  ],
)


系列操作如 @121a1, @121a2, @121a3 所示。

(b)

#grid(
  columns: 2,
  [
#figure(
  image("1.21.b.1.png", width: 70%),
  caption: "1.21(b) step 1",
) <121b1>
  ],
  [
#figure(
  image("1.21.b.2.png", width: 70%),
  caption: "1.21(b) step 2",
) <121b2>
  ],
  [
#figure(
  image("1.21.b.3.png", width: 60%),
  caption: "1.21(b) step 3",
) <121b3>
  ],
  [
#figure(
  image("1.21.b.4.png", width: 100%),
  caption: "1.21(b) step 4",
) <121b4>
  ],
)

系列操作如 @121b1, @121b2, @121b3, @121b4 所示。

= 1.29

#let A1 = $A_1$

假设 #A1 是regular language，则其应该满足pumping lemma。假设p是pumping length。选择 $s = 0^p 1^p 2^p$，该字符串的长度 > p，则可以将s分成3片, $s = x y z$，且满足命题 $P: forall i >= 0, x y^i z in A1$。

考虑 y的情况。对于y只包含0或1或2的情况，无论是哪一种情况，都存在 i 使得 $x y^i z$ 中0, 1, 2三者的数量不一致，此时命题P不成立。

对于y包含多于1种字符的情况，存在 i > 1， $x y^i z$ 由于 $y^i$ 的存在使得0, 1, 2并不是依次序出现，此时命题P不成立。

所以存在 #A1 中的字符串s使得无法拆分成3片其满足三个条件，所以不存在pumping lemma不成立，#A1 不是regular language。
