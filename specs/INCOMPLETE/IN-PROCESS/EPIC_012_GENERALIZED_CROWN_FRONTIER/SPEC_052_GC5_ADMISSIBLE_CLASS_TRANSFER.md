# SPEC_052_GC5 — Admissible class transfer (`Bool × ℕ`)

**Cite as:** **`SPEC_052_GC5`**.

## Purpose

Exhibit **two** **`GenerativeSystem ℕ (Bool × ℕ)`** instances whose **traces differ** everywhere, each **carrier-aligned** with a **tagged** **`CarrierSection`**, such that **the same** enum-crown witness family **strictly ascends** under **`ProvesAtCarrier`** for **both**—establishing **cross-class transfer** of the crown phenomenon **plus** **observational mismatch** (not a single artifact).

## Hard boundaries

- **No** claim of transfer for **all** carriers—only the **constructed** **`true` / `alt`** class pair.
- **No `sorry`**; **no** new axioms.

## Required modules (minimum)

| Module path | Role |
|-------------|------|
| `NoveltyTheory/Ridge/CrownTransfer.lean` | Generators, alignment, faithfulness, gap packaging |
| `NoveltyTheory/Models/ClassTransferExamples.lean` | Examples re-export |
| `NoveltyTheory/Summits/GeneralizedCrownTransferSummit.lean` | Summit |

## Required theorem names (minimum)

| Name | Intent |
|------|--------|
| `crown_transfers_across_admissible_class` | Gap at **`n`** + **∀ n0`, traces differ |
| `generalized_crown_not_single_model_artifact` | **∃** two aligned instances with **different** traces |
| `exists_two_nonisomorphic_crown_instances` | **Distinct** carrier-embedded sentences with respective **`ProvesAtCarrier`** |

## Acceptance

**Complete** when soundness preservation + parallel strict gaps + **non-isomorphism** lemmas are **proved** and **summited**.

## Dependencies

- **`SPEC_048_GC1`**, **`SPEC_043_CG2`**.

## Status

**Complete** — see [`CrownTransfer.lean`](../../../../NoveltyTheory/Ridge/CrownTransfer.lean).
