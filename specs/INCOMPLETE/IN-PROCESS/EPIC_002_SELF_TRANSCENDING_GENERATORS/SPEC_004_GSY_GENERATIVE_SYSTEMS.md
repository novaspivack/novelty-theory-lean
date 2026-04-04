# SPEC_004_GSY — Generative systems and trajectories

**Cite as:** **`SPEC_004_GSY`**.

## Status

**Draft** — definitions to implement under [`SPEC_003_RCT`](SPEC_003_RCT_REPO_CONTRACT.md).

## Problem

The flagship theorems quantify over a **single finitely specified** generator whose **causal** dynamics produce an infinite tower of phases. The Lean library needs a crisp, deterministic discrete-time layer that is general enough for later models (signature tower, reducer diagonal, upward necessity).

## Requirements

1. **`GenerativeSystem`** — Structure (or class) capturing at minimum:
   - state type `S`,
   - initial state `s₀ : S`,
   - transition `τ : S → S` (deterministic single-step; extensions to partial or staged transitions must not block this baseline),
   - observation map `out : S → X` for emitted outputs in type `X`.

2. **Trajectory** — Iterates `τⁿ(s₀)`; optional API for finite prefixes and the full trace as a stream or function `ℕ → S` (choose idiomatic Mathlib-friendly representations).

3. **Emitted trace** — `ℕ → X` given by `out ∘ τⁿ(s₀)`.

4. **Finitely specified (documentation)** — The spec does not fix encoding; later specs (**`SPEC_009_DST`**, **`SPEC_012_MDL`**) may require a concrete **`Fintype` / `Encodable`** / staging interface. This spec must state extension points where a “finite presentation” hook attaches without smuggling diagonal arguments into the base definition.

5. **`GeneratedBy` placeholder** — A relation between the generator and **phases** is fully defined in **`SPEC_007_PIN`**; this spec may introduce a name and type signatures that **`SPEC_007_PIN`** refines.

## Acceptance criteria

- [ ] `GenerativeSystem` (or equivalent) compiles and supports trajectory lemmas used by phases (`SPEC_007_PIN`).
- [ ] No proof of “self-transcendence” appears at this layer—only generic dynamical facts.
- [ ] Module placement per **`SPEC_003_RCT`** (e.g. `NoveltyTheory/Core/GenerativeSystem.lean`).

## Dependencies

- **`SPEC_003_RCT`**.

## Out of scope

- Stochastic dynamics, continuous time, hybrid systems (unless a follow-on spec extends this file).
