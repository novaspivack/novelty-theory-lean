import Lake
open Lake DSL

package «novelty-theory-lean» where
  leanOptions := #[⟨`autoImplicit, false⟩]

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.29.0-rc6"

@[default_target]
lean_lib «NoveltyTheory» where
  roots := #[`NoveltyTheory.Basic]
