import Mathlib.Data.List.Basic
import Mathlib.Data.Set.Insert
import NoveltyTheory.Core.Conservative
import NoveltyTheory.Core.MinimalHypotheses
import NoveltyTheory.Core.ParadigmShift
import NoveltyTheory.Core.Phase
import NoveltyTheory.Core.Reduction
import NoveltyTheory.Models.SignatureTower

/-!
# Conservative separation countermodel (`SPEC_060_CMI1`)

Exhibits **`WeakParadigmStep`** with **history** on which **`ConservativeOver` fails**, hence
**not** a packaged **`ParadigmShift`** despite the three non-conservativity conjuncts of the weak step.

This is a concrete `countermodel_without_history_conservativity` witness (not merely the
`paradigmShift_iff_weak_and_conservative` bookkeeping).
-/

namespace NoveltyTheory

namespace Ridge

namespace ConservativeSeparationCountermodel

open Core List Models SignatureTower

private def ph1 : Phase ℕ := phaseSingleton 1
private def ph0 : Phase ℕ := phaseSingleton 0

/-- Adequacy holds exactly when `1` lies in the phase’s `outputSet`. -/
private def Rsep : ExplanatoryRegime ℕ where
  Desc := Unit
  Adequate := fun _ P => 1 ∈ P.outputSet

/-- Adequacy holds exactly when `0` lies in the phase’s `outputSet`. -/
private def R'sep : ExplanatoryRegime ℕ where
  Desc := Unit
  Adequate := fun _ P => 0 ∈ P.outputSet

private abbrev Hhist : Phase.History ℕ := [ph1]
private abbrev wtn : Phase ℕ := ph0

private theorem mem_ph1_append : ph1 ∈ (Hhist ++ [wtn]) := by simp [Hhist, wtn]

private theorem mem_ph0_append : ph0 ∈ (Hhist ++ [wtn]) := by simp [Hhist, wtn]

private theorem Rsep_adequate_ph1 : Rsep.Adequate () ph1 := by
  simp [Rsep, ph1, phaseSingleton_output]

private theorem not_R'sep_adequate_ph1 : ¬ R'sep.Adequate () ph1 := by
  intro h
  simp [R'sep, ph1, phaseSingleton_output] at h

private theorem R'sep_adequate_ph0 : R'sep.Adequate () ph0 := by
  simp [R'sep, ph0, phaseSingleton_output]

private theorem not_Rsep_adequate_ph0 : ¬ Rsep.Adequate () ph0 := by
  intro h
  simp [Rsep, ph0, phaseSingleton_output] at h

private theorem prior_inadequate' : ¬ Rsep.explains ph0 := by
  intro h
  obtain ⟨⟨⟩, hd⟩ := h
  exact not_Rsep_adequate_ph0 hd

private theorem later_adequate' : R'sep.explains wtn := by
  refine ⟨⟨⟩, ?_⟩
  simpa [wtn] using R'sep_adequate_ph0

private theorem not_reducible_back' : NotReducible R'sep Rsep (Hhist ++ [wtn]) := by
  rintro ⟨f, hf⟩
  have h0 := hf ph0 mem_ph0_append () R'sep_adequate_ph0
  simp [Rsep, ph0, phaseSingleton_output] at h0

private theorem weak_step' : WeakParadigmStep Rsep R'sep Hhist wtn where
  prior_inadequate := prior_inadequate'
  later_adequate := later_adequate'
  not_reducible_back := not_reducible_back'

private theorem not_conservative' : ¬ ConservativeOver Hhist Rsep R'sep := by
  rintro ⟨embed, hext⟩
  have h1 := hext ph1 (by simp [Hhist]) () Rsep_adequate_ph1
  simp [R'sep, ph1, phaseSingleton_output] at h1

theorem not_paradigmShift_of_weak_without_conservative {X : Type} (R R' : ExplanatoryRegime X)
    (H : Phase.History X) (w : Phase X) (_wk : WeakParadigmStep R R' H w)
    (hnc : ¬ ConservativeOver H R R') : ¬ ParadigmShift R R' H w := by
  intro ps
  exact hnc ps.conservative

theorem countermodel_weak_step_without_conservative :
    WeakParadigmStep Rsep R'sep Hhist wtn ∧ ¬ ConservativeOver Hhist Rsep R'sep :=
  ⟨weak_step', not_conservative'⟩

theorem countermodel_without_history_conservativity :
    ∃ (R R' : ExplanatoryRegime ℕ) (H : Phase.History ℕ) (w : Phase ℕ),
      WeakParadigmStep R R' H w ∧ ¬ ConservativeOver H R R' :=
  ⟨_, _, _, _, countermodel_weak_step_without_conservative⟩

theorem countermodel_without_packaged_paradigmShift :
    ∃ (R R' : ExplanatoryRegime ℕ) (H : Phase.History ℕ) (w : Phase ℕ),
      WeakParadigmStep R R' H w ∧ ¬ ParadigmShift R R' H w :=
  ⟨_, _, _, _, weak_step', not_paradigmShift_of_weak_without_conservative _ _ _ _ weak_step' not_conservative'⟩

end ConservativeSeparationCountermodel

end Ridge

end NoveltyTheory
