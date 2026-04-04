# EPIC_013 — Naturality and inevitability strengthening

**Cite epic as:** **`EPIC_013_NATURALITY_AND_INEVITABILITY_STRENGTHENING`**.

**Goal:** Strengthen the completed **generalized crown** (`EPIC_012`, `GeneralizedFinalCrownPackage`) from a powerful **existential + class-transfer** theorem family into a family that is **less vulnerable to the “specially engineered setup” objection**, by proving **naturality** of key notions, **broader transfer**, and **inevitability / anti-closure** under **weak natural conditions**—without weakening landed theorems or reopening refuted raw universals.

**Depends on:** **`EPIC_012`** complete (`SPEC_048_GC1`–`SPEC_053_GC6`); base case theorems remain the floor.

**Status:** **Complete** — Lean **`SPEC_054_NS1`–`SPEC_058_NS5`** shipped; **`SPEC_059_NS6`** paper + docs aligned in-repo (2026-04-04).

---

## Strategic move

| From | Toward |
|------|--------|
| \(\exists G\) with crown phenomenon; \(\exists \mathcal{C}\) with transfer | \(\forall G \in \mathcal{G}_{\mathrm{nat}}\), weak natural conditions \(\Rightarrow\) non-finality / unbounded organization / ascent (as far as honestly provable) |

Full universality over **all** deterministic systems is **out of scope** unless honestly derived; the epic targets a **substantial** step toward **inevitability** on a **meaningful natural class**.

---

## Success criterion (epic-level)

The epic succeeds only if the **paper** (after **`SPEC_059_NS6`**, and **only** when theorems exist) can honestly upgrade its main thrust from:

- *There exist lawful self-transcending generators, with transfer across a nontrivial admissible class*

toward:

- *Generators satisfying a weak natural explanatory admissibility profile exhibit non-final explanatory closure or require unbounded organizational hierarchy* (exact quantifiers matching landed Lean).

If new theorems do **not** materially weaken the **setup-dependent** critique, the epic is **not** done.

---

## Phase plan

| Phase | Focus | Specs |
|-------|--------|------|
| **A** | Naturality of admissibility / structural classes | **`SPEC_054_NS1`** |
| **B** | Naturality of structural sentence hierarchy | **`SPEC_055_NS2`** |
| **C** | Broader admissible-class transfer | **`SPEC_056_NS3`** |
| **D** | Unbounded organization inevitability | **`SPEC_057_NS4`** |
| **E** | Natural anti-closure summit | **`SPEC_058_NS5`** |
| **F** | Paper + diagram + table + appendix + doc surface | **`SPEC_059_NS6`** |

---

## Theory specs (execute in order)

| Order | Spec | Focus |
|------:|------|--------|
| 1 | [**`SPEC_054_NS1`**](SPEC_054_NS1_NATURALITY_AXIOMS_FOR_ADMISSIBILITY.md) | Weak naturality principles; admissibility as instance; trivial-interface exclusion |
| 2 | [**`SPEC_055_NS2`**](SPEC_055_NS2_NATURALITY_OF_STRUCTURAL_SENTENCE_HIERARCHY.md) | Structural sentence families; `StructuralSentenceHierarchyV2` / retro as instances |
| 3 | [**`SPEC_056_NS3`**](SPEC_056_NS3_BROADER_ADMISSIBLE_CLASS_TRANSFER.md) | `NaturalAdmissibleClass`; broad transfer; distinct non-cosmetic instances |
| 4 | [**`SPEC_057_NS4`**](SPEC_057_NS4_UNBOUNDED_ORGANIZATION_INEVITABILITY.md) | Bounded-org obstruction under natural conditions; inevitability read |
| 5 | [**`SPEC_058_NS5`**](SPEC_058_NS5_NATURAL_ANTI_CLOSURE_THEOREM.md) | Disjunctive or conjunctive anti-closure **only as honest**; quantified natural class |
| 6 | [**`SPEC_059_NS6`**](SPEC_059_NS6_PAPER_CLAIM_SURFACE_UPGRADE.md) | LaTeX + **figures + tables + appendix** sync; inventory; strengthened docs |

---

## Hard boundaries (non-negotiable)

1. **Do not** weaken current completed theorems (`EPIC_011` / `EPIC_012`).
2. **Do not** reopen already-refuted **raw** universal diagonals / “every regime family” paradigms unless the formal predicates are honestly fixed.
3. Every new abstraction **must** yield a **strictly stronger** theorem than **restating** current generalized transfer in new words.
4. If the strongest conjunctive inevitability statement is **false**, formalize obstruction and ship the **strongest true** disjunctive or scoped theorem (**Rule 6** in child specs).
5. **`SPEC_059_NS6`:** **No** headline prose upgrade until the corresponding **`theorem` / `lemma`** exists (`QUEUE.md` contract: honest disclosure).

---

## Definition of done (epic-level)

1. Acceptance criteria met for **`SPEC_054`**–**`SPEC_058`** (Lean + `lake build`).
2. **`SPEC_059`:** paper/diagram/table/appendix alignment per that spec; [`docs/THEOREM_INVENTORY.md`](../../../../docs/THEOREM_INVENTORY.md) updated for every new public theorem row; [`docs/STRENGTHENED_CLAIM_SURFACE.md`](../../../../docs/STRENGTHENED_CLAIM_SURFACE.md) and [`docs/STRENGTHENED_DEPENDENCY_MAP.md`](../../../../docs/STRENGTHENED_DEPENDENCY_MAP.md) filled (not placeholder-only).
3. [`NoveltyTheory/All.lean`](../../../../NoveltyTheory/All.lean) imports new modules when they land.
4. Roll-ups: [`docs/000_INDEX.md`](../../../../docs/000_INDEX.md), [`specs/MASTER_STATUS.md`](../../../MASTER_STATUS.md), [`QUEUE.md`](../../../../QUEUE.md).

---

## Operational rules (agents)

1. **Order:** default **054 → 059**; document any deviation in the spec that forces it.
2. **Inventory:** every new **`theorem` / `lemma`** → [`docs/THEOREM_INVENTORY.md`](../../../../docs/THEOREM_INVENTORY.md) in the same change when practical.
3. **Proof quality:** [`CODING_PROTOCOLS.md`](../../../../CODING_PROTOCOLS.md); audit **`sorry`**, axioms, smuggled definitions, collapse.

---

_Last update: epic scaffolded; **`SPEC_054`–`SPEC_059`** define work items._
