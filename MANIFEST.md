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
| Core | `NoveltyTheory/Core/` — generative systems, phases, regimes, reductions, paradigm shifts, tower, reducers, `Explains`, `Sentence` (incl. **`outputEnumMem`**), `SentenceSyntax`, `NatPhaseTag`, `SentenceExpressibility`, `SentenceSemantics`, `SentenceRegime`, `SentenceHierarchyV2` (**049**), `StructuralSentenceNaturality` (**055**), `NaturalityAxioms` (**054**), `NaturalAdmissibleClass` (**056**), `NaturalOrganization` (**057**), `MinimalHypotheses` (**060**), `ClosureDichotomy` (**062**), `CanonicalExplanatoryArchitecture` (**061**), `Expressibility`, `GeneratorTruth`, `GeneralizedCarrier` (**048**), `PhaseSyntaxGeneral` (**048**), `ModalTemporalSyntax` (**050**), `Organization` (incl. **`SeparatesStages`**), `OrganizationAbstract` (**051**), `OrganizationV2` (**045**), `PhaseSyntaxPoly` (**044**), `SimulationVersusExplanationAbstract`, `ExplanatoryOrder` |
| Foundation | `NoveltyTheory/Foundation/` — trajectory, conservative-history, `SentenceFacts`, `ProvabilityFacts`, `UpwardNecessity`, `StructuralGeneratorSentence`, `StructuralCrownSentence` (**042**), `StructuralSentenceHierarchyV2` (**049**), `CanonicalityFacts` (**061**), `NaturalityFacts` (**054**), `StructuralSentenceNaturalityFacts` (**055**), `AscentRegime`, `OutputEnumProvability` (**043**), `PhaseGeneralizationFacts` (**048**), `PhaseSyntaxPolyFacts` (**044**), `ModalTemporalFacts` (**050**), `RetroStructuralTruthV2` (**046**), `RichSentenceSyntax` (**038**), `InitialTagProvability` (**039**), `StageModality` (**040**) |
| Core (glue) | `NoveltyTheory/Core/Explains.lean` — `explainsTowerStage`, `regimeExplainsTowerStage` |
| Models | `NoveltyTheory/Models/` — `SignatureTower` (A), `InvariantTower` (C: **`CounterFact`** + inductive **`Pf`**), `SentenceProvability`, `StratifiedSentenceModel`, `StructuralCrownFamily` (**042**), `StructuralHierarchyCrown` (**049**), `OutputEnumCrownFamily` (**043**), `CarrierGeneralCrown` (**048**), `PolymorphicPhaseCrown` (**044**), `ModalCrownWitnesses` (**050**), `ClassTransferExamples` (**052**), `NaturalClassExamples` (**056**), `StratifiedFinality`, `RetroStructuralTruth`, `ReducerDiagonal` (B), `DupRegimeTower` (B off-axis), `RegimeFamilyObstruction`, `BoundedRegimeDiagonal`, `CausalExplanatoryOrders`, `GenCertPhase`, `SimulationVersusExplanation` |
| Ridge | `NoveltyTheory/Ridge/` — `ShiftWitness`, `DiagonalNat`, `InterfaceAlignment`, `SignatureAdmissibleBundle`, `CrownTransfer` (**052**), `OrganizationAbstractObstruction` (**051**), `OrganizationHeightObstruction` (**045**), `RetroStructuralGap` (**046**), `MinimalityCountermodels` (**060**), `ClosureCollapseBoundary` (**062**), `ArchitectureRepresentation` (**061**), `UniversalUpwardNecessity` (**063**), `AdmissibilityNaturality` (**054**), `BroadTransfer` (**056**), `UnboundedOrganization` (**057**), `NaturalAntiClosure` (**058**) |
| Summits | `NoveltyTheory/Summits/` — `CausalExplanatorySeparation`, `SummitPackages`, `OrganizationSummit`, `OrganizationAbstractSummit` (**051**), `OrganizationFrontierSummit`, `OrganizationCrownSummit` (**045**), `NecessityStratifiedFinalitySummit`, `StrongRetroCausationSummit`, `GeneratorTruthRidge`, `ModalTemporalFrontierSummit` (**050**), `UnfoldingNecessitySummit`, `SimulationVersusExplanationAbstractSummit`, `CrownIteratedAscentSummit`, `StructuralCrownSummit` (**042**), `RetroStructuralCrownSummit` (**046**), `FinalCrownPackage` (**047**), `GeneralizedCrownTransferSummit` (**052**), `GeneralizedFinalCrownPackage` (**053**), `BroadTransferSummit` (**056**), `UnboundedOrganizationSummit` (**057**), `NaturalAntiClosureSummit` (**058**), `ClosureDichotomySummit` (**062**), `UniversalUpwardNecessitySummit` (**063**) |

**Headline index:** [`docs/THEOREM_INVENTORY.md`](docs/THEOREM_INVENTORY.md)

_Update this file whenever the proof footprint, axioms, or module graph changes._
