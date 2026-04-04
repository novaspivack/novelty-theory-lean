# SPEC_059_NS6 — Paper, diagrams, tables, appendices, and claim-surface upgrade

**Cite as:** **`SPEC_059_NS6`**.

**Epic:** [`EPIC_013_MASTER_ORCHESTRATION.md`](EPIC_013_MASTER_ORCHESTRATION.md).

**Depends on:** **`SPEC_054`**–**`SPEC_058`** complete **enough** that every upgraded prose line has a **named** `theorem` / `lemma` anchor.

**Status:** **Complete** (2026-04-04) — `paper/Final Draft/novelty_theory_generalized_crown.tex` updated (abstract, remark, Table `tab:strengthened-lean`, longtable + DAG row); `docs/THEOREM_INVENTORY.md`, `STRENGTHENED_*`, `MANIFEST.md`, roll-ups aligned; `latexmk` succeeds.

---

## Hard gate

**Do not** upgrade headline claims until the corresponding **Lean** results exist (**EPIC_013 Rule 5**). Draft prose may live in a branch, but **default paper** shipped from repo must stay **honest** to `lake build` + inventory.

---

## Deliverables — LaTeX (`paper/Final Draft/`)

Primary vehicle: [`paper/Final Draft/novelty_theory_generalized_crown.tex`](../../../../paper/Final%20Draft/novelty_theory_generalized_crown.tex) **unless** the owner splits a second file—if so, keep **one** bibliography / theorem-inventory discipline.

### Required content changes (when theorems land)

1. **Abstract:** shift from purely existential + transfer wording toward **weak-principle inevitability** wording **only as supported**.
2. **Introduction:** central question framed as **non-finality under weak natural conditions**, not only existence of generators.
3. **New section (prose name flexible):** e.g. *Naturality, setup dependence, and why the result is not merely engineered* — states what **`SPEC_054`–`SPEC_058`** bought, honestly.
4. **Comparisons / limitations:** explicit answer to *“specially designed admissibility”* objection using **theorem citations**, not rhetoric.
5. **Trust boundary:** tighten **scope** to **\(\mathcal{G}_{\mathrm{nat}}\)** / natural class—not “all systems” unless proved.

### Required **visual** / tabular sync

- **`fig:conceptual-spine`** (or successor figure): if the **strategic story** adds a **naturality / class** layer, update the TikZ so the diagram still reads cleanly (no overlapping edges; same style discipline as prior passes).
- **Table 1** (`tab:crown-lean`): add rows **only** for new **summit** names that exist in Lean; keep identifier column honest.
- **Table 2** (`tab:theorem-inventory` longtable): extend with new modules / theorems; preserve row-spacing and `\ttwrap` patterns for long identifiers.
- **Appendix A** (witness / proof sketches): add **blocks** for new construction witnesses **only when** they are part of the certification story; keep **skimmable** `witnessmeta` / `proofsketch` layout.
- **Dependency appendix:** new module import closure and **proof refinement** / DAG subsection if **`SPEC_058`** summit changes the spine.

Optional separate file mentioned in planning: if `paper/Self_Transcending_Generators_Strengthened.tex` is created, it must still obey **no internal `docs/specs` pointers** in narrative body (paper rules in `QUEUE.md` / `NOTES/PROJECT_SEED.md`).

---

## Deliverables — `docs/`

| File | Action |
|------|--------|
| [`docs/THEOREM_INVENTORY.md`](../../../../docs/THEOREM_INVENTORY.md) | Full row sync for every new public `theorem` / `lemma` |
| [`docs/STRENGTHENED_CLAIM_SURFACE.md`](../../../../docs/STRENGTHENED_CLAIM_SURFACE.md) | Replace placeholder with **claim ↔ Lean name** table + honest scope |
| [`docs/STRENGTHENED_DEPENDENCY_MAP.md`](../../../../docs/STRENGTHENED_DEPENDENCY_MAP.md) | DAG for **`EPIC_013`** modules + summit import closure |
| [`docs/000_INDEX.md`](../../../../docs/000_INDEX.md) | Link new / updated docs |
| [`MANIFEST.md`](../../../../MANIFEST.md) | Module map update if new dirs |

---

## Acceptance criteria

- Headline prose is **materially stronger** than pre-**`EPIC_013`** draft **iff** matched by Lean.
- **Zero** uncited strengthenings in abstract/intro/conclusion.
- Diagrams/tables/appendices **coherent** with new material (no stale `Bool × ℕ`-only wording if **`SPEC_056`** broadens class honestly).

---

## Completion checklist

- [x] `latexmk` / `pdflatex` on updated paper(s); fix overfull boxes introduced by new paths
- [x] `docs/THEOREM_INVENTORY.md`, strengthened docs, `000_INDEX.md` updated in **same** merge as paper
- [x] Epic + `MASTER_STATUS` + `QUEUE` moved toward **Complete** when **`SPEC_059`** checks out

---

_This is the **last** spec in **`EPIC_013`**._
