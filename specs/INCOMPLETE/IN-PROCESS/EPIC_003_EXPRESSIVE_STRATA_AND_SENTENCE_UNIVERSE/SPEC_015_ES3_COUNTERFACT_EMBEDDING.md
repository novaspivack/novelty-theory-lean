# SPEC_015_ES3 — Counterfact embedding

**Cite as:** **`SPEC_015_ES3`**.

## Purpose

Conservatively embed **`InvariantTower.CounterFact`** (especially **`geOutput k`**) into **`Sentence`**, preserving **`factHolds`** and **`HoldsAt natCounter`** coherence.

## Requirements

- Total function **`sentenceOfCounterFact : CounterFact → Sentence ℕ`** (or typed generic).
- Theorem: **`HoldsAt natCounter (sentenceOfCounterFact f) ↔ InvariantTower.factHolds f`** (or `→`/`←` as appropriate per fragment).

## Acceptance

- Embedding is **definitionally** hookable from summit packaging.
- No redefinition of **`CounterFact`** semantics in the paper layer without proof.

## Lean module

- `NoveltyTheory/Foundation/ProvabilityFacts.lean` (embedding + coherence)
