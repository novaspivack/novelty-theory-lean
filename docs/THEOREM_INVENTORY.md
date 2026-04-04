# Theorem inventory (novelty-theory-lean)

**Purpose:** Catalog of **public `theorem` / `lemma`** declarations under `NoveltyTheory/` (excluding Mathlib). Use this as the theorem index for papers and dependency maps. Proof hygiene defaults: [`MANIFEST.md`](../MANIFEST.md).

**Verification (repo sync):** On **2026-04-04**, `NoveltyTheory/` contains **approximately 378** top-level `theorem` declarations (line-count style audit under `NoveltyTheory/`). `lake build` succeeds (825 jobs). Every `\leanref{NoveltyTheory.…}` in [`paper/Final Draft/novelty_theory_generalized_crown.tex`](../paper/Final%20Draft/novelty_theory_generalized_crown.tex) (**94** distinct qualified paths) resolves to an existing `.lean` file and declaration (check: [`scripts/verify_paper_leanrefs.py`](../scripts/verify_paper_leanrefs.py)). This markdown file remains a **curated** catalog—not a line-for-line dump of all 364 theorems.

**Convention:** Names are given as in Lean (including namespaces where disambiguating, e.g. `CounterFact.geOutput_inj`).

**See also:** [007 — Library positioning](007_LIBRARY_POSITIONING_ASSESSMENT.md) (how this catalog reframes Wave 2 and crown targets).

---

## Spine (headline packaging)

The following subsume many rows below via `Summits.SummitPackages` and peers; they match **`SPEC_011_SPK`** / NXT template naming.

| Layer | Informal | Lean anchors | Primary module |
|-------|----------|--------------|----------------|
| Summit I–IV + NXT hooks | Causal/explanatory separation, paradigm tower, no final `regimeUpto`, Model C gap, S6–S10 templates, retro revelation, **etc.** | `causal_generation_not_uniform_explanation`, `infinite_paradigm_tower`, `noFinalInternalTheory_signature_family`, `upwardExplanatoryNecessity_counterfact`, `every_stage_admits_future_paradigmShift`, `explanatory_incompleteness_fixed_signature_height`, `summit_finite_signature_not_total_ladder`, `summit_diagonal_all_bundled_admissible`, `summit_bounded_regime_family_diagonal`, **etc.** | `Summits.SummitPackages` |
| Sentence + Model C bridge | Strata, soundness, non-collapse | `ProvesAt`, `proves_sentence_sound`, `mentionBound_le_of_proves`, `exists_sentence_*` (Stratified), `expressibleAt_regimeUpto_iff` | `Core.*Sentence*`, `Models.SentenceProvability`, `Foundation.*` |
| Obstructions | Trivial interface; empty regime | `trivialInterface_rows_claim_everything`, `not_paradigmShiftSteps_empty_tower`, `summit_singletonWithin_not_entails_paradigm_steps` | `Ridge.SignatureAdmissibleBundle`, `Models.RegimeFamilyObstruction`, `Summits` |

---

## `NoveltyTheory/` — complete theorem list

### Root

`NoveltyTheory.Basic` is a compatibility shim that imports `NoveltyTheory.All` (no separate theorem exports).

### Core

| Declaration | Module | Role |
|-------------|--------|------|
| `GenerativeSystem.step_succ` | `Core.GenerativeSystem` | `step (n+1) = τ (step n)` |
| `GenerativeSystem.trace_succ` | `Core.GenerativeSystem` | Trace recursion |
| `GenerativeSystem.mem_reachSet_iff` | `Core.GenerativeSystem` | `reachSet` characterization |
| `GenerativeSystem.reachSet_eq_of_traceCoupled` | `Core.GenerativeSystem` | Trace coupling ⇒ equal `reachSet` |
| `GenerativeSystem.observationalEquivalence_of_traceCoupled` | `Core.GenerativeSystem` | Trace coupling ⇒ observational equivalence |
| `NatPhaseTag.mem_sing_iff` | `Core.NatPhaseTag` | Membership in singleton tag |
| `NatPhaseTag.mem_initial_iff` | `Core.NatPhaseTag` | Membership in initial-segment tag |
| `GeneratorTruth.isGeneratorStructural_traceEq` | `Core.GeneratorTruth` | `traceEq n n` is structural |
| `GeneratorTruth.holdsAt_natCounter_traceEq_self` | `Core.GeneratorTruth` | `HoldsAt natCounter (traceEq n n)` |
| `GeneratorTruth.holdsAt_natCounter_phaseMem_singleton` | `Core.GeneratorTruth` | Singleton phase atom holds on `natCounter` |
| `GeneratorTruth.holdsAt_natCounter_natPhaseTagMem_sing` | `Core.GeneratorTruth` | Singular tag atom holds on `natCounter` |
| `SentenceExpressibility.expressibleAtHeight_iff` | `Core.SentenceExpressibility` | Height strata ↔ `mentionBound` |
| `SentenceExpressibility.mentionBound_not` | `Core.SentenceExpressibility` | `mentionBound` under negation |
| `SentenceExpressibility.mentionBound_histSeq` | `Core.SentenceExpressibility` | `mentionBound` for `histSeq` |
| `SentenceExpressibility.mentionBound_finConj` | `Core.SentenceExpressibility` | `mentionBound` for `finConj` |
| `SentenceExpressibility.mentionBound_natPhaseTagMem` | `Core.SentenceExpressibility` | `mentionBound` for phase tags |
| `SentenceRegime.expressibleAt_regimeUpto_iff` | `Core.SentenceRegime` | Expressibility vs `regimeUpto` |
| `SentenceRegime.expressibleAtHeight_iff_expressible_regime` | `Core.SentenceRegime` | Height vs regime formulation |
| `ExplanatoryOrder.phaseTag_eq_of_phaseOf_outputSet_eq` | `Core.ExplanatoryOrder` | Equal supports ⇒ equal `phaseTag` |
| `ExplanatoryOrder.orders_strict_diverge` | `Core.ExplanatoryOrder` | Causal vs explanatory strict orders differ |
| `ExplanatoryOrder.causal_step_lowers_summed_phase_tag` | `Core.ExplanatoryOrder` | Tag can drop under causal step |
| `SimulationVersusExplanationAbstract.simulatesTracePrefix_zero` | `Core.SimulationVersusExplanationAbstract` | Vacuous prefix simulation at `0` |
| `SimulationVersusExplanationAbstract.observationalEquiv_altParity_pair` | `Core.SimulationVersusExplanationAbstract` | Parity pair: observational equivalence |
| `SimulationVersusExplanationAbstract.not_traceCoupled_altParity_counterexample` | `Core.SimulationVersusExplanationAbstract` | Same observations, not trace coupled |
| `SimulationVersusExplanationAbstract.observational_equiv_not_implies_trace_coupled` | `Core.SimulationVersusExplanationAbstract` | Global non-implication (types over `GenerativeSystem`) |
| `SimulationVersusExplanationAbstract.simulatesTracePrefix_self` | `Core.SimulationVersusExplanationAbstract` | Self-prefix simulation |
| `AdequateOrganization.not_separatesStages_of_const` | `Core.Organization` | Constant `stage` ⇒ ¬ `SeparatesStages` |
| `adequateNatParity_separates` | `Core.Organization` | Parity labeling separates stages |
| `totalFutureOnNat_separates` | `Core.Organization` | Identity stage separates on `ℕ` |

### Foundation

| Declaration | Module | Role |
|-------------|--------|------|
| `Trajectory.trace_mem_reachSet` | `Foundation.Trajectory` | Trace values lie in `reachSet` |
| `ConservativeHistory.conservativeOver_tail_of_conservativeOver` | `Foundation.ConservativeHistory` | Conservativity restricted to tail |
| `SentenceFacts.list_fold_trace_pair_bound_aux` | `Foundation.SentenceFacts` | Aux for list-fold `mentionBound` on pairs |
| `SentenceFacts.list_fold_trace_pair_bound` | `Foundation.SentenceFacts` | `histSeq` mention bound from list |
| `SentenceFacts.list_fold_mention_bound_aux` | `Foundation.SentenceFacts` | Aux for `finConj` fold |
| `SentenceFacts.list_fold_mention_bound` | `Foundation.SentenceFacts` | `finConj` mention bound |
| `SentenceFacts.expressible_mono` | `Foundation.SentenceFacts` | Monotonicity of `ExpressibleAtHeight` |
| `SentenceFacts.mentionBound_le_of_proves` | `Foundation.SentenceFacts` | `ProvesAt m φ ⇒ mentionBound φ ≤ m` |
| `SentenceFacts.proves_implies_expressible` | `Foundation.SentenceFacts` | Provable ⇒ expressible at height |
| `SentenceFacts.proves_implies_expressible_regime` | `Foundation.SentenceFacts` | Provable ⇒ `ExpressibleAt (regimeUpto m)` |
| `ProvabilityFacts.sentenceOfCounterFact_ge` | `Foundation.ProvabilityFacts` | `simp` embed ge |
| `ProvabilityFacts.sentenceOfCounterFact_trace` | `Foundation.ProvabilityFacts` | `simp` embed trace |
| `ProvabilityFacts.sentenceOfCounterFact_phase` | `Foundation.ProvabilityFacts` | `simp` embed phase |
| `ProvabilityFacts.sentenceOfCounterFact_holds_iff` | `Foundation.ProvabilityFacts` | `HoldsAt` ↔ `factHolds` for embed |
| `ProvabilityFacts.proves_sentence_sound` | `Foundation.ProvabilityFacts` | `ProvesAt` ⇒ `HoldsAt natCounter` |
| `UpwardNecessity.upward_necessity_geOutput` | `Foundation.UpwardNecessity` | Sentence-level strict gap for `geOutput` |
| `UpwardNecessity.upward_necessity_traceEq_diag` | `Foundation.UpwardNecessity` | Sentence-level strict gap for diagonal `traceEq` |
| `StructuralGeneratorSentence.isGeneratorStructural_implies` | `Foundation.StructuralGeneratorSentence` | `SPEC_017` fragment ⊆ structural class |
| `StructuralGeneratorSentence.geOutput_not_isGeneratorStructural` | `Foundation.StructuralGeneratorSentence` | Output atoms ≠ trace-only ridge |
| `StructuralGeneratorSentence.natPhaseTagMem_initial_not_structural` | `Foundation.StructuralGeneratorSentence` | `initial` tag outside structural fragment |
| `StructuralGeneratorSentence.not_structural_finConj_nil` | `Foundation.StructuralGeneratorSentence` | Empty `finConj` excluded |
| `StructuralGeneratorSentence.mention_bound_neither_implies_structural_nor_nonstructural` | `Foundation.StructuralGeneratorSentence` | Anti-collapse vs `mentionBound` |
| `StructuralCrownSentence.isStructural_structuralCrownWitness` | `Foundation.StructuralCrownSentence` | `SPEC_042_CG1` — witness is `IsStructuralGeneratorSentence` |
| `StructuralCrownSentence.structuralCrownWitness_ne_geOutput` | `Foundation.StructuralCrownSentence` | Witness ≠ `geOutput n` |
| `StructuralCrownSentence.structuralCrownWitness_not_isGeneratorStructural` | `Foundation.StructuralCrownSentence` | Witness ∉ `IsGeneratorStructural` |
| `StructuralCrownSentence.mentionBound_structuralCrownWitness` | `Foundation.StructuralCrownSentence` | `mentionBound` of witness |
| `StructuralCrownSentence.structural_crown_not_mentionBound_only` | `Foundation.StructuralCrownSentence` | Same stratum as `geOutput n`, distinct formula |
| `StructuralCrownSentence.structural_crown_not_traceEq_ridge_only` | `Foundation.StructuralCrownSentence` | Structural but not trace-ridge atom |
| `AscentRegime.provesInRegime_iff` | `Foundation.AscentRegime` | \(R_m\) = `ProvesAt m` |
| `AscentRegime.provesInRegime_mono` | `Foundation.AscentRegime` | Regime monotonicity |
| `AscentRegime.provesInRegime_sound` | `Foundation.AscentRegime` | `ProvesInRegime` ⇒ `HoldsAt natCounter` |
| `RichSentenceSyntax.holdsAt_outputEnumMem_iff` | `Foundation.RichSentenceSyntax` | `SPEC_038` — `HoldsAt` for list enum |
| `RichSentenceSyntax.holdsAt_outputEnumMem_singleton_iff` | `Foundation.RichSentenceSyntax` | Singleton list ↔ `phaseMem` atom |
| `RichSentenceSyntax.not_provesAt_outputEnumMem` | `Foundation.RichSentenceSyntax` | `outputEnumMem` unprovable (v1 rules) |
| `InitialTagProvability.initial_endpoint` | `Foundation.InitialTagProvability` | `SPEC_039` — `initial` tag provable at `K+1` |
| `InitialTagProvability.proves_initial_sound` | `Foundation.InitialTagProvability` | Soundness export |
| `StageModality.stageNecessary_eq` | `Foundation.StageModality` | `SPEC_040` — modal ↔ `ProvesAt` succ |
| `StageModality.stageNecessary_geOutput` | `Foundation.StageModality` | Necessity instance for `geOutput` |

### Models

| Declaration | Module | Role |
|-------------|--------|------|
| `InvariantTower.CounterFact.geOutput_inj` | `Models.InvariantTower` | Injectivity of `geOutput` constructor |
| `InvariantTower.CounterFact.traceEq_inj` | `Models.InvariantTower` | Injectivity of `traceEq` |
| `InvariantTower.CounterFact.phaseSingletonMem_inj` | `Models.InvariantTower` | Injectivity of `phaseSingletonMem` |
| `InvariantTower.proves_succ_ge` | `Models.InvariantTower` | One-step proof of `geOutput n` |
| `InvariantTower.proves_succ_trace` | `Models.InvariantTower` | One-step proof of diagonal trace fact |
| `InvariantTower.proves_succ_phase` | `Models.InvariantTower` | One-step proof of phase singleton mem |
| `InvariantTower.not_proves_self` | `Models.InvariantTower` | Strict gap: not at own depth |
| `InvariantTower.not_proves_trace_diag` | `Models.InvariantTower` | Strict gap: trace diagonal |
| `InvariantTower.not_proves_phase` | `Models.InvariantTower` | Strict gap: phase mem |
| `InvariantTower.upward_derivability_gap` | `Models.InvariantTower` | Bundled gap for `geOutput` |
| `InvariantTower.upward_trace_derivability_gap` | `Models.InvariantTower` | Bundled gap for trace |
| `InvariantTower.upward_phase_derivability_gap` | `Models.InvariantTower` | Bundled gap for phase |
| `InvariantTower.retro_derivability` | `Models.InvariantTower` | Cross-depth for `geOutput` |
| `InvariantTower.retro_derivability_trace` | `Models.InvariantTower` | Cross-depth for trace |
| `InvariantTower.retro_derivability_phase` | `Models.InvariantTower` | Cross-depth for phase |
| `InvariantTower.proves_mono` | `Models.InvariantTower` | Monotonicity of `provesAtDepth` |
| `InvariantTower.provesAtDepth_le_factIndexBound` | `Models.InvariantTower` | Index bound from proof |
| `InvariantTower.provesAtDepth_maxIndex_le` | `Models.InvariantTower` | Max trace index from proof |
| `InvariantTower.factHolds_geOutput` | `Models.InvariantTower` | Semantic content of `geOutput` |
| `InvariantTower.factHolds_diag_trace` | `Models.InvariantTower` | Semantic content of diagonal trace |
| `InvariantTower.factHolds_phaseSingletonMem` | `Models.InvariantTower` | Semantic content of phase singleton |
| `InvariantTower.proves_sound` | `Models.InvariantTower` | Soundness: `provesAtDepth` ⇒ `factHolds` |
| `InvariantTower.retro_revelation_derivability_package` | `Models.InvariantTower` | Semantic + proof separation package |
| `InvariantTower.retro_revelation_sound` | `Models.InvariantTower` | Retro soundness slice |
| `InvariantTower.no_finite_depth_proves_all` | `Models.InvariantTower` | No finite depth proves all facts |
| `SignatureTower.phaseSingleton_output` | `Models.SignatureTower` | Output set of `phaseSingleton` |
| `SignatureTower.natCounter_trace` | `Models.SignatureTower` | Identity trace for `natCounter` |
| `SignatureTower.natCounter_generated` | `Models.SignatureTower` | Phases generated by `natCounter` |
| `SignatureTower.natCounter_mem_reachSet` | `Models.SignatureTower` | Reachability on `ℕ` |
| `SignatureTower.natCounter_reachSet_univ` | `Models.SignatureTower` | Full `reachSet` |
| `SignatureTower.natCounterProd_step` | `Models.SignatureTower` | Product model step |
| `SignatureTower.natCounterProd_trace_eq` | `Models.SignatureTower` | Product trace |
| `SignatureTower.natCounterProd_trace` | `Models.SignatureTower` | Trace equality vs `natCounter` |
| `SignatureTower.traceCoupled_natCounter_prod` | `Models.SignatureTower` | Trace coupling with product |
| `SignatureTower.observationalEquiv_natCounter_prod` | `Models.SignatureTower` | Observational equivalence with product |
| `SignatureTower.regimeUpto_adequate_iff` | `Models.SignatureTower` | Adequacy in truncated regime |
| `SignatureTower.regimeUpto_explains_singleton` | `Models.SignatureTower` | Regime explains low singletons |
| `SignatureTower.not_explains_regime_singleton_succ` | `Models.SignatureTower` | Fails on next singleton |
| `SignatureTower.not_explainsEntireSingletonLadder_regimeUpto` | `Models.SignatureTower` | S10: not entire ladder |
| `SignatureTower.mem_history_range` | `Models.SignatureTower` | History membership |
| `SignatureTower.conservative_castSucc` | `Models.SignatureTower` | Conservativity along cast |
| `SignatureTower.conservativeOver_castSucc` | `Models.SignatureTower` | `ConservativeOver` along cast |
| `SignatureTower.adequateWitness_succ` | `Models.SignatureTower` | Witness adequacy at successor |
| `SignatureTower.later_explains_witness` | `Models.SignatureTower` | Later regime explains witness |
| `SignatureTower.witness_mem_tail` | `Models.SignatureTower` | Witness in extended history |
| `SignatureTower.not_reducible_succ` | `Models.SignatureTower` | Non-reducibility step |
| `SignatureTower.paradigmShift_succ` | `Models.SignatureTower` | `ParadigmShift` between heights |
| `SignatureTower.tower_phase_not_explained_by_fixed_regime` | `Models.SignatureTower` | Fixed height incompleteness |
| `SignatureTower.finite_signature_cannot_organize_full_ladder` | `Models.SignatureTower` | Organization template |
| `SignatureTower.exists_future_paradigmShift` | `Models.SignatureTower` | S6 existence |
| `SignatureTower.canonicalTower_paradigmSteps` | `Models.SignatureTower` | Canonical tower shifts |
| `SignatureTower.canonicalTower_generated` | `Models.SignatureTower` | Canonical tower generation |
| `BoundedRegimeDiagonal.not_explains_singleton_succ_of_within` | `Models.BoundedRegimeDiagonal` | Within-bound ⇒ not next singleton |
| `BoundedRegimeDiagonal.family_diagonal_of_singletonWithin` | `Models.BoundedRegimeDiagonal` | Family diagonal from bound |
| `BoundedRegimeDiagonal.regimeUpto_adequate_singletonWithin` | `Models.BoundedRegimeDiagonal` | `regimeUpto` satisfies within |
| `BoundedRegimeDiagonal.regimeFamily_singletonWithin_upto` | `Models.BoundedRegimeDiagonal` | Family instance for ladder |
| `ReducerDiagonal.enum_diagonal_step` | `Models.ReducerDiagonal` | Enumerated diagonal step |
| `ReducerDiagonal.diagonalTower_generatedThroughout` | `Models.ReducerDiagonal` | Generation for diagonal tower |
| `ReducerDiagonal.diagonalTower_paradigmShiftSteps_of_agrees` | `Models.ReducerDiagonal` | Paradigm steps from enumeration |
| `ReducerDiagonal.canonicalEnum_agrees` | `Models.ReducerDiagonal` | Canonical enum agrees |
| `ReducerDiagonal.singletonWithin_of_enum_agrees` | `Models.ReducerDiagonal` | Singleton-within from agreement |
| `ReducerDiagonal.modelB_enumerated_diagonal_package` | `Models.ReducerDiagonal` | Model B package |
| `DupRegimeTower.dupRegime_ne_regimeUpto` | `Models.DupRegimeTower` | Dup ≠ canonical |
| `DupRegimeTower.not_enum_agrees_dup` | `Models.DupRegimeTower` | Enumeration disagreement |
| `DupRegimeTower.dup_singletonWithin` | `Models.DupRegimeTower` | Within bound at dup |
| `DupRegimeTower.dup_regime_family_singletonWithin` | `Models.DupRegimeTower` | Family bound |
| `DupRegimeTower.not_explains_dup_singleton_succ` | `Models.DupRegimeTower` | Diagonal at dup |
| `DupRegimeTower.dup_conservative` | `Models.DupRegimeTower` | Conservativity fragment |
| `DupRegimeTower.dup_adequate_witness` | `Models.DupRegimeTower` | Witness adequacy |
| `DupRegimeTower.dup_later_explains` | `Models.DupRegimeTower` | Later explains stage |
| `DupRegimeTower.not_reducible_dup_succ` | `Models.DupRegimeTower` | Non-reducibility |
| `DupRegimeTower.paradigmShift_dup_succ` | `Models.DupRegimeTower` | Paradigm shift |
| `DupRegimeTower.dupDiagonalTower_paradigmSteps` | `Models.DupRegimeTower` | Dup tower shifts |
| `DupRegimeTower.dupDiagonalTower_generated` | `Models.DupRegimeTower` | Dup tower generation |
| `DupRegimeTower.dup_diagonalTower_eq` | `Models.DupRegimeTower` | Tower equality |
| `DupRegimeTower.modelB_dup_singleton_bound_package` | `Models.DupRegimeTower` | Bundled Model B off-axis |
| `RegimeFamilyObstruction.emptyRegime_singletonWithin` | `Models.RegimeFamilyObstruction` | Empty regime meets bound |
| `RegimeFamilyObstruction.emptyRegime_family_singletonWithin` | `Models.RegimeFamilyObstruction` | Family `SingletonWithin` |
| `RegimeFamilyObstruction.not_explains_emptyRegime` | `Models.RegimeFamilyObstruction` | Explains nothing |
| `RegimeFamilyObstruction.not_paradigmShift_empty_step` | `Models.RegimeFamilyObstruction` | No shift on empty |
| `RegimeFamilyObstruction.not_paradigmShiftSteps_empty_tower` | `Models.RegimeFamilyObstruction` | No infinite shift chain |
| `CausalExplanatoryOrders.causal_explanatory_orders_diverge` | `Models.CausalExplanatoryOrders` | Order divergence witness |
| `GenCertPhase.phaseOf_output` | `Models.GenCertPhase` | `phaseOf` singleton support |
| `GenCertPhase.causal_strict_but_tag_decreases` | `Models.GenCertPhase` | Causal strict vs tag |
| `SimulationVersusExplanation.observational_eq_but_irreducible` | `Models.SimulationVersusExplanation` | Obs equiv but not reducible |
| `SimulationVersusExplanation.trace_coupled_prod_not_reducible` | `Models.SimulationVersusExplanation` | Trace-coupled + irreducible |
| `SentenceProvability.ProvesAt_geOutput_iff` | `Models.SentenceProvability` | `ProvesAt` ↔ depth for `geOutput` |
| `SentenceProvability.proves_mono_sentence` | `Models.SentenceProvability` | Monotonicity of `ProvesAt` |
| `SentenceProvability.provesAt_initial_endpoint` | `Models.SentenceProvability` | `initial`-tag endpoint witness |
| `StratifiedSentenceModel.exists_sentence_expressible_succ_not_at` | `Models.StratifiedSentenceModel` | Expressibility gap witness |
| `StratifiedSentenceModel.exists_sentence_provable_succ_not_at` | `Models.StratifiedSentenceModel` | `geOutput` provability gap |
| `StratifiedSentenceModel.exists_sentence_trace_provable_succ_not_at` | `Models.StratifiedSentenceModel` | Trace provability gap |
| `StratifiedSentenceModel.exists_sentence_phase_provable_succ_not_at` | `Models.StratifiedSentenceModel` | Phase provability gap |
| `StratifiedSentenceModel.exists_histSeq_nonempty_provable_succ_not_at` | `Models.StratifiedSentenceModel` | `histSeq` gap |
| `StratifiedSentenceModel.universal_no_sentence_proof_at_own_bound` | `Models.StratifiedSentenceModel` | Universal proof-height obstruction |
| `StructuralCrownFamily.structuralCrownWitness_proves_succ_not_at` | `Models.StructuralCrownFamily` | `SPEC_042_CG1` — strict `ProvesAt` gap |
| `StructuralCrownFamily.holdsAt_natCounter_structuralCrownWitness` | `Models.StructuralCrownFamily` | `HoldsAt natCounter` for witness |
| `StructuralCrownFamily.exists_structural_sentence_provable_succ_not_at` | `Models.StructuralCrownFamily` | Exists structural `φ` with gap at `n` |
| `StratifiedFinality.natCounter_futureDefeat` | `Models.StratifiedFinality` | Unbounded trace |
| `StratifiedFinality.terminality_eq_zero` | `Models.StratifiedFinality` | Satisfiable terminality |
| `StratifiedFinality.terminality_impossible_strict_output_rise` | `Models.StratifiedFinality` | Terminality vs strict rise |
| `RetroStructuralTruth.isRetroStructural_traceEq` | `Models.RetroStructuralTruth` | Retro classification |
| `RetroStructuralTruth.isRetroStructural_histSeq` | `Models.RetroStructuralTruth` | Retro `histSeq` |
| `RetroStructuralTruth.isRetroStructural_geOutput` | `Models.RetroStructuralTruth` | Retro `geOutput` |
| `RetroStructuralTruth.isRetroStructural_and` | `Models.RetroStructuralTruth` | Retro closure `and` |
| `RetroStructuralTruth.isRetroStructural_or` | `Models.RetroStructuralTruth` | Retro closure `or` |
| `RetroStructuralTruth.isRetroStructural_finConj` | `Models.RetroStructuralTruth` | Retro closure `finConj` |
| `RetroStructuralTruth.exists_retro_sentence_expressible_gap` | `Models.RetroStructuralTruth` | Retro expressibility gap |

### Ridge

| Declaration | Module | Role |
|-------------|--------|------|
| `DiagonalNat.not_explains_stage_singleton_succ_of_rowSound` | `Ridge.DiagonalNat` | Row-sound ⇒ not explain next |
| `DiagonalNat.diagonal_stage_defeats_row` | `Ridge.DiagonalNat` | Diagonal at row |
| `InterfaceAlignment.rowSound_of_reflects` | `Ridge.InterfaceAlignment` | Reflects signature ⇒ sound |
| `InterfaceAlignment.reflects_of_agrees` | `Ridge.InterfaceAlignment` | Agreement ⇒ reflects |
| `InterfaceAlignment.rowSound_of_agrees` | `Ridge.InterfaceAlignment` | Agreement ⇒ sound |
| `InterfaceAlignment.not_rowExplains_succ_of_agrees` | `Ridge.InterfaceAlignment` | Agreement ⇒ diagonal |
| `SignatureAdmissibleBundle.diagonal_every_admissible` | `Ridge.SignatureAdmissibleBundle` | Bundled diagonal |
| `SignatureAdmissibleBundle.trivialInterface_rows_claim_everything` | `Ridge.SignatureAdmissibleBundle` | Trivial obstruction |
| `ShiftWitness.signatureParadigmShift` | `Ridge.ShiftWitness` | Bridge `paradigmShift_succ` to generic `ParadigmShift` |

### Summits

| Declaration | Module | Role |
|-------------|--------|------|
| `CausalExplanatorySeparation.model_causal_paradigm_tower` | `Summits.CausalExplanatorySeparation` | Model A pack |
| `SummitPackages.causal_generation_not_uniform_explanation` | `Summits.SummitPackages` | Summit I |
| `SummitPackages.infinite_paradigm_tower` | `Summits.SummitPackages` | Summit II |
| `SummitPackages.noFinalInternalTheory_signature_family` | `Summits.SummitPackages` | Summit III |
| `SummitPackages.upwardExplanatoryNecessity_counterfact` | `Summits.SummitPackages` | Summit IV |
| `SummitPackages.retroactive_derivability_crossDepth` | `Summits.SummitPackages` | S7 template |
| `SummitPackages.observational_equivalence_but_not_reducible` | `Summits.SummitPackages` | S9 template |
| `SummitPackages.trace_coupled_distinct_carrier_not_reducible` | `Summits.SummitPackages` | S9 sharpened |
| `SummitPackages.every_stage_admits_future_paradigmShift` | `Summits.SummitPackages` | S6 |
| `SummitPackages.explanatory_incompleteness_fixed_signature_height` | `Summits.SummitPackages` | S8 |
| `SummitPackages.summit_nontrivial_modelB_singleton_family` | `Summits.SummitPackages` | Model B off-axis summit |
| `SummitPackages.no_uniform_row_at_next_stage` | `Summits.SummitPackages` | Hypothesized diagonal |
| `SummitPackages.summit_diagonal_all_bundled_admissible` | `Summits.SummitPackages` | Bundled diagonal summit |
| `SummitPackages.summit_singletonWithin_not_entails_paradigm_steps` | `Summits.SummitPackages` | SingletonWithin does not imply paradigm chain |
| `SummitPackages.summit_finite_signature_not_total_ladder` | `Summits.SummitPackages` | S10 |
| `SummitPackages.summit_retro_revelation_derivability` | `Summits.SummitPackages` | Retro revelation bundle |
| `SummitPackages.summit_retro_revelation_sound` | `Summits.SummitPackages` | Retro revelation sound |
| `SummitPackages.canonical_regime_explains_each_stage` | `Summits.SummitPackages` | Canonical explains stage |
| `SummitPackages.summit_modelB_enumerated_diagonal` | `Summits.SummitPackages` | Enumerated Model B |
| `SummitPackages.causal_explanatory_order_divergence` | `Summits.SummitPackages` | Order packaging |
| `SummitPackages.summit_bounded_regime_family_diagonal` | `Summits.SummitPackages` | Bounded family diagonal |
| `SummitPackages.gen_cert_causal_strict_but_lower_phase_tag` | `Summits.SummitPackages` | GenCert tag packaging |
| `OrganizationSummit.no_finite_singleton_bound_explains_next` | `Summits.OrganizationSummit` | Org + diagonal |
| `OrganizationSummit.universal_sentence_proof_height_gap` | `Summits.OrganizationSummit` | `ProvesAt` height gap |
| `NecessityStratifiedFinalitySummit.self_certification_obstruction` | `Summits.NecessityStratifiedFinalitySummit` | Finite-depth obstruction |
| `NecessityStratifiedFinalitySummit.nat_counter_future_defeat` | `Summits.NecessityStratifiedFinalitySummit` | Future defeat export |
| `NecessityStratifiedFinalitySummit.terminality_natCounter_eq_zero` | `Summits.NecessityStratifiedFinalitySummit` | Terminality export |
| `StrongRetroCausationSummit.retro_strict_expressibility` | `Summits.StrongRetroCausationSummit` | Retro summit |
| `UnfoldingNecessitySummit.upward_necessity_sentence` | `Summits.UnfoldingNecessitySummit` | Sentence upward necessity |
| `UnfoldingNecessitySummit.exists_strict_provable_gap` | `Summits.UnfoldingNecessitySummit` | Strict gap packaging |
| `CrownIteratedAscentSummit.crown_strict_ascent_at` | `Summits.CrownIteratedAscentSummit` | Crown ascent at `n` (`SPEC_037_CR1`) |
| `CrownIteratedAscentSummit.crown_strict_ascent_sentence_family` | `Summits.CrownIteratedAscentSummit` | ∃ generator, ∃ Φ strict ascent |
| `CrownIteratedAscentSummit.crown_ascent_refines_existential_provable_gap` | `Summits.CrownIteratedAscentSummit` | Structural witness refines bare gap |
| `CrownIteratedAscentSummit.geOutput_crown_not_traceEq_ridge_only` | `Summits.CrownIteratedAscentSummit` | Anti-collapse vs `IsGeneratorStructural` |
| `StructuralCrownSummit.structural_sentence_strict_ascent_at` | `Summits.StructuralCrownSummit` | `SPEC_042_CG1` — strict ascent at `n` |
| `StructuralCrownSummit.structural_sentence_crown_family` | `Summits.StructuralCrownSummit` | `∃G ∃Φ` strict structural ascent |
| `StructuralCrownSummit.structural_crown_refines_bare_provable_gap` | `Summits.StructuralCrownSummit` | Refines naked existential gap |
| `StructuralCrownSummit.structural_crown_not_traceEq_ridge_only` | `Summits.StructuralCrownSummit` | Summit export — not trace-ridge only |
| `StructuralCrownSummit.structural_crown_not_mentionBound_only` | `Summits.StructuralCrownSummit` | Summit export — stratum non-uniqueness |
| `StructuralCrownSummit.exists_structural_sentence_provable_succ_not_at` | `Summits.StructuralCrownSummit` | Exists structural gap (packaging) |
| `SummitPackages.summit_crown_strict_ascent_sentence_family` | `Summits.SummitPackages` | Crown re-export |
| `OrganizationFrontierSummit.summit_adequateNatParity_separates` | `Summits.OrganizationFrontierSummit` | `SPEC_041` packaging |
| `OrganizationFrontierSummit.summit_totalFutureOnNat_separates` | `Summits.OrganizationFrontierSummit` | Total-future org separates |
| `OrganizationFrontierSummit.summit_constant_stage_not_separated` | `Summits.OrganizationFrontierSummit` | Constant-label obstruction |
| `OrganizationFrontierSummit.summit_diagonal_compatible_family` | `Summits.OrganizationFrontierSummit` | Singleton-family diagonal re-export |
| `OutputEnumProvability.provesAt_outputEnumMem_sound` | `Foundation.OutputEnumProvability` | `SPEC_043` — soundness export for enum layer |
| `OutputEnumProvability.provesAt_outputEnumMem_mono` | `Foundation.OutputEnumProvability` | `SPEC_043` — monotone depth for `outputEnumMem` |
| `OutputEnumCrownFamily.outputEnumCrownWitness_proves_succ_not_at` | `Models.OutputEnumCrownFamily` | `SPEC_043` — enum crown strict gap |
| `OutputEnumCrownFamily.outputEnumMem_crown_family` | `Models.OutputEnumCrownFamily` | `SPEC_043` — `∃G, ∃Φ` enum packaging |
| `PhaseSyntaxPolyFacts.phaseSyntaxPoly_embed_fwd` | `Foundation.PhaseSyntaxPolyFacts` | `SPEC_044` — forward semantic map (`mutual` block) |
| `PhaseSyntaxPolyFacts.phaseSyntaxPoly_embed_rev` | `Foundation.PhaseSyntaxPolyFacts` | `SPEC_044` — reverse semantic map (`mutual` block) |
| `PhaseSyntaxPolyFacts.phaseSyntaxPoly_embed_nat_faithful` | `Foundation.PhaseSyntaxPolyFacts` | `SPEC_044` — `HoldsAt` iff on conservative embed (`Unit × ℕ`) |
| `PhaseSyntaxPolyFacts.provesAt_poly_phase_sound` | `Foundation.PhaseSyntaxPolyFacts` | `SPEC_044` — poly soundness from `ProvesAt` |
| `PhaseSyntaxPolyFacts.exists_poly_phase_provable_gap` | `Foundation.PhaseSyntaxPolyFacts` | `SPEC_044` — strict `ProvesAtPoly` gap |
| `PhaseSyntaxPolyFacts.poly_phase_crown_family` | `Foundation.PhaseSyntaxPolyFacts` | `SPEC_044` — `∃G, ∃Φ` poly-phase packaging |
| `PhaseSyntaxPolyFacts.phaseSyntaxPoly_embed_nat_faithful_on_enum_crown` | `Foundation.PhaseSyntaxPolyFacts` | `SPEC_044` — enum-crown pullback vs `HoldsAt`/`HoldsAtProd` |
| `PhaseSyntaxPolyFacts.outputEnum_crown_embed_eq` | `Foundation.PhaseSyntaxPolyFacts` | `SPEC_044` — injective unpack of poly embed at enum witness |
| `PhaseSyntaxPolyFacts.poly_phase_gap_at` | `Foundation.PhaseSyntaxPolyFacts` | `SPEC_044` — strict `ProvesAtPoly` gap at embedded witness |
| `OrganizationV2.IsFiniteHeight` | `Core.OrganizationV2` | `SPEC_045` — finite-height organization predicate (**def**) |
| `OrganizationV2.separatesStages` | `Core.OrganizationV2` | `SPEC_045` — re-export of bundled separation witness |
| `OrganizationHeightObstruction.finite_adequate_organization_has_bounded_stage_separation` | `Ridge.OrganizationHeightObstruction` | `SPEC_045` — two separated stages within bound |
| `OrganizationHeightObstruction.no_finite_adequate_organization_totalizes_future` | `Ridge.OrganizationHeightObstruction` | `SPEC_045` — bounded org cannot realize all strict `ℕ` pairs |
| `OrganizationHeightObstruction.organization_cannot_self_certify_total_future` | `Ridge.OrganizationHeightObstruction` | `SPEC_045` — no self-certifying total future package |
| `OrganizationHeightObstruction.organization_height_obstruction` | `Ridge.OrganizationHeightObstruction` | `SPEC_045` — ladder miss + abstract org block |
| `OrganizationCrownSummit.organization_crown_supports_strict_ascent` | `Summits.OrganizationCrownSummit` | `SPEC_045` — org obstruction + structural gap |
| `RetroStructuralTruthV2.IsRetroStructuralV2` | `Foundation.RetroStructuralTruthV2` | `SPEC_046` — retro v2 classifier |
| `RetroStructuralTruthV2.histSeqUpto` | `Foundation.RetroStructuralTruthV2` | `SPEC_046` — initial-segment diagonal history |
| `RetroStructuralTruthV2.isRetroStructuralV2_histSeqUpto` | `Foundation.RetroStructuralTruthV2` | `SPEC_046` — witness classification |
| `RetroStructuralGap.histSeqUpto_proves_succ_not_at` | `Ridge.RetroStructuralGap` | `SPEC_046` — strict retro gap |
| `RetroStructuralGap.exists_structural_retro_truth_gap` | `Ridge.RetroStructuralGap` | `SPEC_046` — ∃ classified retro φ |
| `RetroStructuralGap.later_regime_proves_earlier_history_truth` | `Ridge.RetroStructuralGap` | `SPEC_046` — later-depth proves earlier-segment bundle |
| `RetroStructuralGap.retro_truth_sound_about_earlier_segment` | `Ridge.RetroStructuralGap` | `SPEC_046` — soundness + earlier-segment guard |
| `RetroStructuralGap.retro_truth_not_mentionBound_only` | `Ridge.RetroStructuralGap` | `SPEC_046` — anti-collapse vs mention stratum |
| `RetroStructuralCrownSummit.retro_truth_feeds_crown_family` | `Summits.RetroStructuralCrownSummit` | `SPEC_046` — retro + structural packaging |
| `FinalCrownPackage.final_crown_iterated_structural_ascent` | `Summits.FinalCrownPackage` | `SPEC_047` — `∃G, ∃Φ, ∀n` structural strict gap |
| `FinalCrownPackage.final_crown_no_fixed_structural_stratum` | `Summits.FinalCrownPackage` | `SPEC_047` — scoped non-final stratum + org height |
| `FinalCrownPackage.final_crown_future_defeat_of_terminality` | `Summits.FinalCrownPackage` | `SPEC_047` — `FutureDefeat` on `natCounter` |
| `FinalCrownPackage.final_crown_generator_truth_family` | `Summits.FinalCrownPackage` | `SPEC_047` — generator-truth + structural family |
| `FinalCrownPackage.final_crown_enum_output_layer_gap` | `Summits.FinalCrownPackage` | `SPEC_047` — enum-layer `ProvesAt` gap export |

### Generalized crown frontier (`EPIC_012` — `SPEC_048_GC1`–`SPEC_053_GC6`)

| Declaration | Module | Role |
|-------------|--------|------|
| `SentenceHierarchyV2.isStructuralGenerator_implies_structuralV2` | `Core.SentenceHierarchyV2` | `SPEC_049` — legacy structural ⊂ **v2** |
| `SentenceHierarchyV2.isRetroStructuralV2_implies_structuralV2` | `Core.SentenceHierarchyV2` | Retro classified ⊂ **v2** |
| `SentenceHierarchyV2.isStructuralV2_cases` | `Core.SentenceHierarchyV2` | Def disjunction elimination |
| `PhaseGeneralizationFacts.carrier_observe_eq` | `Foundation.PhaseGeneralizationFacts` | `SPEC_048` — aligned trace obs |
| `PhaseGeneralizationFacts.nat_trace_int` | `Foundation.PhaseGeneralizationFacts` | `natCounter` trace lemma |
| `PhaseGeneralizationFacts.carrier_embed_fwd` | `Foundation.PhaseGeneralizationFacts` | `SPEC_048` — forward embed (`mutual`) |
| `PhaseGeneralizationFacts.carrier_embed_rev` | `Foundation.PhaseGeneralizationFacts` | `SPEC_048` — reverse embed (`mutual`) |
| `PhaseGeneralizationFacts.phase_general_embed_faithful` | `Foundation.PhaseGeneralizationFacts` | `HoldsAt` ↔ `carrierHolds` on embed |
| `PhaseGeneralizationFacts.prod_aligns` | `Foundation.PhaseGeneralizationFacts` | `SPEC_048` — `prod` alignment witness |
| `PhaseGeneralizationFacts.phase_general_embed_current_faithful` | `Foundation.PhaseGeneralizationFacts` | Current `ℕ` layer pullback |
| `PhaseGeneralizationFacts.holdsAt_general_phase_sound` | `Foundation.PhaseGeneralizationFacts` | `ProvesAt` ⇒ `HoldsAt` on embed |
| `PhaseGeneralizationFacts.provesAt_general_phase_sound` | `Foundation.PhaseGeneralizationFacts` | `ProvesAt` ⇒ `carrierHolds` |
| `PhaseGeneralizationFacts.output_enum_carrier_embed_eq` | `Foundation.PhaseGeneralizationFacts` | Injective unpack at enum witness |
| `PhaseGeneralizationFacts.general_phase_gap_at` | `Foundation.PhaseGeneralizationFacts` | `ProvesAtCarrier` strict gap at `Bool × ℕ` |
| `PhaseGeneralizationFacts.exists_general_phase_provable_gap` | `Foundation.PhaseGeneralizationFacts` | Existential gap packaging |
| `PhaseGeneralizationFacts.general_phase_crown_family` | `Foundation.PhaseGeneralizationFacts` | `∃G, ∃Φ` carrier crown |
| `PhaseGeneralizationFacts.current_crown_embeds_into_general_phase_layer` | `Foundation.PhaseGeneralizationFacts` | Pullback compatibility |
| `StructuralSentenceHierarchyV2.isStructuralV2_implies_structural` | `Foundation.StructuralSentenceHierarchyV2` | Naming bridge |
| `StructuralSentenceHierarchyV2.exists_structuralV2_sentence_provable_succ_not_at` | `Foundation.StructuralSentenceHierarchyV2` | Pointwise **v2** gap |
| `StructuralSentenceHierarchyV2.structuralV2_hist_not_geOutput_only` | `Foundation.StructuralSentenceHierarchyV2` | Anti-collapse vs `geOutput`-only |
| `StructuralSentenceHierarchyV2.structuralV2_hist_not_traceEq_only` | `Foundation.StructuralSentenceHierarchyV2` | Anti-collapse vs trace-only |
| `StructuralSentenceHierarchyV2.structuralV2_not_mentionBound_only` | `Foundation.StructuralSentenceHierarchyV2` | Mention stratum non-uniqueness |
| `StructuralSentenceHierarchyV2.structuralV2_crown_family` | `Foundation.StructuralSentenceHierarchyV2` | `∃ Φ, ∀ n` **v2** strict gap |
| `ModalTemporalFacts.modal_sound_next` | `Foundation.ModalTemporalFacts` | `SPEC_050` — `StageNext` sound |
| `ModalTemporalFacts.modal_sound_future` | `Foundation.ModalTemporalFacts` | Bounded future modal sound |
| `ModalTemporalFacts.modal_sound_pastSegment` | `Foundation.ModalTemporalFacts` | Listed past segment sound |
| `ModalTemporalFacts.exists_modal_sentence_strict_gap` | `Foundation.ModalTemporalFacts` | Modal-shaped strict gap |
| `ModalTemporalFacts.future_defeat_modalized` | `Foundation.ModalTemporalFacts` | Necessity packaging |
| `ModalTemporalFacts.retro_revelation_modalized` | `Foundation.ModalTemporalFacts` | Next-stage retro bundle |
| `OrganizationAbstractObstruction.abstractOrganization_nontrivial` | `Ridge.OrganizationAbstractObstruction` | Certified separation |
| `OrganizationAbstractObstruction.bounded_abstractOrganization_has_obstruction` | `Ridge.OrganizationAbstractObstruction` | Stage separation bound |
| `OrganizationAbstractObstruction.no_bounded_abstractOrganization_totalizes_future` | `Ridge.OrganizationAbstractObstruction` | ¬ total future map |
| `OrganizationAbstractObstruction.organization_obstruction_supports_generalized_crown` | `Ridge.OrganizationAbstractObstruction` | Supports generalized stratum packaging |
| `OrganizationAbstractObstruction.organization_cannot_certify_its_own_finality` | `Ridge.OrganizationAbstractObstruction` | ¬ self-certifying finality |
| `CrownTransfer.trueBoolProdNat_trace` | `Ridge.CrownTransfer` | `SPEC_052` — tagged trace |
| `CrownTransfer.altBoolProdNat_trace` | `Ridge.CrownTransfer` | Alt tag trace |
| `CrownTransfer.true_bool_aligns` | `Ridge.CrownTransfer` | Alignment witness |
| `CrownTransfer.alt_bool_aligns` | `Ridge.CrownTransfer` | Alt alignment |
| `CrownTransfer.trace_true_vs_alt` | `Ridge.CrownTransfer` | Global trace disequality |
| `CrownTransfer.phase_general_embed_true_faithful` | `Ridge.CrownTransfer` | Faithfulness on **true** class |
| `CrownTransfer.phase_general_embed_alt_faithful` | `Ridge.CrownTransfer` | Faithfulness on **alt** class |
| `CrownTransfer.admissibleClass_preserves_soundness` | `Ridge.CrownTransfer` | `ProvesAt` ⇒ both `carrierHolds` |
| `CrownTransfer.true_general_phase_gap_at` | `Ridge.CrownTransfer` | Enum gap at **true** section |
| `CrownTransfer.alt_general_phase_gap_at` | `Ridge.CrownTransfer` | Enum gap at **alt** section |
| `CrownTransfer.admissibleClass_preserves_gap_structure` | `Ridge.CrownTransfer` | Parallel **succ / not** |
| `CrownTransfer.crown_transfers_across_admissible_class` | `Ridge.CrownTransfer` | Gap + trace mismatch |
| `CrownTransfer.witnessOutput_true_of_trueEmbed` | `Ridge.CrownTransfer` | `Bool` head on embedded witness |
| `CrownTransfer.witnessOutput_false_of_altEmbed` | `Ridge.CrownTransfer` | Alt `Bool` head |
| `CrownTransfer.exists_two_nonisomorphic_crown_instances` | `Ridge.CrownTransfer` | Distinct carrier sentences |
| `CrownTransfer.generalized_crown_not_single_model_artifact` | `Ridge.CrownTransfer` | Two aligned generators |
| `GeneralizedFinalCrownPackage.generalized_final_crown_iterated_structural_ascent` | `Summits.GeneralizedFinalCrownPackage` | `SPEC_053` — **v2** ascent |
| `GeneralizedFinalCrownPackage.generalized_final_crown_no_fixed_structural_stratum` | `Summits.GeneralizedFinalCrownPackage` | Stratum + abstract org |
| `GeneralizedFinalCrownPackage.generalized_final_crown_future_defeat_of_terminality` | `Summits.GeneralizedFinalCrownPackage` | `FutureDefeat` export |
| `GeneralizedFinalCrownPackage.generalized_final_crown_generator_truth_family` | `Summits.GeneralizedFinalCrownPackage` | Generator truth ∧ **v2** |
| `GeneralizedFinalCrownPackage.generalized_final_crown_class_transfer` | `Summits.GeneralizedFinalCrownPackage` | Class transfer re-export |
| `GeneralizedFinalCrownPackage.generalized_final_crown_not_model_artifact` | `Summits.GeneralizedFinalCrownPackage` | Non-singleton model |

*(Summit-only re-exports in `GeneratorTruthRidge` / `SimulationVersusExplanationAbstractSummit` point into Core; no additional theorems there.)*

### Naturality and inevitability (`EPIC_013` — `SPEC_054_NS1`–`SPEC_058_NS5`)

| Declaration | Module | Role |
|-------------|--------|------|
| `NaturalityAxioms.weakDiagonalNaturality_of_isWeak` | `Core.NaturalityAxioms` | Weak diagonal naturality from `IsWeakDiagonalNatural` |
| `NaturalityAxioms.weakMultiscaleNaturality_iff_exists_separated` | `Core.NaturalityAxioms` | Multiscale naturality ↔ separated scales |
| `NaturalityAxioms.weakNaturality_of_organizationAbstract` | `Core.NaturalityAxioms` | Naturality from abstract org separation |
| `NaturalityFacts.naturality_adequacy_transport` | `Foundation.NaturalityFacts` | Adequacy transports along history maps |
| `NaturalityFacts.naturality_phase_certificates_preserved` | `Foundation.NaturalityFacts` | Phase certificates preserved under weak naturality |
| `StructuralSentenceNaturality.isStructuralV2_satisfies_weakPrinciples` | `Core.StructuralSentenceNaturality` | **v2** sentences satisfy weak sentence principles |
| `StructuralSentenceNaturality.structuralV2_of_weakPrinciples` | `Core.StructuralSentenceNaturality` | Reverse: weak principles carve **v2** |
| `StructuralSentenceNaturalityFacts.not_isRetroStructuralV2_natPhaseTagMem_initial` | `Foundation.StructuralSentenceNaturalityFacts` | `natPhaseTagMem initial` not retro-**v2** |
| `StructuralSentenceNaturalityFacts.structuralV2_satisfies_weak_sentence_naturality` | `Foundation.StructuralSentenceNaturalityFacts` | Structural **v2** class satisfies weak naturality |
| `StructuralSentenceNaturalityFacts.retroStructuralV2_satisfies_weak_sentence_naturality` | `Foundation.StructuralSentenceNaturalityFacts` | Retro **v2** instance satisfies weak naturality |
| `StructuralSentenceNaturalityFacts.naturality_does_not_collapse_to_mentionBound` | `Foundation.StructuralSentenceNaturalityFacts` | Weak naturality ≠ mention-bound collapse |
| `StructuralSentenceNaturalityFacts.naturality_preserves_strict_ascent_family` | `Foundation.StructuralSentenceNaturalityFacts` | Naturality-compatible families keep strict ascent |
| `AdmissibilityNaturality.weakNaturality_of_signatureAdmissibleInterface` | `Ridge.AdmissibilityNaturality` | Signature-admissible ⇒ weak interface naturality |
| `AdmissibilityNaturality.weakNaturality_preserves_crown_relevance` | `Ridge.AdmissibilityNaturality` | Weak naturality preserves crown-relevance linkage |
| `AdmissibilityNaturality.weakNaturality_excludes_trivial_interface` | `Ridge.AdmissibilityNaturality` | Weak naturality forbids trivializing interfaces |
| `AdmissibilityNaturality.not_rowSound_trivialAdmissibleInterface` | `Ridge.AdmissibilityNaturality` | Trivial interface not row-sound for signature |
| `BroadTransfer.naturalClass_preserves_soundness` | `Ridge.BroadTransfer` | `ProvesAt` soundness on any natural instance |
| `BroadTransfer.naturalClass_preserves_structural_ascent` | `Ridge.BroadTransfer` | Output-enum gap at `n` on aligned instances |
| `BroadTransfer.naturalClass_preserves_future_defeat` | `Ridge.BroadTransfer` | Same as structural ascent (alias name) |
| `BroadTransfer.naturalClass_preserves_nonfinality` | `Ridge.BroadTransfer` | `FutureDefeat` on numeric natural instance |
| `BroadTransfer.futureDefeatAt` | `Ridge.BroadTransfer` | Stage-indexed strict gap packaging |
| `BroadTransfer.futureDefeatBroadPoint` | `Ridge.BroadTransfer` | `BroadPoint` packaging for stage + instance |
| `BroadTransfer.futureDefeatBroadPoint_eq` | `Ridge.BroadTransfer` | `futureDefeatBroadPoint` = `futureDefeatAt` |
| `BroadTransfer.broad_transfer_of_generalized_crown` | `Ridge.BroadTransfer` | Broad transfer at every stage (two observation types) |
| `BroadTransfer.multiple_nontrivially_distinct_instances` | `Ridge.BroadTransfer` | Distinct traces + nonempty natural class |
| `BroadTransfer.crown_not_encoding_artifact_in_natural_class` | `Ridge.BroadTransfer` | Bool twins + gaps in natural class |
| `UnboundedOrganization.weakNaturalOrganization_bounded_obstruction` | `Ridge.UnboundedOrganization` | Bounded natural org hits obstruction |
| `UnboundedOrganization.finite_height_not_final_under_natural_conditions` | `Ridge.UnboundedOrganization` | Finite height ⇒ not final under naturality |
| `UnboundedOrganization.unbounded_organization_required_for_full_future` | `Ridge.UnboundedOrganization` | Totality of future forces unbounded org |
| `UnboundedOrganization.natural_no_final_organization_theorem` | `Ridge.UnboundedOrganization` | No final org package under natural bounds |
| `UnboundedOrganization.forall_bounded_natural_orgs_fail_totality` | `Ridge.UnboundedOrganization` | All bounded heights fail totality |
| `NaturalAntiClosure.weak_natural_conditions_imply_nonfinality_or_ascent` | `Ridge.NaturalAntiClosure` | Disjunctive inevitability under weak conditions |
| `NaturalAntiClosure.sufficient_generativity_forces_no_final_closure` | `Ridge.NaturalAntiClosure` | Stronger generativity ⇒ no final closure |
| `NaturalAntiClosure.natural_anti_closure_theorem` | `Ridge.NaturalAntiClosure` | Packaged anti-closure on natural numeric systems |
| `NaturalAntiClosure.weak_natural_interface_obstruction` | `Ridge.NaturalAntiClosure` | Interface-level obstruction |
| `NaturalAntiClosure.setup_dependence_alignments_bundled` | `Ridge.NaturalAntiClosure` | Alignment constraints bundled for transport |
| `NaturalClassExamples.bool_true_false_trace_differ` | `Models.NaturalClassExamples` | Concrete `Bool` trace separation |
| `NaturalClassExamples.two_carrier_shapes_inhabited` | `Models.NaturalClassExamples` | Two inhabited natural-instance shapes |

`def` / `structure` packaging (not duplicated as `theorem` rows): `BroadTransferStatement`, `CrownEncodingStatement`, `BroadPoint`, `NaturalAdmissibleInstance`, `Core.NaturalOrganization` predicates as used by **SPEC_057**–**058**.

### Canonicality, minimality, closure boundary (`EPIC_014` — `SPEC_060_CMI1`–`SPEC_063_CMI4` partial)

| Declaration | Module | Role |
|-------------|--------|------|
| `MinimalHypotheses.paradigmShift_iff_weak_and_conservative` | `Core.MinimalHypotheses` | `ParadigmShift` ↔ weak step ∧ history conservativity |
| `ClosureDichotomy.BoundedNumericTrace` | `Core.ClosureDichotomy` | Uniform output bound (collapse predicate fragment) |
| `ClosureDichotomy.ExistsBoundedNumericTrace` | `Core.ClosureDichotomy` | ∃ bound majorizing all numeric observations |
| `CanonicalityFacts.weakArchitectureOf` | `Foundation.CanonicalityFacts` | Bundles `GenerativeSystem` + regime family |
| `CanonicalityFacts.weakArchitecture_eta` | `Foundation.CanonicalityFacts` | Re-bundling is idempotent |
| `MinimalityCountermodels.trivialUnitGen_trace` | `Ridge.MinimalityCountermodels` | Constant `Unit` trace counter-toy |
| `MinimalityCountermodels.not_futureDefeat_of_constant_numeric_trace` | `Ridge.MinimalityCountermodels` | Constant numeric trace \(\Rightarrow \neg\) `FutureDefeat` |
| `MinimalityCountermodels.countermodel_without_nontriviality_of_bounded_trace` | `Ridge.MinimalityCountermodels` | Bounded trace \(\Rightarrow \neg\) `FutureDefeat` |
| `ClosureCollapseBoundary.not_futureDefeat_iff_existsBoundedNumericTrace` | `Ridge.ClosureCollapseBoundary` | **IFF:** \(\neg\) `FutureDefeat` ↔ bounded numeric trace |
| `ClosureCollapseBoundary.futureDefeat_or_existsBoundedNumericTrace` | `Ridge.ClosureCollapseBoundary` | **Dichotomy** on numeric observation type |
| `ClosureCollapseBoundary.collapse_bounded_trace_implies_not_futureDefeat` | `Ridge.ClosureCollapseBoundary` | Collapse \(\Rightarrow \neg\) unbounded-rise predicate |
| `ClosureCollapseBoundary.noncollapse_futureDefeat_of_unbounded` | `Ridge.ClosureCollapseBoundary` | `FutureDefeat` \(\Rightarrow\) no uniform bound |
| `ClosureCollapseBoundary.minimal_assumption_barrier_for_crown` | `Ridge.ClosureCollapseBoundary` | **Alias** name for the numeric dichotomy (`SPEC_060` crosswalk) |
| `ArchitectureRepresentation.sameShape_id` | `Ridge.ArchitectureRepresentation` | Identity on weak architectures (representation hook) |
| `UniversalUpwardNecessity.exhibited_strict_retro_gap` | `Ridge.UniversalUpwardNecessity` | Navigator to `histSeqUpto` strict gap |
| `ClosureDichotomySummit.closure_dichotomy_numeric_trace` | `Summits.ClosureDichotomySummit` | Summit re-export: numeric dichotomy |
| `ClosureDichotomySummit.finality_boundary_iff_bounded` | `Summits.ClosureDichotomySummit` | Summit re-export: \(\neg\) `FutureDefeat` iff bounded |
| `UniversalUpwardNecessitySummit.exhibited_strict_retro_gap` | `Summits.UniversalUpwardNecessitySummit` | Summit navigator for retro gap |

`def` / `structure`: `Core.WeakParadigmStep`, `Core.WeakExplanatoryArchitecture`, `ArchitectureRepresentation.sameShape`.

---

## Not achievable (literal universal forms)

A **uniform** diagonal for **all** raw `AdmissibleInterface` values is **refuted** by `trivialAdmissibleInterface` / `trivialInterface_rows_claim_everything`. An **infinite paradigm chain** for **every** `RegimeFamilySingletonWithin` family is **refuted** by `emptyRegime` / `not_paradigmShiftSteps_empty_tower`. Honest quantification uses **`SignatureAdmissibleInterface`** or explicit **`RowSoundForSignature`**.

---

## Still research-grade open (extensions)

Extensions beyond normative closure (normative **`EPIC_002`** closed per [`SPEC_034_R2B`](../specs/INCOMPLETE/IN-PROCESS/SPEC_034_R2B_EPIC002_SCOPE_CLOSURE.md)): richer phase-at-sentence without `Set ℕ` encoding; extra modalities; carriers beyond the current conservative poly embed pattern; **etc.** Crown ascent (**`SPEC_035_GS1`**–**`SPEC_037_CR1`**) — see [`EPIC_009`](../specs/INCOMPLETE/IN-PROCESS/EPIC_009_STRICT_ITERATED_ASCENT/EPIC_009_MASTER_ORCHESTRATION.md). Expressive frontier v1 (**`SPEC_038_XS1`**–**`SPEC_041_OR1`**) — see [`EPIC_010`](../specs/INCOMPLETE/IN-PROCESS/EPIC_010_EXPRESSIVE_ORGANIZATION_FRONTIER/EPIC_010_MASTER_ORCHESTRATION.md). **Crown completion** (**`SPEC_042_CG1`**–**`SPEC_047_CG6`**) — [`EPIC_011`](../specs/INCOMPLETE/IN-PROCESS/EPIC_011_CROWN_COMPLETION/EPIC_011_MASTER_ORCHESTRATION.md); Lean packaging includes structural crown (**042**), enum / poly / org V2 / retro v2 / final package rows above. **Post-crown generalization** (**`SPEC_048_GC1`**–**`SPEC_053_GC6`**) — [`EPIC_012`](../specs/INCOMPLETE/IN-PROCESS/EPIC_012_GENERALIZED_CROWN_FRONTIER/EPIC_012_MASTER_ORCHESTRATION.md); see also [`GENERALIZED_CROWN_POSITIONING.md`](GENERALIZED_CROWN_POSITIONING.md).

---

_Add new rows in the **same change** as new `theorem` / `lemma` declarations. If this list drifts, re-audit `NoveltyTheory/**/*.lean` for declaration sites—include lines after attributes (e.g. `@[simp] theorem`), not only lines that start with `theorem` / `lemma`._
