# EPIC_010 — Expressive and organization frontier

**Goal:** Carry forward the **research-grade extensions** called out in [`docs/THEOREM_INVENTORY.md`](../../../../docs/THEOREM_INVENTORY.md) (still open after **`SPEC_033_K7A`**): richer phase/sentence syntax, **derivability** access for atoms currently **semantic-only**, modalities, and **stronger** organization / terminality predicates—each with **scoped** specs so work stays honest and incremental.

**Motivation:** [`docs/007_LIBRARY_POSITIONING_ASSESSMENT.md`](../../../../docs/007_LIBRARY_POSITIONING_ASSESSMENT.md) §4 (crown vs extensions); inventory “Still research-grade open” section.

**Depends on:** **EPIC_003**–**EPIC_008**; independent of **EPIC_009** sequencing except where crown proofs consume richer syntax (then order tasks after the relevant spec).

**Relationship to EPIC_009:** **EPIC_009** targets **depth of theorems** on the existing sentence stack; **EPIC_010** **widens** what the stack can express. Either may land first per dependency graph.

**Status:** **Complete (v1 tranche)** — richer enum atom, initial-tag `ProvesAt`, stage modality scaffolding, organization separation predicates + summit (see specs **038**–**041**).

---

## Theory specs

| Order | Spec | Focus |
|------:|------|--------|
| 1 | [**`SPEC_038_XS1`**](SPEC_038_XS1_RICHER_SENTENCE_SYNTAX.md) | Beyond current `NatPhaseTag` / encoding limits; `Phase.outputSet`-grade atoms without smuggling |
| 2 | [**`SPEC_039_DT1`**](SPEC_039_DT1_INITIAL_TAG_DERIVABILITY.md) | `NatPhaseTag.initial` at the **derivability** fringe (`ProvesAt`) |
| 3 | [**`SPEC_040_MD1`**](SPEC_040_MD1_MODALITIES_SCOPING.md) | Modal-like extensions—definitions, minimal axioms policy, first obligations |
| 4 | [**`SPEC_041_OR1`**](SPEC_041_OR1_STRONGER_ORGANIZATION.md) | Strengthen `AdequateOrganization` / related predicates; universal-class pitfalls |

---

## Living progress

| Phase | Status | Notes |
|-------|--------|-------|
| Richer syntax | **Complete** | `outputEnumMem` + `Foundation.RichSentenceSyntax` |
| Initial-tag provability | **Complete** | `ProvesAt.initial` branch + `provesAt_initial_endpoint` |
| Modalities | **Complete** | `Foundation.StageModality` (`StageNecessary`) |
| Organization | **Complete** | `SeparatesStages` + `OrganizationFrontierSummit` |

---

## Queue

| # | Task | Spec | Status |
|---|------|------|--------|
| 1 | Sentence/phase grammar extensions + honesty checks | `SPEC_038_XS1` | **Complete** |
| 2 | Close semantic/provable gap for `initial` tag | `SPEC_039_DT1` | **Complete** |
| 3 | Modality scoping + baseline lemmas | `SPEC_040_MD1` | **Complete** |
| 4 | Stronger organization predicates | `SPEC_041_OR1` | **Complete** |

_Further tranches (e.g. **`ProvesAt`** for **`outputEnumMem`**, polymorphic phase syntax at sentence level) are out of scope for this v1 close; add **`EPIC_011`** or extend specs if needed._

---

## Cross-links

- [`../../../MASTER_STATUS.md`](../../../MASTER_STATUS.md)
- [`../../../../QUEUE.md`](../../../../QUEUE.md)
