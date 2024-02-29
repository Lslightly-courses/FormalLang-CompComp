#import "TypstTemplates/templates/basic.typ": *

#show: project.with(
  title: "绪论",
  authors: (
    (name: "Lslightly", email: ""),
  ),
)

复杂度Complexity:
- P, NP, NPC, NP-hard, NSPACE, Intract
- 对于一些难问题，得到一个不完美的解(如近似解)。

可计算性Computability:
- $forall x. P(x) and Q(x)$ may be not computable.
- 先进行computability的判定，再进行complexity的判定。

自动机Automata
- simple to complex
- 有限自动机、上下文无关文法、PDA

== Notions

#let emptySet = $phi.alt$

set, multiset, infinite set, $union, sect, overline(A)$, #emptySet

sequence, finite sequence = k-tuple, 2-tuple=pair, 3-tuple=triple

power set 

product $|A times B times A| = |A| times |B| times |A|$, $A times A times ... times A = A^k$

function $f: D -> R$, D is the domain, R is the range.

k-ary function $f: A_1 times ... times A_k -> R$

#let True = $"true"$
#let False = $"false"$

the range predicate is ${"true", "false"}$

relation is predicate with k-tuples as its input. $R(a_1, ..., a_k)$

equivalence relation等价关系
- reflexive自反性
- symmetric对称性
- transitive传递性

graph, node(vertices), edge, G(V, E), subgraph

simple path doesn't repeat any nodes

simple cycle with >= 3 nodes, repeats only the first/last node

=== Strings and Language

string over an alphabet: *finite* sequence of symbols

concatenation $x^k = x x ... x$

lexicographic order = string order

a language is a set of strings

proper prefix真前缀

prefix-free，no member is a proper prefix of another member

=== boolean logic

$xor, <->, ->$

== Definitions, Theorems, Proof

Proof
- Construction 构造
- Contradiction 反证
- Induction 归纳
