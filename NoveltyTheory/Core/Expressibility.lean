import NoveltyTheory.Core.SentenceExpressibility

/-!
# Expressibility strata (shim)

Definitions live in **`SentenceExpressibility.lean`** (`SPEC_013` / `SPEC_014` roadmap name). This
module preserves the stable import path **`Core.Expressibility`**.
-/

namespace NoveltyTheory

namespace Core

export SentenceExpressibility (mentionBound ExpressibleAtHeight expressibleAtHeight_iff mentionBound_not
  mentionBound_histSeq)

end Core

end NoveltyTheory
