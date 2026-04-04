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
| Diagonal | Row-sound interface misses `phaseSingleton (i+1)` at row `i` | `diagonal_stage_defeats_row`, `no_uniform_row_at_next_stage` | `Ridge.DiagonalNat`, `Summits` | `RowSoundForSignature` |
| **Alignment** | Biconditional with `regimeUpto` rows ⇒ soundness ⇒ diagonal | `SignatureInterfaceAgrees`, `rowSound_of_agrees`, `not_rowExplains_succ_of_agrees` | `Ridge.InterfaceAlignment` | `RowSoundForSignature` |
| **Abstract diagonal** | Singleton-within bound at height `n` ⇒ no explain `phaseSingleton (n+1)` | `not_explains_singleton_succ_of_within`, `family_diagonal_of_singletonWithin`, `summit_bounded_regime_family_diagonal` | `BoundedRegimeDiagonal`, `Summits` | singleton adequacy bound |
| **Model B** | Agreed enumeration inherits shifts + diagonal + generation | `modelB_enumerated_diagonal_package`, `summit_modelB_enumerated_diagonal` | `ReducerDiagonal` | `EnumAgreesUpto`, `singletonWithin_of_enum_agrees` |
| **Orders (NXT)** | Strict causal vs explanatory orders differ | `causal_explanatory_orders_diverge`, `causal_explanatory_order_divergence` | `CausalExplanatoryOrders`, `Summits` | definitional |
| **Phase link** | Causal step can **lower** summed tag `phaseTag` | `causal_strict_but_tag_decreases`, `gen_cert_causal_strict_but_lower_phase_tag` | `GenCertPhase`, `Summits` | `phaseSingleton` |
| Model A pack | Tower + generator + shifts | `model_causal_paradigm_tower` | `Summits.CausalExplanatorySeparation` | `canonicalTower` |

**Still open for maximal goals:** **global** quantification over an admissible class with **no** stated adequacy bound; **infinite paradigm tower** for arbitrary `c` with only `RegimeFamilySingletonWithin` (needs additional conservative-shift structure); Wave 2 **S7–S9** (retroactive revelation, simulation vs explanation, forced infinite towers) in **`SPEC_003_NXT`**.

_Update this table whenever summits or ridge theorems change._
