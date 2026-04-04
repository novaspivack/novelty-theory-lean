# Closure / non-closure dependency map (EPIC_014)

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

---

_Update alongside new lemmas in `Ridge/ClosureCollapseBoundary.lean` and epic **`SPEC_062_CMI3`**._
