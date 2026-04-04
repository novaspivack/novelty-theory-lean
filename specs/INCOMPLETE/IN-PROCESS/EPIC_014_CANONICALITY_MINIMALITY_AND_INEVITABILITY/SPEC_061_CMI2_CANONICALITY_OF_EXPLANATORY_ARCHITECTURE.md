# SPEC_061_CMI2 — Canonicality of explanatory architecture

**ID:** **`SPEC_061_CMI2`**  
**Epic:** **`EPIC_014_CANONICALITY_MINIMALITY_AND_INEVITABILITY`**

## Goal

Show that any **adequate** formal account of explanatory non-finality under fixed law admits a **representation** or **embedding** into (or induces objects equivalent to) the project’s **generator / regime / reduction / structural-truth** scheme.

## Required artifacts

| Path | Role |
|------|------|
| [`NoveltyTheory/Core/CanonicalExplanatoryArchitecture.lean`](../../../../NoveltyTheory/Core/CanonicalExplanatoryArchitecture.lean) | Weak abstract “explanatory architecture” |
| [`NoveltyTheory/Foundation/CanonicalityFacts.lean`](../../../../NoveltyTheory/Foundation/CanonicalityFacts.lean) | Functorial links into Core |
| [`NoveltyTheory/Ridge/ArchitectureRepresentation.lean`](../../../../NoveltyTheory/Ridge/ArchitectureRepresentation.lean) | Representation / comparison theorems |

## Theorem targets

- `weak_explanatory_architecture_induces_generator_regime_scheme`
- `canonical_representation_of_explanatory_architecture`
- `every_adequate_account_instantiates_reduction_layer`
- `every_adequate_account_instantiates_structural_truth_layer`
- **Honest analogue** of `current_architecture_is_canonical_normal_form` (weaker phrasing if uniqueness false)

## Acceptance

- “Canonical” has a **reviewable** formal meaning (embedding / equivalence / universal property fragment).
- **Strictly** between “all frameworks identical” and “one arbitrary choice.”

## Failure mode

Claiming **global uniqueness** when only **faithful embedding up to equivalence** is proved.

## Status

**Closed at honest baseline** — definitional **`weakArchitectureOf`** normal form (`ArchitectureRepresentation.weak_explanatory_architecture_induces_generator_regime_scheme`, `canonical_representation_of_explanatory_architecture`) and vacuous backward reduction (`Reduction.reducible_of_isEmpty` / `every_adequate_account_instantiates_reduction_layer_on_empty_later_desc`). **Non-vacuous** embedding into full structural-sentence / admissibility tower remains future work (quantify separately if pursued).
