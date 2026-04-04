import Lake
open Lake DSL

package «novelty-theory-lean» where
  leanOptions := #[⟨`autoImplicit, false⟩]

/-- Mathlib **last**: keeps transitive tool deps aligned with Mathlib’s pins (matches `ugp-lean`). -/
require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.29.0-rc6"

/-- Indexes `NoveltyTheory/` using root module `NoveltyTheory.lean` (same layout as `ugp-lean`). -/
@[default_target]
lean_lib «NoveltyTheory»
