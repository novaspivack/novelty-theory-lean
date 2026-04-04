import Mathlib.Data.List.Basic
import NoveltyTheory.Core.Tower
import NoveltyTheory.Core.Explains
import NoveltyTheory.Models.SignatureTower
import NoveltyTheory.Models.InvariantTower
import NoveltyTheory.Models.BoundedRegimeDiagonal
import NoveltyTheory.Models.ReducerDiagonal
import NoveltyTheory.Models.DupRegimeTower
import NoveltyTheory.Models.CausalExplanatoryOrders
import NoveltyTheory.Models.GenCertPhase
import NoveltyTheory.Models.SimulationVersusExplanation
import NoveltyTheory.Ridge.DiagonalNat
import NoveltyTheory.Ridge.SignatureAdmissibleBundle
import NoveltyTheory.Models.RegimeFamilyObstruction
import NoveltyTheory.Summits.CrownIteratedAscentSummit

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
open Models.DupRegimeTower
open Models.RegimeFamilyObstruction
open Models.GenCertPhase
open NoveltyTheory.Foundation.StructuralGeneratorSentence
open NoveltyTheory.Foundation.AscentRegime

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

/--
**S9 (sharpened):** **trace-coupled** generators on distinct state types, same observations, still
no regime back-reduction along the strengthened history.
-/
theorem trace_coupled_distinct_carrier_not_reducible (n : ℕ) :
    traceCoupled natCounter natCounterProd ∧
      observationalEquivalence natCounter natCounterProd ∧
      NotReducible (regimeUpto (n + 1)) (regimeUpto n)
        (List.map phaseSingleton (List.range (n + 1)) ++ [phaseSingleton (n + 1)]) :=
  And.intro traceCoupled_natCounter_prod
    (And.intro observationalEquiv_natCounter_prod (not_reducible_succ n))

/-- **`SPEC_003_NXT` S6:** from every height, a strictly later signature regime admits a paradigm shift. -/
theorem every_stage_admits_future_paradigmShift (n : ℕ) :
    ∃ m : ℕ, n < m ∧
      ParadigmShift (regimeUpto n) (regimeUpto m)
        (List.map phaseSingleton (List.range (n + 1))) (phaseSingleton (n + 1)) :=
  exists_future_paradigmShift n

/-- **`SPEC_003_NXT` S8 (template):** each fixed ladder regime omits some generator-realizable phase. -/
theorem explanatory_incompleteness_fixed_signature_height (k : ℕ) :
    ∃ P : Phase ℕ, P.generatedBy natCounter ∧ ¬ (regimeUpto k).explains P :=
  tower_phase_not_explained_by_fixed_regime k

/-- **Model B off-axis:** `RegimeFamilySingletonWithin` + full package, but not `EnumAgreesUpto`. -/
theorem summit_nontrivial_modelB_singleton_family :
    RegimeFamilySingletonWithin dupRegime ∧ ¬ EnumAgreesUpto dupRegime ∧
    (diagonalTower dupRegime).generatedThroughout natCounter ∧
      (diagonalTower dupRegime).paradigmShiftSteps ∧
        ∀ n, ¬ (dupRegime n).explains (phaseSingleton (n + 1)) := by
  rcases modelB_dup_singleton_bound_package with ⟨g, p, d, hsf, he⟩
  exact ⟨hsf, he, g, p, d⟩

/-- Interface diagonal: row-wise soundness forces each row to miss the next singleton stage. -/
theorem no_uniform_row_at_next_stage {υ : Type} (E : Core.AdmissibleInterface ℕ υ ℕ)
    (h : RowSoundForSignature E) (i : ℕ) : ¬ E.rowExplains i (phaseSingleton (i + 1)) :=
  diagonal_stage_defeats_row E h i

/--
**Bundled “global admissible” (`𝓔_adm`):** row-soundness is **part of the quantified type**, so the
diagonal requires **no** separate `RowSoundForSignature` hypothesis.
-/
theorem summit_diagonal_all_bundled_admissible (υ : Type) (E : SignatureAdmissibleInterface υ) (i : ℕ) :
    ¬ E.iface.rowExplains i (phaseSingleton (i + 1)) :=
  diagonal_every_admissible E i

/--
**Obstruction:** `RegimeFamilySingletonWithin` **does not** imply paradigm chains—empty regimes meet
the bound vacuously yet **cannot** satisfy `ParadigmShift.later_adequate`.
-/
theorem summit_singletonWithin_not_entails_paradigm_steps :
    RegimeFamilySingletonWithin (fun n => emptyRegime n) ∧
      ¬ ({ phase := phaseSingleton, regime := fun n => emptyRegime n } :
          PhaseRegimeTower ℕ).paradigmShiftSteps :=
  And.intro emptyRegime_family_singletonWithin not_paradigmShiftSteps_empty_tower

/-- **`SPEC_003_NXT` S10:** no finite `regimeUpto k` organizes the **entire** singleton ladder. -/
theorem summit_finite_signature_not_total_ladder (k : ℕ) : ¬ ExplainsEntireSingletonLadder (regimeUpto k) :=
  not_explainsEntireSingletonLadder_regimeUpto k

/-- **S7:** semantic facts available before escalated **proof** + separate soundness slot. -/
theorem summit_retro_revelation_derivability {k n : ℕ} (hk : k < n) :
    factHolds (CounterFact.geOutput k) ∧
      provesAtDepth n (CounterFact.geOutput k) ∧
        Not (provesAtDepth k (CounterFact.geOutput k)) :=
  retro_revelation_derivability_package hk

theorem summit_retro_revelation_sound {k n : ℕ} (hk : k < n) : factHolds (CounterFact.geOutput k) :=
  retro_revelation_sound hk

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

/-- **Crown (`SPEC_037_CR1`):** strict iterated ascent for a **structural** sentence family on **`natCounter`. -/
theorem summit_crown_strict_ascent_sentence_family :
    ∃ (_ : GenerativeSystem ℕ ℕ) (Φ : ℕ → Sentence ℕ),
      (∀ n, IsStructuralGeneratorSentence (Φ n)) ∧
        ∀ n, ProvesInRegime (n + 1) (Φ n) ∧ ¬ ProvesInRegime n (Φ n) :=
  CrownIteratedAscentSummit.crown_strict_ascent_sentence_family

end Summits

end NoveltyTheory
