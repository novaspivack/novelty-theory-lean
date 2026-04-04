The next epics should be built around the two hard constraints your current library has already forced: raw `AdmissibleInterface` is too weak because the trivial interface blocks a literal global diagonal, and arbitrary `RegimeFamilySingletonWithin` is too weak because `emptyRegime` blocks a universal paradigm-chain claim; the real research openings are now the richer sentence universe and a universal notion of adequate organization. 

**Formal spec IDs in-repo:** the epics below are realized under `specs/INCOMPLETE/IN-PROCESS/` as **`SPEC_013_ES1`** through **`SPEC_032_SVE3`** (six epic folders **`EPIC_003`**–**`EPIC_008`**). Numbers **`SPEC_012_*`** remain reserved for **`SPEC_012_MDL`** (model ladder).

````md id="o17v0a"
# Next epics — novelty-theory-lean

## Strategic position

The next wave should **not** try to re-prove stronger prose versions of goals already shown false in Lean.
It should instead do three things:

1. **Add the missing expressive/proof-theoretic layer** so that “later regimes are needed to explain the generator itself” becomes an actual formal target rather than a slogan.
2. **Lift the present tower/diagonal machinery from phase adequacy to generator-truth expressibility and derivability.**
3. **Define a universal-but-honest organization class** whose admissibility is strong enough to avoid trivial counterexamples, but weak enough to support a real no-final-internal-theory theorem.

That means the correct next epics are not just “more S6–S10.”
They are a new formal layer above the current tower/diagonal package.

---

# Epic ordering

## Immediate sequence

1. **EPIC_003_EXPRESSIVE_STRATA_AND_SENTENCE_UNIVERSE**
2. **EPIC_004_UPWARD_EXPLANATORY_NECESSITY**
3. **EPIC_005_ADEQUATE_ORGANIZATION_AND_INFINITE_INTERNAL_HIERARCHY**
4. **EPIC_006_NO_SELF_CERTIFIED_FINALITY**
5. **EPIC_007_RETRO_REVELATION_STRONG**
6. **EPIC_008_SIMULATION_VS_EXPLANATION_ABSTRACT**

## Parallel rule

- **EPIC_003** must come first.
- **EPIC_004** depends on EPIC_003.
- **EPIC_005** depends on EPIC_003 and should reuse EPIC_004 notions where appropriate.
- **EPIC_006** depends on EPIC_005.
- **EPIC_007** depends on EPIC_003 and benefits from EPIC_004.
- **EPIC_008** can run partly in parallel after EPIC_003, but its strongest summit-facing packaging should wait for EPIC_005.

---

# EPIC_003_EXPRESSIVE_STRATA_AND_SENTENCE_UNIVERSE

## Folder
`INCOMPLETE/IN-PROCESS/EPIC_003_EXPRESSIVE_STRATA_AND_SENTENCE_UNIVERSE/`

## Purpose

Replace the current `CounterFact.geOutput`-level retro package with a genuinely richer sentence universe and regime-indexed semantic/derivability strata.

This epic is the bridge from:
- “phase/regime adequacy”
to
- “generator-truth expressibility / derivability / semantic availability.”

Without this epic, the project cannot honestly prove the strongest Wave 2 claims.

## Why this epic exists

Your inventory already says the current research-grade open problem is a **richer sentence universe** with **inequivalent semantic strata**. That is exactly the missing layer needed for real upward explanatory necessity. Current `CounterFact`-style results are useful, but they are still too close to a single narrow calculus. :contentReference[oaicite:1]{index=1}

## Core design targets

### New primitives

Introduce a new sentence universe, tentatively:

- `NoveltyTheory/Core/Sentence.lean`
- `NoveltyTheory/Core/SentenceSyntax.lean`
- `NoveltyTheory/Core/SentenceSemantics.lean`
- `NoveltyTheory/Core/SentenceExpressibility.lean`

The universe should support at least:

1. atomic phase facts
2. atomic generator / trajectory facts
3. historical-reference facts
4. quantification over stages or bounded windows
5. compositional connectives
6. regime-indexed sentence licensing / expressibility

### Required relations

Define at minimum:

- `ExpressibleAt : ExplanatoryRegime → Sentence → Prop`
- `HoldsAt : GenerativeSystem → Sentence → Prop`
- `ProvesAt : ExplanatoryRegime → Sentence → Prop`

and prove the basic coherence facts:

- `proves_implies_expressible`
- `proves_sound`
- `expressibility_mono`
- `proof_mono` where appropriate
- conservative embedding of `CounterFact.geOutput`

### Semantic strata

The central requirement is that strata be **genuinely inequivalent**, not merely renamed depth indices.

So the epic must include explicit witnesses of non-collapse:

- sentences expressible at depth `n+1` but not at `n`
- or derivable at `n+1` but not at `n`
- with soundness into actual truths about the generator / trace

This is the point of the epic.

## Required specs

### `SPEC_012_ESU1_SENTENCE_UNIVERSE.md`
Defines the new `Sentence` type and syntax constructors.

### `SPEC_013_ESU2_STRATIFIED_SEMANTICS.md`
Defines `HoldsAt`, `ExpressibleAt`, `ProvesAt`, and regime-indexed semantics.

### `SPEC_014_ESU3_COUNTERFACT_EMBEDDING.md`
Requires a conservative embedding of the current `CounterFact.geOutput` fragment.

### `SPEC_015_ESU4_NONCOLLAPSE_WITNESSES.md`
Requires explicit non-collapse theorems witnessing that strata are not definitionally or extensionally trivial.

## Lean modules

### Core
- `NoveltyTheory/Core/Sentence.lean`
- `NoveltyTheory/Core/SentenceSemantics.lean`
- `NoveltyTheory/Core/Expressibility.lean`
- `NoveltyTheory/Core/Provability.lean`

### Foundation
- `NoveltyTheory/Foundation/SentenceFacts.lean`
- `NoveltyTheory/Foundation/ProvabilityFacts.lean`

### Models
- `NoveltyTheory/Models/StratifiedSentenceModel.lean`

## Acceptance criteria

### A. Syntax / semantics
- `Sentence` defined and nontrivial
- `HoldsAt`, `ExpressibleAt`, `ProvesAt` defined
- old `CounterFact` fragment embedded

### B. Soundness / monotonicity
- `proves_sound`
- `expressibility_mono`
- `proves_mono` or carefully limited monotonicity theorem

### C. Non-collapse
At least one theorem family of the form:

- `exists_sentence_expressible_at_succ_not_at`
- `exists_sentence_provable_at_succ_not_at`

### D. No cheating
No theorem may rely on merely building the desired answer into the definition of “expressible.”
The expressibility notion must be structurally tied to actual regime resources.

## Non-goals

- no universal “adequate organization” theorem yet
- no self-certified-finality theorem yet
- no giant modal/proof-theoretic explosion
- no philosophically overloaded syntax beyond what the summits need

---

# EPIC_004_UPWARD_EXPLANATORY_NECESSITY

## Folder
`INCOMPLETE/IN-PROCESS/EPIC_004_UPWARD_EXPLANATORY_NECESSITY/`

## Purpose

Turn the new expressive layer into genuine Wave 2 summit theorems:

> later generated regimes are needed to express or prove structural truths about the generator itself.

This is the true crown-summit branch.

## Why this epic exists

The current Summit IV and S7 templates already gesture toward depth-strict derivability and retro packages, but they stop short of the strongest generator-level inversion. This epic closes that gap. :contentReference[oaicite:2]{index=2}

## Core theorem family

The north-star theorem for this epic should be a formal version of:

```latex
\exists G,\exists(R_n),\exists(\Phi_n)\;
\forall n,\;
R_{n+1}\vdash \Phi_n
\;\wedge\;
R_n \not\vdash \Phi_n,
````

where each `Φ_n` is a structural truth about the trajectory, phase architecture, or admissible explanatory behavior of `G`.

## Required specs

### `SPEC_016_UEN1_GENERATOR_STRUCTURAL_TRUTHS.md`

Defines the class of generator-structural truths eligible for the summit.

### `SPEC_017_UEN2_UPWARD_NECESSITY.md`

Formal summit spec for later-regime necessity.

### `SPEC_018_UEN3_EXPLANATORY_ORDER.md`

Defines explanatory dependence/order and its relation to generative order.

## Lean modules

### Core

* `NoveltyTheory/Core/GeneratorTruth.lean`
* `NoveltyTheory/Core/ExplanatoryOrder.lean`

### Ridge

* `NoveltyTheory/Ridge/GeneratorTruthEscalation.lean`
* `NoveltyTheory/Ridge/ExplanatoryOrderDivergence.lean`

### Summits

* `NoveltyTheory/Summits/UpwardExplanatoryNecessity.lean`

## Theorem targets

### Ridge

* `exists_generator_truth_not_provable_at_base`
* `truth_escalates_to_later_regime`
* `explanatory_order_not_subsumed_by_generative_order`

### Summits

* `upward_explanatory_necessity`
* `generated_regimes_needed_for_generator_truths`
* `causal_and_explanatory_orders_diverge_strong`

## Acceptance criteria

### A. Generator truths are real

Theorems must talk about actual truths of the generator, not just arbitrary sentences.

### B. Strictness

Need at least one theorem family with strict regime gap:

* provable later,
* not provable earlier.

### C. Source-directedness

At least one summit theorem must be explicitly about truths of the generator itself, not merely phase-local facts.

### D. Interpretive strength

The docs may legitimately state:

* a deterministic generator may require later generated regimes for some structural explanations of itself.

## Non-goals

* no universal “every deterministic system” claim
* no rhetoric about metaphysical anti-determinism
* no appeal to backward causation

---

# EPIC_005_ADEQUATE_ORGANIZATION_AND_INFINITE_INTERNAL_HIERARCHY

## Folder

`INCOMPLETE/IN-PROCESS/EPIC_005_ADEQUATE_ORGANIZATION_AND_INFINITE_INTERNAL_HIERARCHY/`

## Purpose

Define the first honest universal class of “adequate organizations” and prove that finite internal hierarchy is insufficient for total organization of the future.

This is the route to the strongest S10-style theorem that is not destroyed by trivial interfaces.

## Why this epic exists

Your inventory explicitly marks this as still open: a single universal notion of “adequate organization” such that only infinite internal hierarchy can explain all future observables. The current `ExplainsEntireSingletonLadder` / finite-signature templates are important footholds but not the final theorem form. 

## Core design problem

The class must be:

* universal enough to be interesting,
* structured enough to exclude trivial “everything explains everything” counterexamples,
* compatible with the current diagonal/tower machinery,
* abstract enough to support future generalization beyond signature singletons.

## Required specs

### `SPEC_019_AO1_ADEQUATE_ORGANIZATION.md`

Defines `AdequateOrganization` as bundled data with soundness/nontriviality built in.

### `SPEC_020_AO2_TOTAL_FUTURE_ORGANIZATION.md`

Defines when an organization explains/organizes all future observables of a generator.

### `SPEC_021_AO3_INTERNAL_HIERARCHY.md`

Defines internal hierarchy, finite hierarchy, infinite hierarchy, and the criterion linking hierarchy depth to explanatory coverage.

### `SPEC_022_AO4_UNIVERSAL_NO_FINITE_ORGANIZATION.md`

Summit spec: no finite adequate organization captures the full future of the relevant generator family.

## Lean modules

### Core

* `NoveltyTheory/Core/AdequateOrganization.lean`
* `NoveltyTheory/Core/InternalHierarchy.lean`

### Ridge

* `NoveltyTheory/Ridge/OrganizationDiagonal.lean`
* `NoveltyTheory/Ridge/FiniteHierarchyObstruction.lean`

### Summits

* `NoveltyTheory/Summits/NoFiniteAdequateOrganization.lean`

## Theorem targets

### Ridge

* `finite_hierarchy_has_bounded_reach`
* `organization_diagonal_defeats_finite_height`
* `total_future_organization_requires_unbounded_height`

### Summits

* `no_finite_adequate_organization_for_full_future`
* `only_infinite_internal_hierarchy_can_totalize`
* `no_final_internal_theory_organization_form`

## Acceptance criteria

### A. Honest universality

Quantification is over a bundled, admissible class, not raw unconstrained interfaces.

### B. Strict strengthening over current S10 template

The epic must genuinely go beyond the current singleton-ladder/finite-signature theorem.

### C. Clear dependency story

The docs must show exactly how this new organization class relates to:

* `SignatureAdmissibleInterface`
* `ExplainsEntireSingletonLadder`
* current diagonal theorems
* current obstruction theorems

### D. Reusability

The organization notion should be reusable for later non-signature models.

## Non-goals

* no overgeneralized claim about all conceivable organization notions
* no vague appeal to “hierarchy” without precise internal definition

---

# EPIC_006_NO_SELF_CERTIFIED_FINALITY

## Folder

`INCOMPLETE/IN-PROCESS/EPIC_006_NO_SELF_CERTIFIED_FINALITY/`

## Purpose

Prove that no stage/regime/organization can validly certify itself as terminal for the future generated tower.

This is the closest direct analogue to an explanatory incompleteness / anti-finality theorem.

## Why this epic exists

Once EPIC_005 defines a real organization class, the natural next move is to show that no adequate stage can close itself off as final. This is one of the strongest Gödel-adjacent summit shapes available in the current research line.

## Required specs

### `SPEC_023_NSF1_TERMINALITY_PREDICATE.md`

Defines `TerminalForFuture` and `CertifiesTerminality`.

### `SPEC_024_NSF2_SELF_CERTIFICATION_OBSTRUCTION.md`

Specifies the anti-terminality theorem shape.

### `SPEC_025_NSF3_FUTURE_DEFEAT.md`

Requires explicit future-stage witnesses defeating any terminality claim.

## Lean modules

### Core

* `NoveltyTheory/Core/Terminality.lean`

### Ridge

* `NoveltyTheory/Ridge/FutureDefeat.lean`

### Summits

* `NoveltyTheory/Summits/NoSelfCertifiedFinality.lean`

## Theorem targets

### Ridge

* `future_stage_defeats_terminal_claim`
* `no_stage_proves_its_own_total_future_closure`

### Summits

* `no_self_certified_finality`
* `every_organization_face_future_defeat`
* `anti_terminality_of_self_transcending_generator`

## Acceptance criteria

### A. Nontrivial terminality notion

“Terminal” must mean more than “no immediate successor in one chosen chain.”

### B. Strong defeat theorem

For every admissible candidate of a specified class, some future stage defeats its claim.

### C. Tight interpretation

Docs may say:

* no admissible internal explanatory stage can certify itself as final over the generated future.

## Non-goals

* no direct analogy to formal arithmetical consistency statements unless actually formalized
* no informal “this is Gödel” language in theorem statements

---

# EPIC_007_RETRO_REVELATION_STRONG

## Folder

`INCOMPLETE/IN-PROCESS/EPIC_007_RETRO_REVELATION_STRONG/`

## Purpose

Upgrade retro revelation from the current derivability package to a stronger theorem family where later regimes reveal structural truths about earlier trace segments that were not even expressible or semantically stratified earlier.

This is the true paradigm-shift theorem.

## Why this epic exists

Current S7-style packages are valuable, but the inventory itself notes that the stronger revelation story requires a richer sentence universe and inequivalent semantic strata. This epic is the payoff of EPIC_003. 

## Required specs

### `SPEC_026_RRS1_RETRO_STRUCTURAL_TRUTHS.md`

Defines the class of retrospective truths about earlier history.

### `SPEC_027_RRS2_RETRO_EXPRESSIBILITY_GAP.md`

Specifies non-expressibility / non-provability earlier, expressibility/provability later.

### `SPEC_028_RRS3_RETRO_REVELATION_SUMMIT.md`

Packages the final summit theorem.

## Lean modules

### Ridge

* `NoveltyTheory/Ridge/RetroTruthEscalation.lean`
* `NoveltyTheory/Ridge/RetroExpressibilityGap.lean`

### Summits

* `NoveltyTheory/Summits/RetroRevelationStrong.lean`

## Theorem targets

### Ridge

* `exists_retro_truth_not_expressible_at_k`
* `later_regime_expresses_retro_truth`
* `later_regime_proves_retro_truth`

### Summits

* `strong_retro_revelation`
* `later_regimes_reveal_earlier_history_structure`

## Acceptance criteria

### A. Genuine strengthening over current S7 package

Must go beyond same-calculus depth shifts.

### B. Earlier-history target

At least one theorem must explicitly concern truths about earlier trace segments, not merely later stages.

### C. Semantic non-collapse

Later revelation must not be explainable away as pure definitional abbreviation.

---

# EPIC_008_SIMULATION_VS_EXPLANATION_ABSTRACT

## Folder

`INCOMPLETE/IN-PROCESS/EPIC_008_SIMULATION_VS_EXPLANATION_ABSTRACT/`

## Purpose

Elevate the current S9-style trace-coupling / observational-equivalence results into a broader theorem family showing that exact simulation or trace equivalence does not imply explanatory reduction.

This epic is essential if the project is to go clearly beyond computational irreducibility.

## Why this epic exists

You already have model-level results that same trace coupling does not imply back-reduction. The next move is to make that separation abstract, reusable, and summit-visible. 

## Required specs

### `SPEC_029_SVE1_TRACE_AND_SIMULATION.md`

Defines a hierarchy:

* same trace
* trace coupled
* observational equivalence
* simulation
* explanatory reduction

### `SPEC_030_SVE2_NONIMPLICATIONS.md`

Requires sharp non-implication theorems among these notions.

### `SPEC_031_SVE3_SUMMIT_PACKAGE.md`

Packages the strongest separation results.

## Lean modules

### Core

* `NoveltyTheory/Core/Simulation.lean`
* `NoveltyTheory/Core/ObservationalEquivalence.lean`

### Ridge

* `NoveltyTheory/Ridge/SimulationDoesNotReduce.lean`

### Summits

* `NoveltyTheory/Summits/SimulationVersusExplanation.lean`

## Theorem targets

### Ridge

* `trace_equivalence_not_explanatory_reduction`
* `simulation_not_uniform_explanation`
* `observational_equivalence_not_back_reduction`

### Summits

* `exact_generation_not_uniform_explanation`
* `simulation_neq_explanation`
* `same_trace_not_same_explanatory_power`

## Acceptance criteria

### A. Strict strengthening over existing S9 model facts

Need an abstract theorem family, not just one concrete counterexample.

### B. Clear relation to Wolfram-style irreducibility

Docs should explicitly distinguish:

* computational shortcut failure
  from
* explanatory non-reducibility.

### C. Reuse in papers

This epic should supply the cleanest formal answer to “how is this stronger than computational irreducibility?”

---

# Queue recommendation

## Queue immediately after current EPIC_002 tranche

### Queue 1

`EPIC_003_EXPRESSIVE_STRATA_AND_SENTENCE_UNIVERSE`

### Queue 2

`EPIC_004_UPWARD_EXPLANATORY_NECESSITY`

### Queue 3

`EPIC_005_ADEQUATE_ORGANIZATION_AND_INFINITE_INTERNAL_HIERARCHY`

## Queue after those three stabilize

### Queue 4

`EPIC_006_NO_SELF_CERTIFIED_FINALITY`

### Queue 5

`EPIC_007_RETRO_REVELATION_STRONG`

### Queue 6

`EPIC_008_SIMULATION_VS_EXPLANATION_ABSTRACT`

---

# What should not become a new epic

These should **not** be reopened as standalone positive-goal epics because the library already has honest obstructions:

1. a literal universal diagonal over all raw `AdmissibleInterface`
2. a literal infinite paradigm tower for every `RegimeFamilySingletonWithin`

Those now belong in:

* theorem inventory,
* docs boundaries,
* admissibility/obstruction discussion,
  not as future positive targets.

---

# Paper-facing summit map after these epics

## Wave 1 paper

Already supported / finishing:

* fixed generator
* infinite paradigm tower
* no fixed final explanatory regime
* bundled admissible diagonal
* obstruction theorems for naive universalizations

## Wave 2 paper

Enabled by EPIC_003 + EPIC_004:

* later generated regimes required for truths about the generator itself
* explanatory order diverges from generative order

## Wave 3 paper

Enabled by EPIC_005 + EPIC_006 + EPIC_007:

* only infinite internal hierarchy can totalize the future
* no self-certified final stage
* later regimes reveal truths about earlier history unavailable before

## Wave 4 paper

Enabled by EPIC_008:

* exact generation / simulation / observational equivalence do not collapse explanation
* direct separation from computational irreducibility

---

# Recommended next queue item

If choosing only one:

## `EPIC_003_EXPRESSIVE_STRATA_AND_SENTENCE_UNIVERSE`

because that is the enabling layer for every stronger, more paradoxical summit above the current library.

```

The single most important design decision in the next wave is this: make `Sentence`, `ExpressibleAt`, `HoldsAt`, and `ProvesAt` first-class objects before you try to prove anything stronger about “the generator needing its future regimes,” because without that layer the strongest statements remain interpretation rather than theorem.
```
