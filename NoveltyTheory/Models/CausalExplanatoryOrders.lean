import Mathlib.Data.Nat.Basic

/-!
# Causal vs explanatory order — minimal witness (`SPEC_003_NXT`, wave 2 sketch)

Two **distinct** strict orders on pairs `(genTick, cert)`:

* **Causal** order tracks the first coordinate (generation tick rank).
* **Explanatory** order tracks the **reverse** of the second coordinate (certificate / invariant rank).

The same two points can be ordered one way causally and the opposite way in the explanatory order.
This is a deliberately tiny carrier: it records the *shape* of “orders diverge” without importing a
full logic of regimes (`S5` in the roadmap narrative).
-/

namespace NoveltyTheory

namespace Models

namespace CausalExplanatoryOrders

/-- Joint tag: observable-generation step and a nonnegative certificate level. -/
abbrev GenCert : Type :=
  Nat × Nat

/-- Strict causal order: earlier generation tick. -/
def causalStrict (a b : GenCert) : Prop :=
  a.1 < b.1

/-- Strict explanatory order: **lower** certificate level is “explanatorily prior” in this toy. -/
def explanatoryStrict (a b : GenCert) : Prop :=
  a.2 < b.2

/--
**Order divergence witness (`SPEC_003_NXT` — formal content behind S5):**
`a` is causally before `b`, yet `b` is explanatorily before `a`.
-/
theorem causal_explanatory_orders_diverge :
    ∃ a b : GenCert, causalStrict a b ∧ explanatoryStrict b a :=
  ⟨⟨0, 2⟩, ⟨1, 0⟩, And.intro Nat.zero_lt_one (Nat.lt_trans Nat.zero_lt_one (Nat.lt_succ_self 1))⟩

end CausalExplanatoryOrders

end Models

end NoveltyTheory
