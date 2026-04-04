# EPIC_002 — Self-transcending generators (novelty theory)

**Goal:** Formal Lean 4 development proving **existence and structure of self-transcending generative systems**: fixed causal laws that generate infinite conservative towers of structurally irreducible explanatory regimes, such that **no fixed admissible explanatory interface** to the generator uniformly captures the tower—and, at the strongest tier, **generated regimes become necessary** to state structural truths about the generator’s own long-run behavior.

**Parent narrative:** [`SPEC_002_OCN`](../THEORY_SEED.md/002_OCN_ORIGINAL_CONCEPT.md). **Next-wave roadmap:** [`SPEC_003_NXT`](../THEORY_SEED.md/003_NXT_NEXT_WAVE.md) (cite as **`SPEC_003_NXT`**).

**Host library epic:** Scaffold and cross-cutting repo policy remain under [`EPIC_001_NOVELTY_THEORY_LEAN`](../EPIC_001_NOVELTY_THEORY_LEAN/EPIC_001_MASTER_ORCHESTRATION.md); this epic owns the mathematical program and module ladder.

## Scope

- Core definitions: generative systems, phases, regimes, admissible reductions, paradigm shifts, towers, reducers / enumeration hooks.
- Foundation lemmas, ridge (bridge) theorems, summit packages, and concrete model paths (signature tower, reducer diagonal, upward-necessity model).
- Alignment of `NoveltyTheory/` tree with [`SPEC_003_RCT_REPO_CONTRACT.md`](SPEC_003_RCT_REPO_CONTRACT.md).

## Out of scope (unless a later spec says otherwise)

- Parent prose repositories, PDF pipeline, or submodule consumers ([`NOTES/PROJECT_SEED.md`](../../../../NOTES/PROJECT_SEED.md) §7.3).

## Dependencies

- Mathlib pin per [`docs/003_LEAN_TOOLCHAIN_PIN.md`](../../../../docs/003_LEAN_TOOLCHAIN_PIN.md).
- Proof discipline: [`CODING_PROTOCOLS.md`](../../../../CODING_PROTOCOLS.md).
- Bootstrap complete per **`SPEC_001_ST1`**.

## Theory specs (normative ladder)

| Order | Spec | Focus |
|------:|------|--------|
| 1 | [**`SPEC_003_RCT`**](SPEC_003_RCT_REPO_CONTRACT.md) | Repo/library contract for theory tranche: module graph, naming, hygiene, documentation hooks |
| 2 | [**`SPEC_004_GSY`**](SPEC_004_GSY_GENERATIVE_SYSTEMS.md) | `GenerativeSystem`, trajectories, emitted trace |
| 3 | [**`SPEC_007_PIN`**](SPEC_007_PIN_PHASES_AND_INVARIANTS.md) | `Phase`, invariants, `GeneratedBy` / phase change |
| 4 | [**`SPEC_005_EXR`**](SPEC_005_EXR_EXPLANATORY_REGIMES.md) | `ExplanatoryRegime`, adequacy vs trivial coding |
| 5 | [**`SPEC_006_ADR`**](SPEC_006_ADR_ADMISSIBLE_REDUCTIONS.md) | `AdmissibleReduction` / explanatory maps, non-collapse, encodability |
| 6 | [**`SPEC_008_PSH`**](SPEC_008_PSH_PARADIGM_SHIFTS.md) | `ParadigmShift`, conservative extension, irreducibility |
| 7 | [**`SPEC_009_DST`**](SPEC_009_DST_DIAGONAL_SELF_TRANSCENDENCE.md) | Diagonal / staged defeat of enumerated admissible interfaces |
| 8 | [**`SPEC_010_UEN`**](SPEC_010_UEN_UPWARD_EXPLANATORY_NECESSITY.md) | Upward explanatory necessity (`Φ_n`, provability separation) |
| 9 | [**`SPEC_011_SPK`**](SPEC_011_SPK_SUMMIT_PACKAGES.md) | Summit I–IV packaging, theorem names, dependency order |
| 10 | [**`SPEC_012_MDL`**](SPEC_012_MDL_MODEL_LADDER.md) | Concrete models A/B/C and smoke-test ordering |

## Living progress

| Phase | Status | Notes |
|-------|--------|-------|
| Phase 0 — Repo contract + primitives | Done in Lean | Core/Foundation; **`SPEC_003_RCT`** acceptance closed |
| Phase 1 — Admissible reductions + paradigm shifts | Done in Lean | `Reducible`, `ParadigmShift`, `ConservativeOver`, `Core.Explains`, `InterfaceAlignment` |
| Phase 2 — Diagonal existence + towers | Done in Lean (model graft) | `DiagonalNat`, `ReducerDiagonal`, `InterfaceAlignment`; further abstraction optional |
| Phase 3 — Upward necessity + summits | Done in Lean | Summits I–IV + order witness; **honest** global diagonal uses `SignatureAdmissibleInterface` (soundness in type)—see `SummitPackages.summit_diagonal_all_bundled_admissible` |
| Phase 4 — Models + NXT packaging | **Complete** | Models A+B+C + `DupRegimeTower`; NXT S6–S10 + bundled `SignatureAdmissibleInterface` in [`SummitPackages`](../../../../NoveltyTheory/Summits/SummitPackages.lean); [`SPEC_034_R2B`](../SPEC_034_R2B_EPIC002_SCOPE_CLOSURE.md) |

## Queue — ordered next steps

| # | Task | Spec | Status |
|---|------|------|--------|
| 1 | Satisfy **`SPEC_003_RCT`** (theory module contract) | [`SPEC_003_RCT_REPO_CONTRACT.md`](SPEC_003_RCT_REPO_CONTRACT.md) | Done — acceptance criteria closed |
| 2 | Implement **`SPEC_004_GSY`** in `NoveltyTheory/` | [`SPEC_004_GSY_GENERATIVE_SYSTEMS.md`](SPEC_004_GSY_GENERATIVE_SYSTEMS.md) | Done (`GenerativeSystem`, trace lemmas) |
| 3 | Implement **`SPEC_007_PIN`** | [`SPEC_007_PIN_PHASES_AND_INVARIANTS.md`](SPEC_007_PIN_PHASES_AND_INVARIANTS.md) | Done (`Phase`, `generatedBy`) |
| 4 | Implement **`SPEC_005_EXR`** | [`SPEC_005_EXR_EXPLANATORY_REGIMES.md`](SPEC_005_EXR_EXPLANATORY_REGIMES.md) | Done (`ExplanatoryRegime`, `explains`) |
| 5 | Implement **`SPEC_006_ADR`** | [`SPEC_006_ADR_ADMISSIBLE_REDUCTIONS.md`](SPEC_006_ADR_ADMISSIBLE_REDUCTIONS.md) | Done in scope — `Reducible`, `rowExplains`, `Core.Explains`, summit link |
| 6 | Implement **`SPEC_008_PSH`** | [`SPEC_008_PSH_PARADIGM_SHIFTS.md`](SPEC_008_PSH_PARADIGM_SHIFTS.md) | Done (`ParadigmShift` + model lemmas) |
| 7 | Implement **`SPEC_009_DST`** | [`SPEC_009_DST_DIAGONAL_SELF_TRANSCENDENCE.md`](SPEC_009_DST_DIAGONAL_SELF_TRANSCENDENCE.md) | Done (model graft) — `DiagonalNat`, alignment, `ReducerDiagonal` |
| 8 | Implement **`SPEC_010_UEN`** | [`SPEC_010_UEN_UPWARD_EXPLANATORY_NECESSITY.md`](SPEC_010_UEN_UPWARD_EXPLANATORY_NECESSITY.md) | Done (Model C) — `InvariantTower` + soundness + `proves_mono` |
| 9 | Close summit packaging **`SPEC_011_SPK`** | [`SPEC_011_SPK_SUMMIT_PACKAGES.md`](SPEC_011_SPK_SUMMIT_PACKAGES.md) | Done (model scope) — `SummitPackages` + [`docs/THEOREM_INVENTORY.md`](../../../../docs/THEOREM_INVENTORY.md) |
| 10 | Model ladder **`SPEC_012_MDL`** | [`SPEC_012_MDL_MODEL_LADDER.md`](SPEC_012_MDL_MODEL_LADDER.md) | **Complete** — A+B+C + B off-axis; acceptance checked in spec |

## Cross-links

- Normative **EPIC_002** ladder closure: **[`SPEC_034_R2B`](../SPEC_034_R2B_EPIC002_SCOPE_CLOSURE.md)**.
- Dependent sentence/strata wave (**`EPIC_003`–`EPIC_008`**) closed under **[`SPEC_033_K7A`](../SPEC_033_K7A_FORMAL_TRANCHE_CLOSURE.md)** (formal tranche acceptance).
- Cross-epic queue: [`../../../../QUEUE.md`](../../../../QUEUE.md)
- Master roll-up: [`../../../MASTER_STATUS.md`](../../../MASTER_STATUS.md)
- Methodology: [`../../../../NOTES/PROJECT_SEED.md`](../../../../NOTES/PROJECT_SEED.md)
- Layout: [`../../../../docs/004_LEAN_LIBRARY_LAYOUT.md`](../../../../docs/004_LEAN_LIBRARY_LAYOUT.md)

## Completed / dropped

- **2026-04-04:** Normative specs **`SPEC_003_RCT`–`SPEC_012_MDL`** + summit/NXT packaging closed per **`SPEC_034_R2B`**. Future work: inventory *Still research-grade open* (new specs).
