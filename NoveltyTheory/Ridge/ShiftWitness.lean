import NoveltyTheory.Models.SignatureTower

/-!
# Shift witnesses (`SPEC_003_RCT` — ridge)

Connects the concrete **SignatureTower** model to generic `ParadigmShift` statements.
-/

namespace NoveltyTheory

namespace Ridge

theorem signatureParadigmShift (n : ℕ) :
    Core.ParadigmShift
      (Models.SignatureTower.regimeUpto n)
      (Models.SignatureTower.regimeUpto (n + 1))
      ((List.range (n + 1)).map Models.SignatureTower.phaseSingleton)
      (Models.SignatureTower.phaseSingleton (n + 1)) :=
  Models.SignatureTower.paradigmShift_succ n

end Ridge

end NoveltyTheory
