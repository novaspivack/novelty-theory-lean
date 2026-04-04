import NoveltyTheory.Core.SentenceHierarchyV2
import NoveltyTheory.Core.StructuralSentenceNaturality
import NoveltyTheory.Foundation.RetroStructuralTruthV2
import NoveltyTheory.Foundation.StructuralGeneratorSentence
import NoveltyTheory.Foundation.StructuralSentenceHierarchyV2
import NoveltyTheory.Models.SentenceProvability

/-!
# Structural sentence naturality facts (`SPEC_055_NS2`)
-/

namespace NoveltyTheory

namespace Foundation

namespace StructuralSentenceNaturalityFacts

open NoveltyTheory.Core
open NoveltyTheory.Core.SentenceHierarchyV2
open NoveltyTheory.Core.StructuralSentenceNaturality
open NoveltyTheory.Foundation.RetroStructuralTruthV2
open NoveltyTheory.Foundation.StructuralGeneratorSentence
open NoveltyTheory.Foundation.StructuralSentenceHierarchyV2
open NoveltyTheory.Models.SentenceProvability

theorem not_isRetroStructuralV2_natPhaseTagMem_initial (K x : ℕ) :
    ¬ IsRetroStructuralV2 (Sentence.natPhaseTagMem (NatPhaseTag.initial K) x) := by
  intro h
  simp [IsRetroStructuralV2] at h

theorem structuralV2_satisfies_weak_sentence_naturality :
    WeakStructuralSentencePrinciples IsStructuralSentenceV2 :=
  isStructuralV2_satisfies_weakPrinciples

theorem retroStructuralV2_satisfies_weak_sentence_naturality {φ : Sentence ℕ}
    (h : IsRetroStructuralV2 φ) : IsStructuralSentenceV2 φ :=
  isRetroStructuralV2_implies_structuralV2 h

/--
Same `mentionBound` does **not** decide **`IsStructuralSentenceV2`**: compare `geOutput 0` (in the V2
union via the generator fragment) with `natPhaseTagMem` on an **`initial`** tag (orthogonal fragment).
-/
theorem naturality_does_not_collapse_to_mentionBound :
    ∃ φ ψ : Sentence ℕ,
      mentionBound φ = mentionBound ψ ∧
        IsStructuralSentenceV2 φ ∧ ¬ IsStructuralSentenceV2 ψ :=
  ⟨Sentence.geOutput 0, Sentence.natPhaseTagMem (NatPhaseTag.initial 0) 0,
    And.intro
      (by simp [mentionBound, NatPhaseTag.bound] :
        mentionBound (Sentence.geOutput 0) =
          mentionBound (Sentence.natPhaseTagMem (NatPhaseTag.initial 0) 0))
      (And.intro (Or.inl (.geOutput 0))
        fun hV2 => by
          cases hV2 with
          | inl hgen =>
            exact natPhaseTagMem_initial_not_structural 0 0 hgen
          | inr hret =>
            exact not_isRetroStructuralV2_natPhaseTagMem_initial 0 0 hret)⟩

/--
The strict **`ProvesAt` ascent** family certified for **`histSeqUpto`** remains available **inside**
the structural V2 class (`SPEC_055_NS2`).
-/
theorem naturality_preserves_strict_ascent_family :
    ∃ Φ : ℕ → Sentence ℕ,
      (∀ n, IsStructuralSentenceV2 (Φ n)) ∧
        (∀ n, ProvesAt (n + 1) (Φ n) ∧ ¬ ProvesAt n (Φ n)) := by
  rcases structuralV2_crown_family with ⟨Φ, hΦ⟩
  exact ⟨Φ, fun n => (hΦ n).1, fun n => And.intro (hΦ n).2.1 (hΦ n).2.2⟩

end StructuralSentenceNaturalityFacts

export StructuralSentenceNaturalityFacts (structuralV2_satisfies_weak_sentence_naturality
  retroStructuralV2_satisfies_weak_sentence_naturality naturality_does_not_collapse_to_mentionBound
  naturality_preserves_strict_ascent_family)

end Foundation

end NoveltyTheory
