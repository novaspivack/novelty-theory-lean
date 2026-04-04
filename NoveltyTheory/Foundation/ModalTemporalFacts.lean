import NoveltyTheory.Core.ModalTemporalSyntax
import NoveltyTheory.Core.Sentence
import NoveltyTheory.Core.SentenceSemantics
import NoveltyTheory.Foundation.ProvabilityFacts
import NoveltyTheory.Foundation.RetroStructuralTruthV2
import NoveltyTheory.Foundation.StageModality
import NoveltyTheory.Foundation.UpwardNecessity
import NoveltyTheory.Models.SentenceProvability
import NoveltyTheory.Models.SignatureTower
import NoveltyTheory.Ridge.RetroStructuralGap

/-!
# Soundness links for modal scaffolding (`SPEC_050_GC3`).
-/

namespace NoveltyTheory

namespace Foundation

namespace ModalTemporalFacts

open NoveltyTheory.Core NoveltyTheory.Core.ModalTemporalSyntax
open NoveltyTheory.Foundation.RetroStructuralTruthV2
open NoveltyTheory.Foundation.StageModality
open NoveltyTheory.Foundation.UpwardNecessity
open NoveltyTheory.Models.SentenceProvability
open NoveltyTheory.Models.SignatureTower
open NoveltyTheory.Ridge.RetroStructuralGap

theorem modal_sound_next {m : ℕ} {φ : Sentence ℕ} (h : StageNext m φ) : HoldsAt natCounter φ :=
  ProvabilityFacts.proves_sentence_sound h

theorem modal_sound_future {m k : ℕ} {φ : Sentence ℕ}
    (h : BoundedFutureNecessary m k φ) :
    ∀ j : ℕ, j < k → HoldsAt natCounter φ := by
  intro j hj
  exact ProvabilityFacts.proves_sentence_sound (h j hj)

theorem modal_sound_pastSegment {l : List (ℕ × ℕ)} (_hlist : PastSegmentListed l)
    (h : ∀ p ∈ l, ProvesAt (List.length l) (Sentence.traceEq p.1 p.2)) :
    ∀ p ∈ l, HoldsAt natCounter (Sentence.traceEq p.1 p.2) := by
  intro p hp
  exact ProvabilityFacts.proves_sentence_sound (h p hp)

theorem exists_modal_sentence_strict_gap (n : ℕ) :
    ∃ φ : Sentence ℕ, StageNecessary n φ ∧ ¬ ProvesAt n φ :=
  ⟨Sentence.geOutput n, stageNecessary_geOutput n, (upward_necessity_geOutput n).2⟩

theorem future_defeat_modalized (n : ℕ) : StageNecessary n (Sentence.geOutput n) :=
  stageNecessary_geOutput n

theorem retro_revelation_modalized (n : ℕ) : StageNext n (histSeqUpto n) :=
  (histSeqUpto_proves_succ n)

end ModalTemporalFacts

end Foundation

end NoveltyTheory
