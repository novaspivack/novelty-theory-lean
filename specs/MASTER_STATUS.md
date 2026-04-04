# Master status (specs / epics roll-up)

## Active

| Epic / initiative | Folder | Owner / focus | Next queue item |
|-------------------|--------|---------------|-----------------|
| Self-transcending generators (theory) | [`INCOMPLETE/IN-PROCESS/EPIC_002_SELF_TRANSCENDING_GENERATORS/`](INCOMPLETE/IN-PROCESS/EPIC_002_SELF_TRANSCENDING_GENERATORS/) | Core → models A/B/C → ridge → summits I–IV; **`SPEC_003_NXT`** templates (S6–S10); bundled admissible interfaces; explicit obstructions | Research-grade items in [`docs/THEOREM_INVENTORY.md`](../docs/THEOREM_INVENTORY.md) (*Still research-grade open*); keep queue in **`EPIC_002_MASTER_ORCHESTRATION.md`** and [`QUEUE.md`](../QUEUE.md) aligned |
| Expressive strata + sentence universe | [`INCOMPLETE/IN-PROCESS/EPIC_003_EXPRESSIVE_STRATA_AND_SENTENCE_UNIVERSE/`](INCOMPLETE/IN-PROCESS/EPIC_003_EXPRESSIVE_STRATA_AND_SENTENCE_UNIVERSE/) | **`SPEC_013_ES1`**–**`SPEC_016_ES4`**, Lean sentence / **`HoldsAt`** / **`ExpressibleAtHeight`** / **`ProvesAt`** / Model C embed | Extend `ProvesAt` / `HoldsAt` beyond the counterfact ∧-bundle as needed for richer retro sentences |
| Unfolding necessity ridge | [`INCOMPLETE/IN-PROCESS/EPIC_004_UNFOLDING_NECESSITY_RIDGE/`](INCOMPLETE/IN-PROCESS/EPIC_004_UNFOLDING_NECESSITY_RIDGE/) | **`SPEC_017_UEN1`**–**`SPEC_019_UEN3`** | Tighter coupling to regimes beyond **`GenCert`** re-exports when Model A hooks land |
| Abstract organization | [`INCOMPLETE/IN-PROCESS/EPIC_005_ABSTRACT_ORGANIZATION_PRINCIPLES/`](INCOMPLETE/IN-PROCESS/EPIC_005_ABSTRACT_ORGANIZATION_PRINCIPLES/) | **`SPEC_020_AO1`**–**`SPEC_023_AO4`** | Instantiate **`AdequateOrganization`** on less trivial carriers than placeholder records |
| Necessity stratified finality | [`INCOMPLETE/IN-PROCESS/EPIC_006_NECESSITY_STRATIFIED_FINALITY/`](INCOMPLETE/IN-PROCESS/EPIC_006_NECESSITY_STRATIFIED_FINALITY/) | **`SPEC_024_NSF1`**–**`SPEC_026_NSF3`** | Enrich **`TerminalityPredicate`** beyond the toy impossible-rise witness |
| Strong retro causation | [`INCOMPLETE/IN-PROCESS/EPIC_007_STRONG_RETRO_CAUSATION_RIDGE/`](INCOMPLETE/IN-PROCESS/EPIC_007_STRONG_RETRO_CAUSATION_RIDGE/) | **`SPEC_027_RRS1`**–**`SPEC_029_RRS3`** | Add **`historically`** / window constructors to **`Sentence`** when spec tightens |
| Simulation vs explanation (abstract) | [`INCOMPLETE/IN-PROCESS/EPIC_008_SIMULATION_VS_EXPLANATION_ABSTRACT/`](INCOMPLETE/IN-PROCESS/EPIC_008_SIMULATION_VS_EXPLANATION_ABSTRACT/) | **`SPEC_030_SVE1`**–**`SPEC_032_SVE3`** | Keep abstract layer distinct from concrete **`SimulationVersusExplanation`** (S9 inventory) |

## Deferred

| Epic | Reason | Link |
|------|--------|------|
| | | |

## Complete (recent)

| Epic | Completed | Evidence |
|------|-----------|----------|
| Novelty theory Lean bootstrap | Toolchain + library scaffold + **`SPEC_001_ST1`** acceptance | [`EPIC_001_...`](INCOMPLETE/IN-PROCESS/EPIC_001_NOVELTY_THEORY_LEAN/); [`lakefile.lean`](../lakefile.lean) + [`lean-toolchain`](../lean-toolchain); [`.github/workflows/ci.yml`](../.github/workflows/ci.yml); [`MANIFEST.md`](../MANIFEST.md); [`docs/004_LEAN_LIBRARY_LAYOUT.md`](../docs/004_LEAN_LIBRARY_LAYOUT.md) — mathematical phases owned by **EPIC_002** per epic queue |

**Cross-epic ordering + agent contract:** [`../QUEUE.md`](../QUEUE.md)

---

_Update this table when epic status changes; keep epic queues and **`QUEUE.md`** aligned._
