# SPEC_058_NS5 — Natural anti-closure theorem (inevitability summit)

**Cite as:** **`SPEC_058_NS5`**.

**Epic:** [`EPIC_013_MASTER_ORCHESTRATION.md`](EPIC_013_MASTER_ORCHESTRATION.md).

**Depends on:** **`SPEC_054`**–**`SPEC_057`** as needed; may ship **honest partial** results if full conjunctive form fails.

**Status:** Pending.

---

## Goal

Land the **sharpest true inevitability theorem** available in this wave:

Target shape (exact Lean to be determined):

\[
\forall G \in \mathcal{G}_{\mathrm{nat}},\;
\bigl(\mathrm{WeakNaturality}(G)\land \mathrm{SufficientGenerativity}(G)\bigr)
\Rightarrow
\bigl(\mathrm{NoFinalExplanatoryClosure}(G)\lor \mathrm{UnboundedAscent}(G)\bigr).
\]

**Preferred if honest:**

\[
\cdots \Rightarrow
\bigl(\mathrm{NoFinalExplanatoryClosure}(G)\land \mathrm{UnboundedAscent}(G)\bigr).
\]

If the **conjunctive** conclusion is **false** under honest predicates, **do not** force it—document the obstruction in Lean (`theorem` naming the gap or `lemma` bounding what can be proved) and ship the **strongest disjunctive** or **scoped** form.

---

## Required new modules (Lean)

| Path | Role |
|------|------|
| `NoveltyTheory/Ridge/NaturalAntiClosure.lean` | Core implication chains |
| `NoveltyTheory/Summits/NaturalAntiClosureSummit.lean` | Paper-facing summit bundle |

---

## Required theorem targets (names indicative)

- `weak_natural_conditions_imply_nonfinality_or_ascent`
- `sufficient_generativity_forces_no_final_closure` (if true as stated; else rename to match actual hypothesis)
- `natural_anti_closure_theorem` (umbrella)
- `setup_dependence_significantly_reduced` (prover-visible explanation: e.g. compares hypothesis class to prior `EPIC_012`—keep **role-based** naming, no people)

---

## Acceptance criteria

- Quantifies over a **meaningful** `𝒢_nat` (not a singleton `def` wrapping `natCounter` unless that is *proved* maximal—unlikely).
- **Does not** restate **only** `crown_transfers_across_admissible_class` in longer prose.
- **Explicitly** states relationship to `GeneralizedFinalCrownPackage` (base case vs strengthening layer).

## Failure modes to avoid

- Proving a “universal” claim by assuming `WeakNaturality :=` “satisfies crown.”

---

## Completion checklist

- [ ] `lake build` green
- [ ] `docs/THEOREM_INVENTORY.md` updated
- [ ] `NoveltyTheory/All.lean` imports
- [ ] If conjunctive form fails: **`docs/KEY_LEARNINGS.md`** or technical debt entry for the honest obstruction (per registry discipline)

---

_Next: **`SPEC_059_NS6`**._
