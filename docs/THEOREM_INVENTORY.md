# Theorem inventory (novelty-theory-lean)

**Purpose:** Catalog of **public `theorem` / `lemma`** declarations under `NoveltyTheory/` (excluding Mathlib). Use this as the theorem index for papers and dependency maps. Proof hygiene defaults: [`MANIFEST.md`](../MANIFEST.md).

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

| Declaration | Module | Role |
|-------------|--------|------|
| `library_root_import_ok` | `NoveltyTheory.Basic` | Aggregate import smoke test |

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
| `StructuralGeneratorSentence.isGeneratorStructural_implies` | `Foundation.StructuralGeneratorSentence` | `SPEC_017` fragment ⊆ structural class |
| `StructuralGeneratorSentence.geOutput_not_isGeneratorStructural` | `Foundation.StructuralGeneratorSentence` | Output atoms ≠ trace-only ridge |
| `StructuralGeneratorSentence.natPhaseTagMem_initial_not_structural` | `Foundation.StructuralGeneratorSentence` | `initial` tag outside structural fragment |
| `StructuralGeneratorSentence.not_structural_finConj_nil` | `Foundation.StructuralGeneratorSentence` | Empty `finConj` excluded |
| `StructuralGeneratorSentence.mention_bound_neither_implies_structural_nor_nonstructural` | `Foundation.StructuralGeneratorSentence` | Anti-collapse vs `mentionBound` |
| `AscentRegime.provesInRegime_iff` | `Foundation.AscentRegime` | \(R_m\) = `ProvesAt m` |
| `AscentRegime.provesInRegime_mono` | `Foundation.AscentRegime` | Regime monotonicity |
| `AscentRegime.provesInRegime_sound` | `Foundation.AscentRegime` | `ProvesInRegime` ⇒ `HoldsAt natCounter` |

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
| `StratifiedSentenceModel.exists_sentence_expressible_succ_not_at` | `Models.StratifiedSentenceModel` | Expressibility gap witness |
| `StratifiedSentenceModel.exists_sentence_provable_succ_not_at` | `Models.StratifiedSentenceModel` | `geOutput` provability gap |
| `StratifiedSentenceModel.exists_sentence_trace_provable_succ_not_at` | `Models.StratifiedSentenceModel` | Trace provability gap |
| `StratifiedSentenceModel.exists_sentence_phase_provable_succ_not_at` | `Models.StratifiedSentenceModel` | Phase provability gap |
| `StratifiedSentenceModel.exists_histSeq_nonempty_provable_succ_not_at` | `Models.StratifiedSentenceModel` | `histSeq` gap |
| `StratifiedSentenceModel.universal_no_sentence_proof_at_own_bound` | `Models.StratifiedSentenceModel` | Universal proof-height obstruction |
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
| `SummitPackages.summit_crown_strict_ascent_sentence_family` | `Summits.SummitPackages` | Crown re-export |

*(Summit-only re-exports in `GeneratorTruthRidge` / `SimulationVersusExplanationAbstractSummit` point into Core; no additional theorems there.)*

---

## Not achievable (literal universal forms)

A **uniform** diagonal for **all** raw `AdmissibleInterface` values is **refuted** by `trivialAdmissibleInterface` / `trivialInterface_rows_claim_everything`. An **infinite paradigm chain** for **every** `RegimeFamilySingletonWithin` family is **refuted** by `emptyRegime` / `not_paradigmShiftSteps_empty_tower`. Honest quantification uses **`SignatureAdmissibleInterface`** or explicit **`RowSoundForSignature`**.

---

## Still research-grade open (extensions)

Extensions beyond normative closure (normative **`EPIC_002`** closed per [`SPEC_034_R2B`](../specs/INCOMPLETE/IN-PROCESS/SPEC_034_R2B_EPIC002_SCOPE_CLOSURE.md)): richer phase-at-sentence without `Set ℕ` encoding; `NatPhaseTag.initial` at **derivability** fringe; modalities; polymorphic phase syntax; stronger organization predicates; **etc.** Crown ascent (**`SPEC_035_GS1`**–**`SPEC_037_CR1`**) is **implemented** under [`EPIC_009_STRICT_ITERATED_ASCENT`](../specs/INCOMPLETE/IN-PROCESS/EPIC_009_STRICT_ITERATED_ASCENT/EPIC_009_MASTER_ORCHESTRATION.md). Remaining extensions: [`EPIC_010_EXPRESSIVE_ORGANIZATION_FRONTIER`](../specs/INCOMPLETE/IN-PROCESS/EPIC_010_EXPRESSIVE_ORGANIZATION_FRONTIER/EPIC_010_MASTER_ORCHESTRATION.md) (**`SPEC_038_XS1`**–**`SPEC_041_OR1`**).

---

_Add new rows in the **same change** as new `theorem` / `lemma` declarations. If this list drifts, re-audit `NoveltyTheory/**/*.lean` for declaration sites—include lines after attributes (e.g. `@[simp] theorem`), not only lines that start with `theorem` / `lemma`._
