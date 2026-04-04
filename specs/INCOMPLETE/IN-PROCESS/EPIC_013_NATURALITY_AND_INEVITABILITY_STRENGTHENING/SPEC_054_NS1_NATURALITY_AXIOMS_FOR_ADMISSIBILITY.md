# SPEC_054_NS1 — Naturality axioms for admissibility

**Cite as:** **`SPEC_054_NS1`**.

**Epic:** [`EPIC_013_MASTER_ORCHESTRATION.md`](EPIC_013_MASTER_ORCHESTRATION.md).

**Status:** Pending.

---

## Goal

Show that central **admissibility** and **organization** notions are not arbitrary: they **instantiate** a small bundled class of **weak structural principles** that could admit **other** instances later—without collapsing the definition of “natural” to “only what we already built.”

---

## Required new modules (Lean)

| Path | Role |
|------|------|
| `NoveltyTheory/Core/NaturalityAxioms.lean` | Bundled weak principles (structures / classes), minimal commitments |
| `NoveltyTheory/Foundation/NaturalityFacts.lean` | lemmas tying principles to existing Core/Foundation predicates |
| `NoveltyTheory/Ridge/AdmissibilityNaturality.lean` | Ridge-level theorems: current interfaces satisfy the bundle |

---

## Principle bundle (illustrative — refine in Lean)

Axiomatize (as **weak** as possible) ideas such as:

1. **Adequacy preservation** (relative to the formal `Adeq` / adequacy pattern already in use).
2. **Phase-invariant preservation** on certified histories.
3. **Conservative history behavior** across regime transition (compatible with `ConservativeOver`-style commitments).
4. **Nontriviality / anti-trivial-interface**: rules out reducers that collapse distinctions the theory treats as substantive (must not merely restate current theorems as definitions).
5. **Compatibility with stratified expressibility / provability** (interfaces align with depth-indexed or staged proof structure where the library already commits).
6. **Optional:** modest compositional closure (only if it pays rent in **`SPEC_058`** or **`SPEC_057`**).

---

## Required theorem targets (names indicative)

- `weakNaturality_of_signatureAdmissibleInterface`
- `weakNaturality_of_organizationAbstract`
- `weakNaturality_excludes_trivial_interface`
- `weakNaturality_preserves_crown_relevance` (formalize: naturality hypotheses preserve the **logical role** of crown obstructions, not a slogan)
- `current_admissibility_is_natural_instance` (unpacks current key notions as instances of the bundle)

---

## Acceptance criteria

- Current admissibility notions are **examples** of a **more general** weak class; the class is **not** logically equivalent to “exists crown package.”
- **Trivial-interface** behavior is ruled out by a **stated** principle, not an unstated `excluded_middle`-style hack.
- New code is **additive**; **`EPIC_012`** theorems remain as strong.

## Failure modes to avoid

- Defining “natural” so strongly that **only** `Bool × ℕ` aligned constructions satisfy it.
- Smuggling the crown conclusion into a definition in `NaturalityAxioms.lean`.

---

## Completion checklist

- [ ] `lake build` green; no new `sorry` without TODO + registry
- [ ] Rows in [`docs/THEOREM_INVENTORY.md`](../../../../docs/THEOREM_INVENTORY.md) for new public declarations
- [ ] [`NoveltyTheory/All.lean`](../../../../NoveltyTheory/All.lean) imports new modules

---

_Next: **`SPEC_055_NS2`**._
