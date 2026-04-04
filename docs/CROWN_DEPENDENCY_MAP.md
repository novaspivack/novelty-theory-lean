# Crown dependency map (novelty-theory-lean)

**Purpose:** High-level **direct** dependencies for crown-related summit layers. For the full declaration list, use [`THEOREM_INVENTORY.md`](THEOREM_INVENTORY.md).

## Model C core (provability depth)

- **`InvariantTower.provesAtDepth`**, **`upward_derivability_gap`**, **`upward_trace_derivability_gap`**, **`upward_phase_derivability_gap`**
- Feeds **`Models.SentenceProvability.ProvesAt`**

## Ascent packaging

- **`Foundation.AscentRegime.ProvesInRegime`** = **`ProvesAt`** (same calculus)
- **`Foundation.UpwardNecessity`**: sentence-level gaps for **`geOutput`** and **diagonal `traceEq`**

## Crown v1 (`geOutput`)

```
InvariantTower.upward_derivability_gap
  → SentenceProvability.ProvesAt (geOutput branch)
  → UpwardNecessity.upward_necessity_geOutput
  → CrownIteratedAscentSummit (strict ascent family)
Foundation.StructuralGeneratorSentence (+ geOutput_not_isGeneratorStructural)
  → CrownIteratedAscentSummit.geOutput_crown_not_traceEq_ridge_only
```

## Structural crown witness (`SPEC_042_CG1`)

```
StructuralCrownSentence.structuralCrownWitness
  → StructuralGeneratorSentence (and of geOutput + traceEq_diag)
StructuralCrownFamily.structuralCrownWitness_proves_succ_not_at
  ← InvariantTower.upward_derivability_gap
  ← InvariantTower.upward_trace_derivability_gap
  → StructuralCrownSummit (exports + ∃∃∀ family)
StratifiedSentenceModel.exists_sentence_provable_succ_not_at
  → StructuralCrownSummit.structural_crown_refines_bare_provable_gap (bare side)
```

## Blocked universal forms (documentation anchors)

- **`SignatureAdmissibleBundle` / trivial interface** — no uniform raw-interface diagonal
- **`RegimeFamilyObstruction` / empty regime** — no universal infinite paradigm chain

## Crown completion (`EPIC_011` — `SPEC_043`–`SPEC_047`)

### Enum / finite-output layer (`SPEC_043_CG2`)

```
Foundation.OutputEnumProvability (+ SentenceProvability / SentenceFacts hooks)
  → Models.OutputEnumCrownFamily.outputEnumCrownWitness_proves_succ_not_at
  → strict `ProvesAt` ascent (non-`geOutput` witness path)
```

### Polymorphic carrier (`SPEC_044_CG3`)

```
Core.PhaseSyntaxPoly.sentencePolyEmbed
  → Foundation.PhaseSyntaxPolyFacts.phaseSyntaxPoly_embed_nat_faithful (semantic iff on `Unit × ℕ`)
  → provesAt_poly_phase_sound, poly_phase_crown_family
  → Models.PolymorphicPhaseCrown (re-export boundary)
```

### Organization V2 + height (`SPEC_045_CG4`)

```
Core.OrganizationV2 (+ IsFiniteHeight)
  → Ridge.OrganizationHeightObstruction.no_finite_adequate_organization_totalizes_future
  → Ridge.OrganizationHeightObstruction.organization_height_obstruction
     (pairs `finite_signature_cannot_organize_full_ladder` with abstract future-totalization block)
  → Summits.OrganizationCrownSummit.organization_crown_supports_strict_ascent
```

### Retro structural v2 (`SPEC_046_CG5`)

```
Foundation.RetroStructuralTruthV2 (IsRetroStructuralV2, histSeqUpto)
  → Ridge.RetroStructuralGap.histSeqUpto_proves_succ_not_at
  → Summits.RetroStructuralCrownSummit.retro_truth_feeds_crown_family
```

### Final integrative package (`SPEC_047_CG6`)

```
Summits.FinalCrownPackage
  ← StructuralCrownSummit / StructuralCrownFamily
  ← SignatureTower / StratifiedFinality
  ← OrganizationHeightObstruction
  ← OutputEnumCrownFamily (extra `ProvesAt` gap export)
```

---

_Reconcile this DAG when crown phases change; keep it honest about **direct** mathematical dependencies, not PR narrative._
