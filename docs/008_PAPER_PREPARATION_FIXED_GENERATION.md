# 008 — Paper preparation (fixed generation / crown paper)

**Purpose:** Freeze the **claim surface** and prose discipline for the LaTeX draft under [`paper/`](../paper/README.md). This is **author tooling**: it may reference repository paths. **Do not** paste internal path lists into external-facing PDF prose; the paper itself should use theorem names and public artifact URLs only (see [`CODING_PROTOCOLS.md`](../CODING_PROTOCOLS.md) — LaTeX papers).

---

## 1. Claim freeze (primary vs supporting)

**Primary flagship (single headline package):**  
`NoveltyTheory.Summits.GeneralizedFinalCrownPackage` — six named theorems:

| Lean name | One-line role |
|-----------|----------------|
| `generalized_final_crown_iterated_structural_ascent` | Structural **v2** strict `ProvesAt` family |
| `generalized_final_crown_no_fixed_structural_stratum` | Scoped non-final stratum + abstract bounded-org packaging |
| `generalized_final_crown_future_defeat_of_terminality` | `FutureDefeat natCounter` |
| `generalized_final_crown_generator_truth_family` | Generator-truth ∧ structural family bundle |
| `generalized_final_crown_class_transfer` | Enum-crown gap + trace-disequal `Bool × ℕ` pair |
| `generalized_final_crown_not_model_artifact` | Two aligned systems, some trace inequality |

**Supporting layers (not coequal headlines):**

- Original summit stack (`Summits.SummitPackages` and satellites).
- Crown completion (`Summits.FinalCrownPackage` / `EPIC_011` story).

**Paper rule:** one primary narrative spine; others appear as “Dependencies / prior packaging” or appendix context.

---

## 2. Theorem-to-prose map (working copy)

The **authoritative four-column table** for the PDF lives in [`paper/figures/theorem_to_prose_table.tex`](../paper/figures/theorem_to_prose_table.tex). Before each drafting session:

1. Skim [`THEOREM_INVENTORY.md`](THEOREM_INVENTORY.md) for any renamed exports.
2. Update the **in informal-claim cells**; keep **Lean names** synchronized.
3. For each row, fill **interpretation boundary** aggressively—this is what reviewers attack first.

---

## 3. Boundaries section (write first in the PDF)

State **near the front** (the skeleton already has Section “Premises / trust boundary” before the intro is polished):

- Literal universal over **all** raw `AdmissibleInterface`-style rows without further scoping: **false** (trivial-interface / row-soundness phenomena).
- Literal infinite paradigm chain for **every** `RegimeFamilySingletonWithin` instance: **false** (empty-regime / obstruction templates).

Positive theorems quantify over **scoped** predicates and **constructed** classes (`Bool` tag pair, bounded admissible organization, …).

- Universal `FutureDefeat` over **all** `GenerativeSystem S ℕ`: **false** (`Ridge.UniversalUpwardNecessity.upward_necessity_universal_obstruction`).
- Packaged `ParadigmShift` without `ConservativeOver` on the same history: **not** implied by weak-step conjuncts alone; equivalence and separation witness in `Core.MinimalHypotheses` / `Ridge.ConservativeSeparationCountermodel`.
- On numeric observation type, ¬`FutureDefeat` ↔ uniformly bounded trace (`Ridge.ClosureCollapseBoundary`).

---

## 4. Three levels (must stay separated in prose)

Keep **non-overlapping vocabulary** in section headings and transitions:

| Level | Informal | Formal hooks (examples) |
|-------|----------|-------------------------|
| **Generation** | Trace / dynamics | `GenerativeSystem`, `trace`, `reachSet` |
| **Explanation** | Regimes, phases, `explains`, organization diagrams | `Phase`, `regimeUpto`, `OrganizationV2` |
| **Provability / expressibility** | Depth, sentences, `mentionBound` | `ProvesAt`, `HoldsAt`, Model C bridge |

**Anti-pattern:** calling a `ProvesAt` fact “emergence” without saying it is **proof-theoretic** relative to a fixed calculus.

---

## 5. Anti-collapse checklist (point to formal artifacts)

Use this list when drafting Section “Anti-collapse”:

| Dismissal | Formal counter (representative) |
|-----------|----------------------------------|
| “Only `geOutput`” | Structural / enum / `histSeqUpto` families — see inventory `EPIC_009`–`EPIC_012` rows |
| “Only trace ridge” | `structural_crown_not_traceEq_ridge_only`, `structuralV2_hist_not_traceEq_only` |
| “Only `mentionBound`” | `structural_crown_not_mentionBound_only`, `structuralV2_not_mentionBound_only` |
| “Only one model” | `generalized_crown_not_single_model_artifact`, class transfer row |

---

## 6. Dependency map (human one-pager)

- **In-repo (developer):** [`GENERALIZED_CROWN_DEPENDENCY_MAP.md`](GENERALIZED_CROWN_DEPENDENCY_MAP.md), [`CROWN_DEPENDENCY_MAP.md`](CROWN_DEPENDENCY_MAP.md).
- **In-paper:** TikZ figure [`paper/figures/layer_dependency.tex`](../paper/figures/layer_dependency.tex) — keep synchronized when modules move.

---

## 7. Rhetoric: existential vs class-level

**Recommended abstract shape (already in skeleton):**

1. **First sentence:** existential / canonical-counter flagship.
2. **Second sentence:** class-transfer strengthening (constructed `Bool × ℕ` pair, not “all systems”).
3. **Third sentence:** non-finality + future defeat packaging (scoped).

Body text should repeat this order before adding stronger informal gloss.

---

## 8. “What we do not prove” (one page)

Keep a dedicated section (skeleton: Section “What this paper does *not* prove”) and include at least:

- Not every deterministic system.
- Not every explanatory notion failing.
- Not “all organizations infinite.”
- Not metaphysical anti-determinism or backward causation.
- Not literal universals over raw interface rows or singleton-within families.

---

## 9. Comparison section (before intro polish)

Draft **before** the introduction is frozen:

| Reader charge | Response type |
|---------------|-----------------|
| Genotype / phenotypes only | Point to observation $\not\Rightarrow$ explanatory reduction packaging |
| Computational irreducibility only | Cite Wolfram as **kinship**; formal claims are different (proof height / regimes) |
| Proof-height rhetoric only | Anti-collapse + enum / poly / org layers |
| Single-model trick | `generalized_crown_not_model_artifact` + transfer |

---

## 10. When to touch Lean again

Per author instruction: **no new Lean for this paper** unless an abstract sentence cannot be matched to **any** inventory theorem—in that case add a **single** named packaging lemma, not a new research track.

---

__update: when the PDF title/author/repo URL stabilizes, refresh [`paper/refs.bib`](../paper/refs.bib) `noveltyTheoryLean2026` and [`docs/000_INDEX.md`](000_INDEX.md) if addendum docs appear._
