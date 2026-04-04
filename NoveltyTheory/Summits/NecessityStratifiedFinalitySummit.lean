import NoveltyTheory.Models.InvariantTower
import NoveltyTheory.Models.SignatureTower
import NoveltyTheory.Models.StratifiedFinality

/-!
# Necessity stratified finality summit (`SPEC_025_NSF2`, `SPEC_026_NSF3`)

**`SelfCertificationObstruction`** names the **finite depth** ceiling in Model C (**`no_proves_self`** family).
Future unboundedness is **`natCounter_futureDefeat`**.
-/

namespace NoveltyTheory

namespace Summits

namespace NecessityStratifiedFinalitySummit

open NoveltyTheory.Models.InvariantTower NoveltyTheory.Models.StratifiedFinality
open NoveltyTheory.Models.SignatureTower

abbrev SelfCertificationObstruction (n : ℕ) : Prop :=
  ∃ f : CounterFact, ¬ provesAtDepth n f

theorem self_certification_obstruction (n : ℕ) : SelfCertificationObstruction n :=
  ⟨CounterFact.geOutput n, not_proves_self n⟩

theorem nat_counter_future_defeat : FutureDefeat natCounter :=
  natCounter_futureDefeat

end NecessityStratifiedFinalitySummit

end Summits

end NoveltyTheory
