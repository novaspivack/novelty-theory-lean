# SPEC_035_GS1 — Structural generator truth discipline

**Cite as:** **`SPEC_035_GS1`**.

## Purpose

Make precise what it means for a sentence \(\Phi\) to be a **structural truth about** a `GenerativeSystem` **carrier** and its **distinguished trace**, in a way that can support **iterated strict ascent** claims (`SPEC_037_CR1`) without **definition smuggling** or trivial **mention-bound** identification.

This spec is **predicate discipline only**: it fixes honesty conditions and separation lemmas; derivability across regimes is `SPEC_036_AR1`.

## Background

Existing hooks include generator-facing structural facts (`SPEC_017_UEN1`), counterfact embedding (`SPEC_015_ES3`), and stratified witnesses (`SPEC_016_ES4`, `StratifiedSentenceModel`). The crown target requires that the \(\Phi_n\) family is not dismissible as “only bookkeeping about formula size or mention indices.”

## Acceptance

1. **Lean:** A documented class or predicate family (names role-based, external-facing) capturing **intended** “about the generator/trace” — e.g. closure under generator primitives (`traceEq`, `geOutput`, phase/tag atoms permitted by grammar), plus an explicit **exclusion** or **orthogonal** classification for sentences ruled *out* of the crown family when they are **purely metalinguistic** in the formal sense adopted (no vague prose; state the criterion in Lean comments as precise hypotheses).

2. **Separation lemmas:** At least one **named** lemma or theorem distinguishing the adopted “structural” family from a clearly weaker predicate (e.g. bounded `mentionBound` alone, or a stated trivial subclass), so later crown theorems can cite **non-collapse** to mention-bound.

3. **Audit:** No new `sorry`; any incomplete step is `TODO` with a file pointer in [`docs/005_TODO_REGISTRY.md`](../../../../docs/005_TODO_REGISTRY.md) if it blocks downstream specs.

## Lean modules (expected)

- New file under `NoveltyTheory/Core` or `NoveltyTheory/Foundation` (or split), imported by `SPEC_036_AR1` / `SPEC_037_CR1` work.

## Dependencies

- **`SPEC_013_ES1`–`SPEC_018_UEN2`**, **`SPEC_033_K7A`** baseline.

## Status

**Implemented** — `NoveltyTheory/Foundation/StructuralGeneratorSentence.lean`.
