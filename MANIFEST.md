# Artifact manifest — novelty-theory-lean

**Purpose:** Track Lean proof hygiene and known gaps (see [`CODING_PROTOCOLS.md`](CODING_PROTOCOLS.md) — *Proof quality (Lean)*).

| Item | Status |
|------|--------|
| **Toolchain** | `leanprover/lean4:v4.29.0-rc6` ([`docs/003_LEAN_TOOLCHAIN_PIN.md`](docs/003_LEAN_TOOLCHAIN_PIN.md)); Mathlib pin `v4.29.0-rc6` (see [`lakefile.lean`](lakefile.lean), aligned with `ugp-lean`) |
| **`sorry` / `admit`** | None in default library |
| **Axioms** | None beyond Mathlib |
| **Lake layout** | Root module [`NoveltyTheory.lean`](NoveltyTheory.lean) + `lean_lib «NoveltyTheory»` ([`lakefile.lean`](lakefile.lean)); aggregate [`NoveltyTheory/All.lean`](NoveltyTheory/All.lean); shim [`NoveltyTheory/Basic.lean`](NoveltyTheory/Basic.lean) imports `All` |

## Module map (theory tranche)

| Layer | Path |
|--------|------|
| Core | `NoveltyTheory/Core/` — generative systems, phases, regimes, reductions, paradigm shifts, tower, reducers, `Explains`, `Sentence`, `SentenceSyntax`, `SentenceExpressibility`, `SentenceSemantics`, `SentenceRegime`, `Expressibility`, `GeneratorTruth`, `Organization`, `SimulationVersusExplanationAbstract`, `ExplanatoryOrder` |
| Foundation | `NoveltyTheory/Foundation/` — trajectory, conservative-history, `SentenceFacts`, `ProvabilityFacts`, `UpwardNecessity` |
| Core (glue) | `NoveltyTheory/Core/Explains.lean` — `explainsTowerStage`, `regimeExplainsTowerStage` |
| Models | `NoveltyTheory/Models/` — `SignatureTower` (A), `InvariantTower` (C), `SentenceProvability`, `StratifiedSentenceModel`, `StratifiedFinality`, `RetroStructuralTruth`, `ReducerDiagonal` (B), `DupRegimeTower` (B off-axis), `RegimeFamilyObstruction`, `BoundedRegimeDiagonal`, `CausalExplanatoryOrders`, `GenCertPhase`, `SimulationVersusExplanation` |
| Ridge | `NoveltyTheory/Ridge/` — `ShiftWitness`, `DiagonalNat`, `InterfaceAlignment`, `SignatureAdmissibleBundle` |
| Summits | `NoveltyTheory/Summits/` — `CausalExplanatorySeparation`, `SummitPackages`, `OrganizationSummit`, `NecessityStratifiedFinalitySummit`, `StrongRetroCausationSummit`, `GeneratorTruthRidge`, `UnfoldingNecessitySummit`, `SimulationVersusExplanationAbstractSummit` |

**Headline index:** [`docs/THEOREM_INVENTORY.md`](docs/THEOREM_INVENTORY.md)

_Update this file whenever the proof footprint, axioms, or module graph changes._
