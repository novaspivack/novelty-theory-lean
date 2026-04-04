# Strengthened dependency map (`EPIC_013`)

**Purpose:** Import-oriented spine for **`SPEC_054_NS1`–`SPEC_058_NS5`** modules and summits. Base crown (`EPIC_012`, `GeneralizedFinalCrownPackage`) is **presupposed**, not replaced.

**Orchestration:** [`../specs/INCOMPLETE/IN-PROCESS/EPIC_013_NATURALITY_AND_INEVITABILITY_STRENGTHENING/EPIC_013_MASTER_ORCHESTRATION.md`](../specs/INCOMPLETE/IN-PROCESS/EPIC_013_NATURALITY_AND_INEVITABILITY_STRENGTHENING/EPIC_013_MASTER_ORCHESTRATION.md).

**Claim table:** [`STRENGTHENED_CLAIM_SURFACE.md`](STRENGTHENED_CLAIM_SURFACE.md).

---

## Layered imports (summit → ridge → foundation/core)

```mermaid
flowchart TB
  subgraph Summit["Summits (EPIC_013)"]
    BTS[BroadTransferSummit]
    UOS[UnboundedOrganizationSummit]
    NACS[NaturalAntiClosureSummit]
  end
  subgraph Ridge013["Ridge"]
    BT[BroadTransfer]
    UO[UnboundedOrganization]
    NAC[NaturalAntiClosure]
    AN[AdmissibilityNaturality]
  end
  subgraph Found013["Foundation"]
    NF[NaturalityFacts]
    SSF[StructuralSentenceNaturalityFacts]
    PGF[PhaseGeneralizationFacts]
    PF[ProvabilityFacts]
  end
  subgraph Core013["Core"]
    NA[NaturalityAxioms]
    SSN[StructuralSentenceNaturality]
    NACI[NaturalAdmissibleClass]
    NO[NaturalOrganization]
    GC[GeneralizedCarrier]
    GS[GenerativeSystem]
  end
  subgraph Models013["Models"]
    NCE[NaturalClassExamples]
    OEC[OutputEnumCrownFamily]
    SS[SentenceProvability]
    SF[StratifiedFinality]
  end
  BTS --> BT
  UOS --> UO
  NACS --> NAC
  BT --> NACI
  BT --> PGF
  BT --> NCE
  BT --> OEC
  BT --> SS
  BT --> SF
  AN --> NA
  AN --> RidgeBase[SignatureAdmissibleBundle / admissible interfaces]
  NF --> NA
  NF --> PhaseCore[Core.Phase]
  SSF --> SSN
  SSF --> PGF
  UO --> NO
  UO --> PGF
  NAC --> NACI
  NAC --> NCE
  NACI --> PGF
  NACI --> GC
```

_Nodes omit Mathlib transitives._

---

## Direct `import` facts (verbatim)

| Module | Primary imports (high level) |
|--------|------------------------------|
| `Ridge.BroadTransfer` | `NaturalAdmissibleClass`, `GenerativeSystem`, `PhaseGeneralizationFacts`, `ProvabilityFacts`, `NaturalClassExamples`, `OutputEnumCrownFamily`, `SentenceProvability`, `StratifiedFinality` |
| `Ridge.AdmissibilityNaturality` | Core naturality + admissible-bundle ridge |
| `Ridge.UnboundedOrganization` | `NaturalOrganization`, `PhaseGeneralizationFacts`, organization ridge |
| `Ridge.NaturalAntiClosure` | `NaturalAdmissibleClass`, models + foundation facts per file |
| `Summits.BroadTransferSummit` | `Ridge.BroadTransfer` |
| `Summits.UnboundedOrganizationSummit` | `Ridge.UnboundedOrganization` |
| `Summits.NaturalAntiClosureSummit` | `Ridge.NaturalAntiClosure` |

**Aggregate:** [`NoveltyTheory/All.lean`](../NoveltyTheory/All.lean) pulls summit modules when present in the library root imports.

---

_Last updated with [`THEOREM_INVENTORY.md`](THEOREM_INVENTORY.md) verification block (**2026-04-04**): `lake build` green; `Ridge.BroadTransfer` import row aligned with [`NoveltyTheory/Ridge/BroadTransfer.lean`](../NoveltyTheory/Ridge/BroadTransfer.lean)._
