import Mathlib.Data.List.Basic
import NoveltyTheory.Core.Tower
import NoveltyTheory.Core.Explains
import NoveltyTheory.Models.SignatureTower
import NoveltyTheory.Models.InvariantTower
import NoveltyTheory.Models.BoundedRegimeDiagonal
import NoveltyTheory.Models.ReducerDiagonal
import NoveltyTheory.Models.CausalExplanatoryOrders
import NoveltyTheory.Models.GenCertPhase
import NoveltyTheory.Models.SimulationVersusExplanation
import NoveltyTheory.Ridge.DiagonalNat

/-!
# Summit I–IV packaging (`SPEC_011_SPK`)

Canonical names aligned with the spec. Model A/C carry the first wave plus the counterfact
derivability package; quantification “for every admissible `E`” is split into explicit hypotheses
(`RowSoundForSignature`) so nothing is smuggled into definitions.
-/

namespace NoveltyTheory

namespace Summits

open Core GenerativeSystem Models SignatureTower InvariantTower Ridge
open Models.ReducerDiagonal Models.CausalExplanatoryOrders Models.BoundedRegimeDiagonal
open Models.GenCertPhase

private theorem phase_singleton_generated (n : ℕ) : (phaseSingleton n).generatedBy natCounter :=
  natCounter_generated n

/-- **Summit I:** same generator realizes every phase, but each **fixed** signature regime level
eventually fails on a generated phase (`SPEC_011_SPK` causal / explanatory separation, Model A). -/
theorem causal_generation_not_uniform_explanation (k : ℕ) :
    ∃ n : ℕ,
      (phaseSingleton n).generatedBy natCounter ∧ ¬ (regimeUpto k).explains (phaseSingleton n) :=
  ⟨_, And.intro (phase_singleton_generated _) (@not_explains_regime_singleton_succ k)⟩

/-- **Summit II:** infinite conservative paradigm shifts along the canonical tower. -/
theorem infinite_paradigm_tower : ∃ (T : PhaseRegimeTower ℕ) (G : GenerativeSystem ℕ ℕ),
    T.generatedThroughout G ∧ T.paradigmShiftSteps :=
  ⟨canonicalTower, natCounter, And.intro canonicalTower_generated canonicalTower_paradigmSteps⟩

/--
**Summit III (Model A family):** no regime `regimeUpto k` from the ladder explains every tower phase;
equivalently none is terminal for the whole stream (`SPEC_011_SPK`).
-/
theorem noFinalInternalTheory_signature_family (k : ℕ) :
    ∃ n : ℕ, ¬ (regimeUpto k).explains (phaseSingleton n) :=
  ⟨k + 1, @not_explains_regime_singleton_succ k⟩

/--
**Summit IV (Model C):** strict derivability gap at each height—`provesAtDepth` is the formal `⊢`.

Upward explanatory necessity is witnessed by sentences `CounterFact.geOutput n`: provable one depth
higher, not provable at depth `n`, with sound semantic content in `InvariantTower.factHolds`.
-/
theorem upwardExplanatoryNecessity_counterfact (n : ℕ) :
    provesAtDepth (n + 1) (CounterFact.geOutput n) ∧
      ¬ provesAtDepth n (CounterFact.geOutput n) :=
  upward_derivability_gap n

/--
**Cross-depth retro template (`SPEC_003_NXT` S7):** fixed index `k`, proof available at depth `n > k`
but not at `k`.
-/
theorem retroactive_derivability_crossDepth {k n : ℕ} (hk : k < n) :
    provesAtDepth n (CounterFact.geOutput k) ∧ ¬ provesAtDepth k (CounterFact.geOutput k) :=
  retro_derivability hk

/--
**Observable coincidence vs reduction (`SPEC_003_NXT` S9):** identical `reachSet`s need not support
regime-wise back-reduction along historical prefixes.
-/
theorem observational_equivalence_but_not_reducible (n : ℕ) :
    observationalEquivalence natCounter natCounter ∧
      NotReducible (regimeUpto (n + 1)) (regimeUpto n)
        (List.map phaseSingleton (List.range (n + 1)) ++ [phaseSingleton (n + 1)]) :=
  SimulationVersusExplanation.observational_eq_but_irreducible n

/-- Interface diagonal: row-wise soundness forces each row to miss the next singleton stage. -/
theorem no_uniform_row_at_next_stage {υ : Type} (E : Core.AdmissibleInterface ℕ υ ℕ)
    (h : RowSoundForSignature E) (i : ℕ) : ¬ E.rowExplains i (phaseSingleton (i + 1)) :=
  diagonal_stage_defeats_row E h i

/-- `regimeUpto n` explains stage `n` of the canonical tower on the counter trace (`SPEC_006_ADR`). -/
theorem canonical_regime_explains_each_stage (n : ℕ) :
    regimeExplainsTowerStage natCounter canonicalTower n := by
  refine And.intro ?gen ?expl
  · simpa [canonicalTower, PhaseRegimeTower] using natCounter_generated n
  · exact (regimeUpto_explains_singleton (n := n) (k := n)).2 (Nat.le_refl n)

/--
**Model B package (`SPEC_012_MDL`):** some enumeration agreeing with `regimeUpto` inherits diagonal defeat,
infinite shifts, and coverage by `natCounter`.
-/
theorem summit_modelB_enumerated_diagonal :
    ∃ (c : ℕ → ExplanatoryRegime ℕ), EnumAgreesUpto c ∧
      (diagonalTower c).generatedThroughout natCounter ∧
        (diagonalTower c).paradigmShiftSteps ∧
          ∀ n, ¬ (c n).explains (phaseSingleton (n + 1)) :=
  ⟨regimeUpto, And.intro canonicalEnum_agrees
    (modelB_enumerated_diagonal_package regimeUpto canonicalEnum_agrees)⟩

/-- **Order divergence (`SPEC_003_NXT` / S5 shape):** causal and explanatory strict orders disagree. -/
theorem causal_explanatory_order_divergence :
    ∃ a b : GenCert, causalStrict a b ∧ explanatoryStrict b a :=
  causal_explanatory_orders_diverge

/--
**Abstract Model B diagonal:** any regime family with the singleton-within bound admits stage-wise
defeat—no pointwise equality to `regimeUpto` required (**`SPEC_009_DST`** generalization).
-/
theorem summit_bounded_regime_family_diagonal (c : ℕ → ExplanatoryRegime ℕ)
    (h : RegimeFamilySingletonWithin c) (n : ℕ) :
    ¬ (c n).explains (phaseSingleton (n + 1)) :=
  family_diagonal_of_singletonWithin c h n

/-- Causal strict order on `GenCert` can decrease summed phase tag (**`SPEC_003_NXT`** / phase hook). -/
theorem gen_cert_causal_strict_but_lower_phase_tag :
    ∃ a b : GenCert, causalStrict a b ∧ phaseTag b < phaseTag a :=
  causal_strict_but_tag_decreases

end Summits

end NoveltyTheory
