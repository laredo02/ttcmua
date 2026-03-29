# A Computational Approach to the Categorical Semantics of the Simply Typed Lambda Calculus

**Master's Thesis** · Universidad Complutense & Politécnica de Madrid · March 2026  
**Author:** Miguel Laredo Barbadillo  
**Tutors:** Raúl Lara Cabrera
*Master's in Formal Methods in Computer Science*

## Contents

1. **Untyped λ-Calculus** — syntax, α/β/η-equivalence, Church–Rosser, normalization, encodings, fixed-point combinators
2. **Typing and Extensions** — Church- and Curry-style typing, products, sums, strong normalization
3. **Intuitionistic Logic & Curry–Howard** — BHK interpretation, natural deduction, propositions-as-types
4. **Categories at Work** — functors, natural transformations, universal constructions, CCCs, Yoneda
5. **Curry–Howard–Lambek** — C(λ) is cartesian closed, the three-way correspondence, perspectives toward HoTT

---

## The Core Correspondence

The thesis culminates in this table, which is the reason the three subjects are studied together:

| Intuitionistic Logic | Typed λ-Calculus | Category Theory |
|---|---|---|
| Proposition A | Type A | Object A |
| Proof of A | Term of type A | Morphism `f : 1 → A` |
| Implication A → B | Function type A → B | Exponential B^A |
| Conjunction A ∧ B | Product type A × B | Product A × B |
| Disjunction A ∨ B | Sum type A + B | Coproduct A + B |
| ⊤ | Unit type 1 | Terminal object 1 |
| ⊥ | Empty type 0 | Initial object 0 |
| Proof normalization | β-reduction | Commutativity of diagrams |

---

## Snippet — The Central Result

The last chapter proves that the category **C(λ)** — whose objects are types and whose morphisms are βη-equivalence classes of closed terms — is cartesian closed. The heart of the exponential construction (Ch. 5, Proposition 5.1.2):

```
-- The exponential A ⇒ B is the function type A → B.
-- Evaluation morphism:
ev : (A → B) × A → B
ev := λp. (π₁ p)(π₂ p)

-- Currying (the unique transpose):
curry(h) := λc. λa. h⟨c, a⟩

-- Universal property check:
ev ∘ ⟨curry(h), π₂⟩ ≡_βη h      -- ev after curry recovers h
k ≡ curry(h)                       -- curry is unique
```

Giving a morphism `h : C × A → B` is the same as giving `curry(h) : C → (A → B)`. The categorical universal property *is* the λ-abstraction rule in disguise.

---

## Snippet — Curry–Howard in Action

Modus ponens, read as a program (Ch. 3, Example 3.4.2):

```
-- Modus ponens: (P → Q) → P → Q
-- The proof IS the function application combinator.

⊢  λf. λx. f x  :  (P → Q) → P → Q

-- Step-by-step, with types annotated at each reduction:
(λf : P→Q. λx : P. f x) f x    ⊢  (P→Q) → P → Q
  ↓ β
(λx : P. f x) x                 ⊢  P → Q
  ↓ β
f x                              ⊢  Q
```

---

## Snippet — Why the Untyped Calculus Needs Types

The Ω combinator (Ch. 1) shows the untyped calculus permits non-termination. This motivates typing — the Y combinator is untypable in the simply typed system:

```haskell
-- Non-normalizing: reduces to itself forever
-- Ω ≡ (λx. x x)(λx. x x) ↓β (λx. x x)(λx. x x) ↓β ...

-- Y combinator — also untypable in STLC
ycomb = Abs "f" (App
          (Abs "x" (App (Var "f") (App (Var "x") (Var "x"))))
          (Abs "x" (App (Var "f") (App (Var "x") (Var "x")))))

ghci> infer [] ycomb 0
Nothing    -- the type system rejects it
```

---

## External Resources

```bash
# LaTeX source
git clone https://github.com/laredo02/ttcmua.git

# λ-calculus interpreter (Haskell)
git clone https://github.com/laredo02/lcalc.git
```

The interpreter ships four variants: *untyped*, *fully annotated*, *Church-style* (annotations on abstractions only), and *Curry-style* (monomorphic type inference). Run examples in `ghci`.

---

## Key References

- Selinger, P. — *Lecture Notes on the Lambda Calculus* (2008)
- Nederpelt, R. & Geuvers, H. — *Type Theory and Formal Proof* (2014)
- Girard, J.-Y. — *Proofs and Types* (1989)
- Mac Lane, S. — *Categories for the Working Mathematician* (1971)
- Pierce, B. C. — *Basic Category Theory for Computer Scientists* (1991)
- Sørensen, M. H. & Urzyczyn, P. — *Lectures on the Curry–Howard Isomorphism* (2006)

Full bibliography in the PDF.

---

*Master's in Formal Methods in Computer Science · UCM / UPM · Madrid, 2026*
