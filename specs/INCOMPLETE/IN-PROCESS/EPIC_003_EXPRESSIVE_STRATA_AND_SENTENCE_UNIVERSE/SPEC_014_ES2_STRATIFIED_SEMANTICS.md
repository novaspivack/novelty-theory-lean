# SPEC_014_ES2 — Stratified semantics and licensing

**Cite as:** **`SPEC_014_ES2`**.

## Purpose

Relate generators and regimes to sentences via:

- **`HoldsAt G φ`** — truth along the generator / standard model reading.
- **`ExpressibleAtHeight h φ`** (or regime-indexed variant) — **structural** bound on literals mentioned in `φ`, tied to resources (not “whatever we want to prove”).
- **`ProvesAt m φ`** — proof system indexed by depth / regime height; v1 aligns **`geOutput`** with `InvariantTower.provesAtDepth`.

## Coherence targets

- `proves_implies_expressible` (for the formalized fragment).
- `proves_sound` linking **`ProvesAt`** to **`HoldsAt`** on `natCounter`.
- Monotonicity lemmas for expressibility and (where true) provability extension.

## Acceptance

- `HoldsAt`, expressibility, and `ProvesAt` are **defined** with clear domains.
- Soundness is **proved** for the packaged fragment, not assumed.

## Lean modules

- `NoveltyTheory/Core/SentenceSemantics.lean`
- `NoveltyTheory/Core/Expressibility.lean`
- `NoveltyTheory/Models/SentenceProvability.lean` — `ProvesAt` (depends on Model C to avoid `Core → Models` cycles)
