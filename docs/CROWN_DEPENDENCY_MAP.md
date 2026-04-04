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

## Planned (`EPIC_011` remainder)

| Phase | Spec | Planned modules (per spec) |
|------|------|----------------------------|
| Enum / finite output | `SPEC_043_CG2` | `Foundation.OutputEnumProvability`, `Models.OutputEnumCrownFamily` |
| Polymorphic / finset phase | `SPEC_044_CG3` | `Core.PhaseSyntaxPoly`, `Foundation.PhaseSyntaxPolyFacts`, `Models.PolymorphicPhaseCrown` |
| Organization V2 | `SPEC_045_CG4` | `Core.OrganizationV2`, `Ridge.OrganizationHeightObstruction`, `Summits.OrganizationCrownSummit` |
| Retro structural v2 | `SPEC_046_CG5` | `Foundation.RetroStructuralTruthV2`, `Ridge.RetroStructuralGap`, `Summits.RetroStructuralCrownSummit` |
| Final package | `SPEC_047_CG6` | `Summits.FinalCrownPackage` |

---

_Reconcile this DAG when new crown phases land; keep it honest about **direct** mathematical dependencies, not PR narrative._
