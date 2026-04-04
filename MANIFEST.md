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
| Core | `NoveltyTheory/Core/` — generative systems, phases, regimes, reductions, paradigm shifts, tower, reducers, `Explains`, `Sentence` (incl. **`outputEnumMem`**), `SentenceSyntax`, `NatPhaseTag`, `SentenceExpressibility`, `SentenceSemantics`, `SentenceRegime`, `Expressibility`, `GeneratorTruth`, `Organization` (incl. **`SeparatesStages`**), `OrganizationV2` (**045**), `PhaseSyntaxPoly` (**044**), `SimulationVersusExplanationAbstract`, `ExplanatoryOrder` |
| Foundation | `NoveltyTheory/Foundation/` — trajectory, conservative-history, `SentenceFacts`, `ProvabilityFacts`, `UpwardNecessity`, `StructuralGeneratorSentence`, `StructuralCrownSentence` (**042**), `AscentRegime`, `OutputEnumProvability` (**043**), `PhaseSyntaxPolyFacts` (**044**), `RetroStructuralTruthV2` (**046**), `RichSentenceSyntax` (**038**), `InitialTagProvability` (**039**), `StageModality` (**040**) |
| Core (glue) | `NoveltyTheory/Core/Explains.lean` — `explainsTowerStage`, `regimeExplainsTowerStage` |
| Models | `NoveltyTheory/Models/` — `SignatureTower` (A), `InvariantTower` (C: **`CounterFact`** + inductive **`Pf`**), `SentenceProvability`, `StratifiedSentenceModel`, `StructuralCrownFamily` (**042**), `OutputEnumCrownFamily` (**043**), `PolymorphicPhaseCrown` (**044**), `StratifiedFinality`, `RetroStructuralTruth`, `ReducerDiagonal` (B), `DupRegimeTower` (B off-axis), `RegimeFamilyObstruction`, `BoundedRegimeDiagonal`, `CausalExplanatoryOrders`, `GenCertPhase`, `SimulationVersusExplanation` |
| Ridge | `NoveltyTheory/Ridge/` — `ShiftWitness`, `DiagonalNat`, `InterfaceAlignment`, `SignatureAdmissibleBundle`, `OrganizationHeightObstruction` (**045**), `RetroStructuralGap` (**046**) |
| Summits | `NoveltyTheory/Summits/` — `CausalExplanatorySeparation`, `SummitPackages`, `OrganizationSummit`, `OrganizationFrontierSummit`, `OrganizationCrownSummit` (**045**), `NecessityStratifiedFinalitySummit`, `StrongRetroCausationSummit`, `GeneratorTruthRidge`, `UnfoldingNecessitySummit`, `SimulationVersusExplanationAbstractSummit`, `CrownIteratedAscentSummit`, `StructuralCrownSummit` (**042**), `RetroStructuralCrownSummit` (**046**), `FinalCrownPackage` (**047**) |

**Headline index:** [`docs/THEOREM_INVENTORY.md`](docs/THEOREM_INVENTORY.md)

_Update this file whenever the proof footprint, axioms, or module graph changes._
