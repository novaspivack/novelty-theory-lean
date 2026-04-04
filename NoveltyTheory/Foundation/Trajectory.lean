import NoveltyTheory.Core.GenerativeSystem

/-!
# Trajectory facts (`SPEC_004_GSY`)

Basic lemmas used by models and adequacy layers.
-/

namespace NoveltyTheory

namespace Foundation

universe u

variable {S X : Type u}

theorem trace_mem_reachSet (G : Core.GenerativeSystem S X) (n : ℕ) :
    G.trace n ∈ G.reachSet :=
  ⟨n, rfl⟩

end Foundation

end NoveltyTheory
