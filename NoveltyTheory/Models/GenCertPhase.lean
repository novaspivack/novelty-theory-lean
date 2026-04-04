import NoveltyTheory.Core.Phase
import NoveltyTheory.Models.SignatureTower
import NoveltyTheory.Models.CausalExplanatoryOrders

/-!
# Linking `GenCert` to singleton phases (`SPEC_003_NXT`, S5 bridge)

The order-divergence witness lives on **`GenCert = Nat × Nat`**. Summing both coordinates yields a
singleton phase tag. Causal precedence on `GenCert` need not move that tag monotonically: the
witness below is causally later in tick-rank but **smaller** in summed tag because certificate rank
drops sharply—an honest toy for “causal step vs explanatory certificate” behaving differently.
-/

namespace NoveltyTheory

namespace Models

namespace GenCertPhase

open Core SignatureTower CausalExplanatoryOrders

/-- Tag for a singleton phase built from both coordinates. -/
def phaseTag (c : GenCert) : ℕ :=
  c.1 + c.2

/-- Associated singleton phase (`SPEC_007_PIN` compatibility hook). -/
def phaseOf (c : GenCert) : Phase ℕ :=
  phaseSingleton (phaseTag c)

theorem phaseOf_output (c : GenCert) : (phaseOf c).outputSet = ({phaseTag c} : Set ℕ) :=
  phaseSingleton_output (phaseTag c)

/--
Causal strict precedence can **decrease** `phaseTag`: generation tick advances while certificate
coordinate falls enough to lower the sum—so **no** injection from `causalStrict` into `Nat.lt` on
tags.
-/
theorem causal_strict_but_tag_decreases :
    ∃ a b : GenCert, causalStrict a b ∧ phaseTag b < phaseTag a :=
  ⟨⟨0, 2⟩, ⟨1, 0⟩, And.intro Nat.zero_lt_one (Nat.lt_succ_self 1)⟩

end GenCertPhase

end Models

end NoveltyTheory
