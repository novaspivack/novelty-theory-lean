# 007 — Library positioning (theorem inventory checkpoint)

This note records how the **current** [`THEOREM_INVENTORY.md`](THEOREM_INVENTORY.md) reshapes the informal story of the library: it is no longer well described only as a phase/regime adequacy or genotype–phenotype analogy. Lean names below are entry points into the catalog.

---

## 1. Beyond “genotype vs phenotype”

A genotype/phenotype picture is roughly: one compact generating level, one expressed level, and richer manifestation than code. The inventory now documents theorem families that go further:

| Theme | Example anchors (see inventory for full list) |
|--------|------------------------------------------------|
| Strict proof/expressibility gaps across strata | `StratifiedSentenceModel.exists_sentence_*`, summit packaging in `UnfoldingNecessitySummit` |
| No final `regimeUpto` for the tower | `SummitPackages` / `noFinalInternalTheory_signature_family` cluster |
| Future defeat / terminality obstruction | `NecessityStratifiedFinalitySummit.nat_counter_future_defeat`, `StratifiedFinality.terminality_impossible_strict_output_rise` |
| Causal vs explanatory order divergence | `SummitPackages.causal_generation_not_uniform_explanation` |
| Same trace / same observation without explanatory reduction | `SimulationVersusExplanationAbstract.observational_equiv_not_implies_trace_coupled`; model-layer `observational_eq_but_irreducible`, `trace_coupled_prod_not_reducible` |
| Retro structural truth / retro expressibility | `StrongRetroCausationSummit`, `Models.RetroStructuralTruth` |

Informally, the library is closer to: **fixed generator; multiple explanatory strata; strict provability/expression thresholds; no fixed final explanatory layer of the relevant class; nontrivial separation between observational sameness and explanatory reducibility.**

---

## 2. Wave 2 machinery (sentence / expressibility / provability)

Earlier, claims that “the generator needs later regimes” leaned partly on interpretation. The inventory shows a **sentence-level bridge**:

- `SentenceExpressibility.expressibleAtHeight_iff`
- `SentenceRegime.expressibleAt_regimeUpto_iff`
- `ProvabilityFacts.proves_sentence_sound` (and `mentionBound_le_of_proves` in the same layer)
- `UpwardNecessity.upward_necessity_geOutput`
- `StratifiedSentenceModel.exists_sentence_*`
- `UnfoldingNecessitySummit.upward_necessity_sentence`
- `UnfoldingNecessitySummit.exists_strict_provable_gap`

So the project is not confined to “later regimes explain later outputs.” It is moving toward **“later regimes are needed for certain truths”** (in the stratified proof sense made formal by `ProvesAt` and related predicates).

---

## 3. Standout clusters (paper-facing)

### A. Fixed generation without fixed explanatory closure

- `SummitPackages.causal_generation_not_uniform_explanation`
- `SummitPackages.noFinalInternalTheory_signature_family`

Core inversion: a **fixed** generator can generate the full visible story without there being a **fixed final** explanatory regime adequate to that story in the formal sense used in the summit layer.

### B. Simulation / observation does not collapse explanation

- `SimulationVersusExplanation.observational_eq_but_irreducible`
- `SimulationVersusExplanation.trace_coupled_prod_not_reducible`
- `SimulationVersusExplanationAbstract.observational_equiv_not_implies_trace_coupled`

This is **non-implication** from same behavior (or same observational abstraction) to explanatory reducibility—not only “no computational shortcut.”

### C. Finite-depth / terminality obstruction

- `StratifiedFinality.terminality_impossible_strict_output_rise`
- `NecessityStratifiedFinalitySummit.self_certification_obstruction`
- `NecessityStratifiedFinalitySummit.nat_counter_future_defeat`

Beyond “a stage fails somewhere”: **terminality** or **self-certification of finality** runs into obstruction in the stratified setup.

---

## 4. Defensible today vs crown summit still open

**Already defensible (in the formal sense of the library):** a deterministic/fixed generator can generate an infinite tower, defeat every fixed bounded explanatory layer of the relevant class, and exhibit sentence/provability gaps across strata (as listed in the inventory).

**Not yet the strongest conceivable “crown” formulation:** the limit statement where later generated regimes are **necessary for structural truths about the generator itself** in a way that **cannot** be redescribed as merely bounded mention-depth or current stratified proof height. The inventory and [`SPEC_034_R2B`](https://github.com/novaspivack/novelty-theory/blob/main/specs/INCOMPLETE/IN-PROCESS/SPEC_034_R2B_EPIC002_SCOPE_CLOSURE.md) still flag richer extensions (stronger organization predicates, further sentence/phase extensions, **etc.**) as open research directions.

---

## 5. One-sentence readings

```latex
\textbf{A fixed generator may determine its full trace without admitting any fixed final explanatory or proof-theoretic stratum adequate to that trace.}
```

```latex
\textbf{Explanatory and proof-theoretic access to a generated trace can strictly unfold in stages, with future strata defeating claims of terminality by earlier ones.}
```

---

## 6. Highest-value next target

The open frontier is pushing the sentence/provability layer from bounded-height obstruction, retro expressibility gaps, and terminality obstruction toward a **sharp** statement of iterated strict ascent—without collapsing it to a disguised mention-bound restatement.

A template for that “crown” shape:

```latex
\exists G,\exists(\Phi_n)\;
\forall n,\;
\Phi_n \text{ is a structural truth about } G
\;\wedge\;
R_{n+1}\vdash \Phi_n
\;\wedge\;
R_n \not\vdash \Phi_n.
```

Success there would mean theorems read as **genuine explanatory-incompleteness** results rather than only as stratified proof-height facts—the main quality bar for the next summit pass.

---

## Verdict

The full theorem inventory marks a **major strengthening**: it clears the “not just genotype/phenotype” bar and makes the **Wave 2** sentence bridge visible in one place. The remaining risk is not triviality of the analogy; it is **depth of the final crown theorems**—keeping them structurally honest under adversarial reading.

## Formal program (epics)

Normative specs for the **crown** template (§6) and for **inventory extensions** live under:

- [`EPIC_009_STRICT_ITERATED_ASCENT`](https://github.com/novaspivack/novelty-theory/blob/main/specs/INCOMPLETE/IN-PROCESS/EPIC_009_STRICT_ITERATED_ASCENT/EPIC_009_MASTER_ORCHESTRATION.md) — **`SPEC_035_GS1`**–**`SPEC_037_CR1`** (**v1** proved: `Summits/CrownIteratedAscentSummit.lean`)
- [`EPIC_010_EXPRESSIVE_ORGANIZATION_FRONTIER`](https://github.com/novaspivack/novelty-theory/blob/main/specs/INCOMPLETE/IN-PROCESS/EPIC_010_EXPRESSIVE_ORGANIZATION_FRONTIER/EPIC_010_MASTER_ORCHESTRATION.md) — **`SPEC_038_XS1`**–**`SPEC_041_OR1`** (v1 tranche closed)
