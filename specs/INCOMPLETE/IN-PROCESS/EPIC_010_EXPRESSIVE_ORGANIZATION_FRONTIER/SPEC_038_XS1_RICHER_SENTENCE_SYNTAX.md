# SPEC_038_XS1 — Richer sentence syntax (phase atoms)

**Cite as:** **`SPEC_038_XS1`**.

## Purpose

Extend the **sentence universe** so that **phase** information beyond the current tag / singleton encodings can be expressed **without** illicit `Set ℕ` smuggling or definitions that presuppose the incompleteness theorems meant to follow.

This addresses the inventory open item: **richer phase-at-sentence** / **`Phase.outputSet`–grade** atoms, subject to **theorem economy** (new predicates minimally committal).

## Acceptance

1. **Design:** Written plan in the spec folder (this file’s “Progress” subsection updated in-repo) listing candidate constructors, conservativity or embedding maps from **`Sentence ℕ`** as of **`SPEC_013_ES1`**, and **failure modes** (size paradoxes, undecidable side conditions).

2. **Lean (minimal first tranche):** Definitions + at least one **non-vacuous** lemma showing the extension is **usable** (e.g. `HoldsAt`/`ProvesAt` clauses for a **tiny** new fragment, or a proof that the fragment embeds faithfully).

3. **No weak defaults:** If the full prose ambition is **not** yet formalizable, document the **exact** blocker and keep lemmas **honest** (no `sorry` in merged main; use `TODO` + registry if needed).

## Dependencies

- **`SPEC_013_ES1`**, **`SPEC_014_ES2`**, **`SPEC_016_ES4`**.
