# Generalized crown dependency map (`EPIC_012`)

**Purpose:** Direct mathematical dependencies for the **post-`EPIC_011`** generalized layer. For declarations, see **[`THEOREM_INVENTORY.md`](THEOREM_INVENTORY.md)**; for interpretation boundaries, **[`GENERALIZED_CROWN_POSITIONING.md`](GENERALIZED_CROWN_POSITIONING.md)**.

## Carrier / phase (`SPEC_048_GC1`)

```
Core.GeneralizedCarrier (CarrierSection, AlignsCarrier)
  → Core.PhaseSyntaxGeneral.sentenceCarrierEmbed
  → Foundation.PhaseGeneralizationFacts (carrier_embed_fwd / rev, phase_general_embed_faithful,
       provesAt_general_phase_sound, general_phase_crown_family)
  → Models.CarrierGeneralCrown (re-export)
← Models.OutputEnumCrownFamily (enum witness)
```

## Structural v2 (`SPEC_049_GC2`)

```
Foundation.RetroStructuralTruthV2 + Foundation.StructuralGeneratorSentence
  → Core.SentenceHierarchyV2.IsStructuralSentenceV2
  → Foundation.StructuralSentenceHierarchyV2 (anti-collapse + structuralV2_crown_family)
  → Models.StructuralHierarchyCrown (re-export)
```

## Modal / temporal (`SPEC_050_GC3`)

```
Core.ModalTemporalSyntax
  → Foundation.ModalTemporalFacts (soundness + exists_modal_sentence_strict_gap + modalized exports)
  → Models.ModalCrownWitnesses
  → Summits.ModalTemporalFrontierSummit
```

## Abstract organization (`SPEC_051_GC4`)

```
Core.OrganizationAbstract.AdmissibleBoundedOrganization
  → Ridge.OrganizationHeightObstruction.TotalizesStandardFuture (hypothesis reuse)
  → Ridge.OrganizationAbstractObstruction (organization_obstruction_supports_generalized_crown, …)
  → Summits.OrganizationAbstractSummit
```

## Admissible-class transfer (`SPEC_052_GC5`)

```
Foundation.PhaseGeneralizationFacts (ProvesAtCarrier, carrier facts)
  → Ridge.CrownTransfer (trueBoolProdNat / altBoolProdNat, crown_transfers_across_admissible_class)
  → Models.ClassTransferExamples
  → Summits.GeneralizedCrownTransferSummit
```

## Generalized final package (`SPEC_053_GC6`)

```
Summits.GeneralizedFinalCrownPackage
  ← Foundation.StructuralSentenceHierarchyV2 (structuralV2_crown_family)
  ← Ridge.OrganizationAbstractObstruction
  ← Summits.FinalCrownPackage (FutureDefeat, generator-truth linkage)
  ← Ridge.CrownTransfer
```

---

## Minimality and numeric boundaries (post-`EPIC_014`)

These lemmas **do not** extend the six-clause `GeneralizedFinalCrownPackage` chain; they **sharpen trust boundaries** (paradigm packaging, numeric trace, universal-quantifier failures):

```
Core.MinimalHypotheses (paradigmShift_iff_weak_and_conservative)
  → Ridge.ConservativeSeparationCountermodel (countermodel_without_history_conservativity)
Models.StratifiedFinality.FutureDefeat + Core.ClosureDichotomy.ExistsBoundedNumericTrace
  ⇕ Ridge.ClosureCollapseBoundary.not_futureDefeat_iff_existsBoundedNumericTrace
  → Ridge.ClosureCollapseBoundary.futureDefeat_or_existsBoundedNumericTrace
Ridge.MinimalityCountermodels + Ridge.UniversalUpwardNecessity.upward_necessity_universal_obstruction
  → Summits.UniversalUpwardNecessitySummit (re-export)
Summits.ClosureDichotomySummit (numeric packaging)
```

_For prose and inventory rows see [`docs/CLOSURE_DICHOTOMY_MAP.md`](CLOSURE_DICHOTOMY_MAP.md), [`docs/CANONICALITY_POSITIONING.md`](CANONICALITY_POSITIONING.md), [`docs/THEOREM_INVENTORY.md`](THEOREM_INVENTORY.md)._

---

_Keep this DAG aligned with `NoveltyTheory/All.lean` and the **`EPIC_012`** spec table; add boundary arcs above when the minimality slice changes._
