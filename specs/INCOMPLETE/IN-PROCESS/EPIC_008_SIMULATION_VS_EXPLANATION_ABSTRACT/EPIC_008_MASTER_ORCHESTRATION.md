# EPIC_008 — Simulation vs explanation (abstract)

**Goal:** Abstract **SimulationVersusExplanation** summit: trace-based simulation, non-implication packaging, and summit re-export **parallel** to existing **S9** (`SimulationVersusExplanation.lean`) but **not** duplicating it as obligation.

**Source roadmap:** [`../THEORY_SEED.md/004_IMPROVEMENTS.md`](../THEORY_SEED.md/004_IMPROVEMENTS.md).

**Depends on:** **EPIC_003**; **EPIC_007** optional enrichment.

## Theory specs

| Order | Spec | Focus |
|------:|------|--------|
| 1 | [**`SPEC_030_SVE1`**](SPEC_030_SVE1_TRACE_AND_SIMULATION.md) | Trace-simulation fragment |
| 2 | [**`SPEC_031_SVE2`**](SPEC_031_SVE2_NONIMPLICATIONS.md) | Refuter packaging |
| 3 | [**`SPEC_032_SVE3`**](SPEC_032_SVE3_SUMMIT_PACKAGE.md) | Abstract summit |

## Living progress

| Phase | Status | Notes |
|-------|--------|-------|
| Abstract layer | **Complete** | `Core/SimulationVersusExplanationAbstract`, `Summits/SimulationVersusExplanationAbstractSummit` |
| Concrete S9 | **Complete** (parallel) | `Models/SimulationVersusExplanation` — not duplicated as obligation per `SPEC_030` |

## Queue

| # | Task | Spec | Status |
|---|------|------|--------|
| 1–3 | Abstract defs + bridge to `trace` / reach-set coupling | `SPEC_030_SVE1`–`SPEC_032_SVE3` | **Complete** |

**Closure record:** [`../SPEC_033_K7A_FORMAL_TRANCHE_CLOSURE.md`](../SPEC_033_K7A_FORMAL_TRANCHE_CLOSURE.md).

## Cross-links

- [`../../../MASTER_STATUS.md`](../../../MASTER_STATUS.md)
