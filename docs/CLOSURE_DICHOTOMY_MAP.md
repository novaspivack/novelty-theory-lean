# Closure / non-closure dependency map

**Layer status:** baseline closed — numeric dichotomy, conservative-separation witness, and universal-`FutureDefeat` obstruction are in-tree; **regime-level** lifts remain open below.

## Numeric observation layer (landed)

```
Models.StratifiedFinality.FutureDefeat
        ⇕  (Ridge.ClosureCollapseBoundary.not_futureDefeat_iff_existsBoundedNumericTrace)
Core.ClosureDichotomy.ExistsBoundedNumericTrace
```

**Disjunctive law:** `futureDefeat_or_existsBoundedNumericTrace` — exactly one disjunct need **not** hold constructively; classically the dichotomy is exhaustive for `Prop`.

**Corollary packaging:**

- `collapse_bounded_trace_implies_not_futureDefeat`
- `noncollapse_futureDefeat_of_unbounded`

## Not yet lifted (open)

- Equivalence or partial equivalence with **regime-level** final closure (`Tower`, `FinalCrownPackage`, `GeneralizedFinalCrownPackage`).
- Alignment with **`NaturalAntiClosure`** / **`UnboundedOrganization`** predicates under **`NaturalAdmissibleInstance`**.

## Summit re-exports

- `Summits.ClosureDichotomySummit.closure_dichotomy_numeric_trace`
- `Summits.ClosureDichotomySummit.finality_boundary_iff_bounded`

## Universal upward necessity — numeric obstruction (landed)

Not every lawful `GenerativeSystem S ℕ` satisfies `FutureDefeat`; a constant numeric trace is a counterexample. Formal refutation:

- `Ridge.UniversalUpwardNecessity.upward_necessity_universal_obstruction`
- `Summits.UniversalUpwardNecessitySummit.upward_necessity_universal_obstruction`

(Contrast: `Models.StratifiedFinality.natCounter_futureDefeat` and crown re-exports for **witness** systems.)

## Paradigm packaging — conservativity load-bearing (landed)

Packaged `ParadigmShift` is equivalent to a weak step **and** `ConservativeOver` on the same history; the weak conjuncts **without** conservativity need not yield a packaged shift:

- `Core.MinimalHypotheses.paradigmShift_iff_weak_and_conservative`
- `Ridge.ConservativeSeparationCountermodel.countermodel_without_history_conservativity`

See also [`NoveltyTheory/docs/MINIMALITY_AUDIT.md`](../NoveltyTheory/docs/MINIMALITY_AUDIT.md).

---

_Update alongside new lemmas in `Ridge/ClosureCollapseBoundary.lean`, `Ridge/UniversalUpwardNecessity.lean`, `Ridge/ConservativeSeparationCountermodel.lean`, and the minimality / upward-necessity packaging modules they connect to._
