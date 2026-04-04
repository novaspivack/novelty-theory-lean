import NoveltyTheory.Core.GenerativeSystem

/-!
# Generalized numeric section (`SPEC_048_GC1`)

A **sectioned carrier** packages an embedded numeric line **`ℕ → X`** and an observation map
**`X → ℕ`** that splits the embedding. Aligned generators satisfy **`G.trace n = embed n`** so trace
facts on the carrier recover **`natCounter`** observations.
-/

namespace NoveltyTheory

namespace Core

namespace GeneralizedCarrier

variable {S X : Type}

/-- Numeric section: embedded times are readable back out as plain **`ℕ`**. -/
structure CarrierSection (X : Type) where
  embed : ℕ → X
  observe : X → ℕ
  observe_embed : ∀ n : ℕ, observe (embed n) = n
  embed_injective : Function.Injective embed

/-- Generator trace agrees pointwise with the embedded numeric line. -/
def AlignsCarrier (G : GenerativeSystem S X) (C : CarrierSection X) : Prop :=
  ∀ n : ℕ, G.trace n = C.embed n

/-- Tag **`α`** paired with the numeric coordinate (**`SPEC_044`** product pattern, renamed here). -/
def prodCarrierSection (α : Type) [Inhabited α] : CarrierSection (α × ℕ) where
  embed n := (default, n)
  observe := Prod.snd
  observe_embed := fun _ => rfl
  embed_injective := fun _ _ h => congr_arg Prod.snd h

/-- Identity section on **`ℕ`**: embeddings are plain numerals (`SPEC_056_NS3`). -/
def natIdentitySection : CarrierSection ℕ where
  embed := id
  observe := id
  observe_embed := fun _ => rfl
  embed_injective := Function.injective_id

/-- Explicit **`true`** tag section (`SPEC_052` — avoids relying on `default : Bool`). -/
def trueBoolPairSection : CarrierSection (Bool × ℕ) where
  embed n := (true, n)
  observe := Prod.snd
  observe_embed := fun _ => rfl
  embed_injective := fun _ _ h => congr_arg Prod.snd h

/-- Alternate section with tag **`false`** on the embedded line (`SPEC_052`). -/
def altBoolPairSection : CarrierSection (Bool × ℕ) where
  embed n := (false, n)
  observe := Prod.snd
  observe_embed := fun _ => rfl
  embed_injective := fun _ _ h => congr_arg Prod.snd h

end GeneralizedCarrier

end Core

end NoveltyTheory
