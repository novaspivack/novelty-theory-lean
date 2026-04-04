# SPEC_039_DT1 — Initial-tag derivability (`NatPhaseTag.initial`)

**Cite as:** **`SPEC_039_DT1`**.

## Purpose

Close the gap where **`NatPhaseTag.initial`** is **semantic-only** in `HoldsAt` while **`ProvesAt`** denies or omits the matching **derivability**—so stratified proof statements cannot yet refer to **initial-segment** naming at the proof fringe.

## Acceptance

1. **Lean:** Extend `ProvesAt` / proof rules (or a conservative extension with a **`ProvesAtExt`** predicate) so that **well-formed** sentences using the **initial** tag admit **non-trivial** provability lemmas **where true** on `natCounter`, mirroring the semantic `HoldsAt` behavior.

2. **Soundness:** Prove soundness for the new rules relative to `HoldsAt` on the canonical model (pattern after `proves_sentence_sound`).

3. **Non-collapse:** Show the extension does **not** trivialize existing **non-collapse** witnesses (adjust or restate witnesses if grammar changes require it).

## Dependencies

- **`SPEC_013_ES1`** (`NatPhaseTag`), **`SPEC_014_ES2`**, **`SPEC_015_ES3`**, **`SPEC_016_ES4`**.
