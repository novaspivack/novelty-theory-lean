# Documentation index

**Master map for novelty-theory-lean.** When you add, rename, or remove a doc under `docs/`, update this file in the same change.

## Read first (agents)

1. [`AGENTS.md`](../AGENTS.md)
2. [`QUEUE.md`](../QUEUE.md) — cross-epic queue + **agent execution contract**
3. [`NOTES/PROJECT_SEED.md`](../NOTES/PROJECT_SEED.md)
4. [`CODING_PROTOCOLS.md`](../CODING_PROTOCOLS.md) — Lean proof quality + execution discipline
5. [`.cursorrules`](../.cursorrules) / [`.cursor/rules/stub-agent-contract.mdc`](../.cursor/rules/stub-agent-contract.mdc)
6. This index — **001** overview, **002** setup, **004** library layout

## CI

- [`.github/workflows/ci.yml`](../.github/workflows/ci.yml) — `leanprover/lean-action` (Lean + Lake build)

## Numbered docs

| Doc | Description |
|-----|-------------|
| [001_PROJECT_OVERVIEW.md](001_PROJECT_OVERVIEW.md) | What this Lean library is and how it is organized |
| [002_DEVELOPER_SETUP.md](002_DEVELOPER_SETUP.md) | Elan, `lake build`, bump process |
| [003_LEAN_TOOLCHAIN_PIN.md](003_LEAN_TOOLCHAIN_PIN.md) | Canonical Lean 4 RC (`v4.29.0-rc6`) |
| [004_LEAN_LIBRARY_LAYOUT.md](004_LEAN_LIBRARY_LAYOUT.md) | Lake, `NoveltyTheory/`, manifest |
| [THEOREM_INVENTORY.md](THEOREM_INVENTORY.md) | Headline theorems (Summit I–IV, ridge, models) |
| [000.1_AI_CODING_BEST_PRACTICES.md](000.1_AI_CODING_BEST_PRACTICES.md) | Optional AI/agent workflow notes |
| [005_TODO_REGISTRY.md](005_TODO_REGISTRY.md) | Discrete TODOs tied to code locations |
| [006_TECHNICAL_DEBT_REGISTRY.md](006_TECHNICAL_DEBT_REGISTRY.md) | Larger follow-ups |
| [KEY_LEARNINGS.md](KEY_LEARNINGS.md) | Durable pitfalls and FAQs |

## Specs and status

- Roll-up: [`../specs/MASTER_STATUS.md`](../specs/MASTER_STATUS.md)
- Bootstrap epic: [`../specs/INCOMPLETE/IN-PROCESS/EPIC_001_NOVELTY_THEORY_LEAN/`](../specs/INCOMPLETE/IN-PROCESS/EPIC_001_NOVELTY_THEORY_LEAN/)
- Theory epic (self-transcending generators): [`../specs/INCOMPLETE/IN-PROCESS/EPIC_002_SELF_TRANSCENDING_GENERATORS/`](../specs/INCOMPLETE/IN-PROCESS/EPIC_002_SELF_TRANSCENDING_GENERATORS/)
- Theory seed: [`../specs/INCOMPLETE/IN-PROCESS/THEORY_SEED.md/002_OCN_ORIGINAL_CONCEPT.md`](../specs/INCOMPLETE/IN-PROCESS/THEORY_SEED.md/002_OCN_ORIGINAL_CONCEPT.md) (**`SPEC_002_OCN`**), [`../specs/INCOMPLETE/IN-PROCESS/THEORY_SEED.md/003_NXT_NEXT_WAVE.md`](../specs/INCOMPLETE/IN-PROCESS/THEORY_SEED.md/003_NXT_NEXT_WAVE.md) (**`SPEC_003_NXT`**)

## Reference packs (optional)

| Path | Note |
|------|------|
| [`../NOTES/CODING_PROTOCOLS_NEMS_SUITE.md`](../NOTES/CODING_PROTOCOLS_NEMS_SUITE.md) | NEMS / paper-suite reference (not required for this library) |
