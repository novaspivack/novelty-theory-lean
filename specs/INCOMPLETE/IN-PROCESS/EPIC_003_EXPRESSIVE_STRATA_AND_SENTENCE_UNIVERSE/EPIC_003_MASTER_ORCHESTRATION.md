# EPIC_003 — Expressive strata and sentence universe

**Goal:** First-class **`Sentence`**, **semantic** truth on generators (**`HoldsAt`**), **expressibility** tied to regime resources (**`ExpressibleAt`** / height strata), and **provability** (**`ProvesAt`**) with soundness, monotonicity, explicit **non-collapse** witnesses, and a conservative embed of **`CounterFact`**.

**Source roadmap:** [`../THEORY_SEED.md/004_IMPROVEMENTS.md`](../THEORY_SEED.md/004_IMPROVEMENTS.md).

**Depends on:** **EPIC_002** baseline (`Phase`, `GenerativeSystem`, `ExplanatoryRegime`, `InvariantTower` / `CounterFact`).

**Enables:** **EPIC_004**–**008** (necessity, organization, terminality, strong retro, abstract simulation).

## Theory specs (normative ladder)

| Order | Spec | Focus |
|------:|------|--------|
| 1 | [**`SPEC_013_ES1`**](SPEC_013_ES1_SENTENCE_UNIVERSE.md) | `Sentence` syntax: atoms, bounded trace facts, connectives |
| 2 | [**`SPEC_014_ES2`**](SPEC_014_ES2_STRATIFIED_SEMANTICS.md) | `HoldsAt`, expressibility strata, `ProvesAt` interfaces |
| 3 | [**`SPEC_015_ES3`**](SPEC_015_ES3_COUNTERFACT_EMBEDDING.md) | Embed `CounterFact.geOutput` into `Sentence` |
| 4 | [**`SPEC_016_ES4`**](SPEC_016_ES4_NONCOLLAPSE_WITNESSES.md) | Inequivalent strata (express / prove gap) |

## Living progress

| Phase | Status | Notes |
|-------|--------|-------|
| Sentence + semantics + expressibility + provability | **Complete** | `Core.Sentence`, `NatPhaseTag`, `SentenceSemantics`, `SentenceExpressibility`, `Models.SentenceProvability`, `StratifiedSentenceModel` |
| Foundation lemmas | **Complete** | `Foundation.SentenceFacts`, `Foundation.ProvabilityFacts` |

## Queue

| # | Task | Spec | Status |
|---|------|------|--------|
| 1 | Sentence + `HoldsAt` | `SPEC_013_ES1`, `SPEC_014_ES2` | **Complete** — includes `natPhaseTagMem`, `finConj` |
| 2 | CounterFact embed + coherence | `SPEC_015_ES3` | **Complete** |
| 3 | Non-collapse witnesses | `SPEC_016_ES4` | **Complete** (`StratifiedSentenceModel`) |

**Closure record:** [`../SPEC_033_K7A_FORMAL_TRANCHE_CLOSURE.md`](../SPEC_033_K7A_FORMAL_TRANCHE_CLOSURE.md).

## Cross-links

- Master roll-up: [`../../MASTER_STATUS.md`](../../MASTER_STATUS.md)
- Queue: [`../../../../QUEUE.md`](../../../../QUEUE.md)
- Theorem inventory: [`../../../../docs/THEOREM_INVENTORY.md`](../../../../docs/THEOREM_INVENTORY.md)
