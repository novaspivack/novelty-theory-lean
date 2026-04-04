# SPEC_003_RCT — Repository contract (theory tranche)

**Cite as:** **`SPEC_003_RCT`**.

## Status

**Draft** — normative structure for Lean modules and artifacts; implementation tracked on [`EPIC_002_MASTER_ORCHESTRATION.md`](EPIC_002_MASTER_ORCHESTRATION.md).

## Problem

The reference narrative [**`SPEC_002_OCN`**](../THEORY_SEED.md/002_OCN_ORIGINAL_CONCEPT.md) proposes a deep module ladder (**Core / Foundation / Ridge / Summits / Models**). Without a single contract, definitions and theorems can drift, duplicate, or smuggle target conclusions into primitives.

## Requirements

1. **Module graph (normative targets)** — Align `NoveltyTheory/` with this spine (names may be adjusted in implementation if [`MANIFEST.md`](../../../../MANIFEST.md) and this spec are updated in the same change):
   - `NoveltyTheory/Core/` — `GenerativeSystem`, `Phase`, phase invariants, `ExplanatoryRegime`, adequacy, reductions, conservative maps, `ParadigmShift`, tower scaffolding, reducer-enumeration hooks as needed.
   - `NoveltyTheory/Foundation/` — lemmas: adequacy facts, reduction facts, invariant preservation, conservative history, phase separation.
   - `NoveltyTheory/Ridge/` — bridge theorems: shift witnesses, tower construction, diagonal defeat, no uniform reducer, infinite shift tower, generator realization.
   - `NoveltyTheory/Summits/` — headline theorems packaged per **`SPEC_011_SPK`**.
   - `NoveltyTheory/Models/` — concrete constructions per **`SPEC_012_MDL`** (subfolders as needed).
   - Root `NoveltyTheory/All.lean` aggregates imports; `NoveltyTheory/Basic.lean` remains a compatibility shim.

2. **Proof hygiene** — No undocumented `sorry` or project `axiom`; any exception is recorded in [`MANIFEST.md`](../../../../MANIFEST.md) with scope and discharge plan.

3. **Definition discipline** — Primitives must be *minimally committal* and must not bake in summit conclusions (see [**`SPEC_004_GSY`**](SPEC_004_GSY_GENERATIVE_SYSTEMS.md) through [**`SPEC_008_PSH`**](SPEC_008_PSH_PARADIGM_SHIFTS.md)).

4. **Documentation hooks** — When the theory stabilizes, finished developer-facing prose lives under `docs/` (not in this spec). This spec may reference expected doc topics only as an unordered checklist: overview, causal vs explanatory, paradigm shift, self-transcending generators, summits, dependency map.

5. **CI** — `lake build` remains green on the default library; new roots must be wired in `lakefile.lean` if required.

## Acceptance criteria

- [x] `NoveltyTheory/` reflects the **Core / Foundation / Ridge / Summits / Models** spine (expand filenames in [`MANIFEST.md`](../../../../MANIFEST.md) as the graph grows).
- [x] [`MANIFEST.md`](../../../../MANIFEST.md) lists the theory layers and hygiene expectations.
- [x] [`docs/004_LEAN_LIBRARY_LAYOUT.md`](../../../../docs/004_LEAN_LIBRARY_LAYOUT.md) describes the current module graph.
- [x] Child specs **`SPEC_004_GSY`**–**`SPEC_012_MDL`** reference **`SPEC_003_RCT`** under **Status** / **Dependencies** (normative module graph for `NoveltyTheory/`).

## Dependencies

- **`SPEC_001_ST1`** (bootstrap).
- Narrative alignment: **`SPEC_002_OCN`**.

## Out of scope

- Paper PDFs and prose repo layout.
