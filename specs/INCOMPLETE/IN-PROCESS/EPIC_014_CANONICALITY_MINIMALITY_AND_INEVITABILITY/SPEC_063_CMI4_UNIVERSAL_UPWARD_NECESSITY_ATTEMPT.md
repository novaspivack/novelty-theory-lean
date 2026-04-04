# SPEC_063_CMI4 — Universal upward necessity attempt

**ID:** **`SPEC_063_CMI4`**  
**Epic:** **`EPIC_014_CANONICALITY_MINIMALITY_AND_INEVITABILITY`**

## Goal

Attempt the strongest statement: under **weak canonical** conditions, **upward explanatory necessity** is **forced** (not merely exhibited).

## Target shape (quantifiers = Lean)

\[
\forall G \in \mathcal{G}_{\mathrm{canon}},\;
\mathrm{WeakCanonicalConditions}(G)
\Rightarrow
\exists (\Phi_n),\;
\forall n,\;
\Phi_n \text{ structural about } G \land
R_{n+1}\vdash \Phi_n \land
R_n \not\vdash \Phi_n.
\]

## Fallback (required if universal fails)

- Broad subclass theorem; **or**
- **Dichotomy** for when upward necessity is forced; **or**
- **Obstruction** formalizing why universal form is false.

## Required artifacts

| Path | Role |
|------|------|
| [`NoveltyTheory/Ridge/UniversalUpwardNecessity.lean`](../../../../NoveltyTheory/Ridge/UniversalUpwardNecessity.lean) | Attempt + obstruction hooks |
| [`NoveltyTheory/Summits/UniversalUpwardNecessitySummit.lean`](../../../../NoveltyTheory/Summits/UniversalUpwardNecessitySummit.lean) | Package |

## Theorem targets

- `universal_upward_necessity_under_canonical_conditions` **or**
- `broad_class_upward_necessity` / `upward_necessity_dichotomy` **or**
- explicit **`upward_necessity_universal_obstruction`**

## Failure mode

Hiding impossibility of the universal statement without a formal obstruction.

## Status

**In progress** — `Ridge.UniversalUpwardNecessity` / `Summits.UniversalUpwardNecessitySummit` navigate to `histSeqUpto` strict gap; **universal** `∀ G` claim or obstruction **open**.
