# Theorem inventory (novelty-theory-lean)

**Purpose:** Headline declarations aligned with **`SPEC_011_SPK`** and ridge/model layers. For proof hygiene defaults see [`MANIFEST.md`](../MANIFEST.md).

| Layer | Informal statement | Lean name | Module | Key dependencies |
|-------|-------------------|-----------|--------|-------------------|
| **ADR / explains** | Interface explains tower stage = generated ∧ some row witnesses | `AdmissibleInterface.explainsTowerStage`, `explainsTowerStageAt` | `Core.Explains` | `rowExplains`, `generatedBy` |
| **ADR / explains** | Regime at `n` explains phase at `n`, on trace | `regimeExplainsTowerStage` | `Core.Explains` | `ExplanatoryRegime.explains` |
| **Canonical regime** | `regimeUpto n` explains stage `n` of `canonicalTower` on `natCounter` | `canonical_regime_explains_each_stage` | `Summits.SummitPackages` | `regimeUpto_explains_singleton` |
| Summit I | Each signature level `k` fails on some generated phase | `causal_generation_not_uniform_explanation` | `Summits.SummitPackages` | `natCounter_generated`, `not_explains_regime_singleton_succ` |
| Summit II | Infinite paradigm shifts + one generator | `infinite_paradigm_tower` | `Summits.SummitPackages` | `canonicalTower_paradigmSteps` |
| Summit III | No `regimeUpto k` explains every phase | `noFinalInternalTheory_signature_family` | `Summits.SummitPackages` | `not_explains_regime_singleton_succ` |
| Summit IV | Depth-strict `provesAtDepth` gap + soundness + monotonicity | `upwardExplanatoryNecessity_counterfact`, `proves_sound`, `proves_mono` | `Models.InvariantTower` | `upward_derivability_gap` |
| **NXT S7 (template)** | Fixed index `k`, proof at depth `n>k` but not at `k` | `retro_derivability`, `retroactive_derivability_crossDepth` | `InvariantTower`, `Summits.SummitPackages` | `provesAtDepth`, `not_proves_self` |
| **NXT S9** | Same `reachSet` / trace coupling does not imply regime back-reduction | `traceCoupled`, `observationalEquivalence`, `trace_coupled_prod_not_reducible`, `trace_coupled_distinct_carrier_not_reducible`, `observational_eq_but_irreducible` | `GenerativeSystem`, `SignatureTower`, `SimulationVersusExplanation`, `Summits` | `not_reducible_succ`, `natCounterProd` |
| **NXT S6** | From height `n`, some `m>n` admits a `ParadigmShift` witness | `exists_future_paradigmShift`, `every_stage_admits_future_paradigmShift` | `SignatureTower`, `Summits` | `paradigmShift_succ` |
| **NXT S8 (template)** | Fixed regime height misses a generated singleton phase | `tower_phase_not_explained_by_fixed_regime`, `explanatory_incompleteness_fixed_signature_height` | `SignatureTower`, `Summits` | `not_explains_regime_singleton_succ` |
| **Model B off-axis** | `RegimeFamilySingletonWithin` + shifts + diagonal, but `¬ EnumAgreesUpto` | `dupRegime`, `modelB_dup_singleton_bound_package`, `summit_nontrivial_modelB_singleton_family` | `DupRegimeTower`, `Summits` | `Fintype.card_congr`, paradigm packaging |
| **Generator facts** | `natCounter` realizes every `ℕ` in `reachSet` | `natCounter_reachSet_univ`, `natCounter_mem_reachSet` | `Models.SignatureTower` | `natCounter_trace` |
| **Tower phrasing** | `paradigmShiftSteps` packaged as “paradigm chain” | `PhaseRegimeTower.IsParadigmChain`, `paradigmShiftSteps_eq_isChain` | `Core.Tower` | definitional |
| Diagonal | Row-sound interface misses `phaseSingleton (i+1)` at row `i` | `diagonal_stage_defeats_row`, `no_uniform_row_at_next_stage` | `Ridge.DiagonalNat`, `Summits` | `RowSoundForSignature` |
| **Alignment** | Biconditional with `regimeUpto` rows ⇒ soundness ⇒ diagonal | `SignatureInterfaceAgrees`, `rowSound_of_agrees`, `not_rowExplains_succ_of_agrees` | `Ridge.InterfaceAlignment` | `RowSoundForSignature` |
| **Abstract diagonal** | Singleton-within bound at height `n` ⇒ no explain `phaseSingleton (n+1)` | `not_explains_singleton_succ_of_within`, `family_diagonal_of_singletonWithin`, `summit_bounded_regime_family_diagonal` | `BoundedRegimeDiagonal`, `Summits` | singleton adequacy bound |
| **Model B** | Agreed enumeration inherits shifts + diagonal + generation | `modelB_enumerated_diagonal_package`, `summit_modelB_enumerated_diagonal` | `ReducerDiagonal` | `EnumAgreesUpto`, `singletonWithin_of_enum_agrees` |
| **Orders (NXT)** | Strict causal vs explanatory orders differ | `causal_explanatory_orders_diverge`, `causal_explanatory_order_divergence` | `CausalExplanatoryOrders`, `Summits` | definitional |
| **Phase link** | Causal step can **lower** summed tag `phaseTag` | `causal_strict_but_tag_decreases`, `gen_cert_causal_strict_but_lower_phase_tag` | `GenCertPhase`, `Summits` | `phaseSingleton` |
| Model A pack | Tower + generator + shifts | `model_causal_paradigm_tower` | `Summits.CausalExplanatorySeparation` | `canonicalTower` |

**Still open for maximal goals:** **global** quantification over an admissible class with **no** stated adequacy bound; **infinite paradigm tower** for arbitrary `c` with only `RegimeFamilySingletonWithin` and **no** extra constructor like `dupRegime`; **`SPEC_003_NXT`** beyond current scope: stronger retro “revelation” (formula layer beyond `InvariantTower` proof budgets), and **forced infinite organizational** towers (universal adequacy ⇒ infinite internal hierarchy).

_Update this table whenever summits or ridge theorems change._
