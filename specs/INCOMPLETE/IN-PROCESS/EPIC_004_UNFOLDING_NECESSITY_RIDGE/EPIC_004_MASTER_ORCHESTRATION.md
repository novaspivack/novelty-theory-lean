# EPIC_004 — Unfolding necessity ridge

**Goal:** Sentence-level **generator structural truths**, **upward necessity** (facts true at `h` need resources at `h+1` to license proof), **explanatory order** compatibility, and summit packaging over `natCounter`.

**Source roadmap:** [`../THEORY_SEED.md/004_IMPROVEMENTS.md`](../THEORY_SEED.md/004_IMPROVEMENTS.md).

**Depends on:** **EPIC_003** (sentence universe + strata).

## Theory specs

| Order | Spec | Focus |
|------:|------|--------|
| 1 | [**`SPEC_017_UEN1`**](SPEC_017_UEN1_GENERATOR_STRUCTURAL_TRUTHS.md) | Structural sentences + trace bridge |
| 2 | [**`SPEC_018_UEN2`**](SPEC_018_UEN2_UPWARD_NECESSITY.md) | License lift `h → h+1` for forced facts |
| 3 | [**`SPEC_019_UEN3`**](SPEC_019_UEN3_EXPLANATORY_ORDER.md) | GenCert / regime compatibility |

## Living progress

| Phase | Status | Notes |
|-------|--------|-------|
| Generator structural layer | **Complete** | `Core/GeneratorTruth`, `Core/ExplanatoryOrder` (`phaseTag_eq_of_phaseOf_outputSet_eq`) |
| Ridge + summit re-export | **Complete** | `Summits/GeneratorTruthRidge` (exports singleton / tag `HoldsAt`), `Summits/UnfoldingNecessitySummit` |

## Queue

| # | Task | Spec | Status |
|---|------|------|--------|
| 1 | Structural sentences + holds lemmas | `SPEC_017_UEN1` | **Complete** |
| 2 | Upward necessity packaging | `SPEC_018_UEN2` | **Complete** |
| 3 | Order lemmas | `SPEC_019_UEN3` | **Complete** |

**Closure record:** [`../SPEC_033_K7A_FORMAL_TRANCHE_CLOSURE.md`](../SPEC_033_K7A_FORMAL_TRANCHE_CLOSURE.md).

## Cross-links

- [`../../../MASTER_STATUS.md`](../../../MASTER_STATUS.md)
- [`../../../../QUEUE.md`](../../../../QUEUE.md)
