# EPIC_001 — Novelty theory (Lean)

**Goal:** Formal Lean 4 library **`novelty-theory-lean`**: toolchain alignment, Mathlib pin, module layout, and rigorous development per **`CODING_PROTOCOLS.md`** proof discipline.

## Scope

- Lake project, default library `NoveltyTheory`, expanding `NoveltyTheory/` (and future roots if added in `lakefile.lean`).
- Documentation, specs, and registries in the **same** repository (standalone Lean library repo).

## Out of scope (unless a later spec says otherwise)

- Parent prose repo or paper PDFs (those repos may submodule **this** library per [`NOTES/PROJECT_SEED.md`](../../../../NOTES/PROJECT_SEED.md) §7.3).

## Dependencies

- **Mathlib** tag `v4.29.0-rc6` (matches [`docs/003_LEAN_TOOLCHAIN_PIN.md`](../../../docs/003_LEAN_TOOLCHAIN_PIN.md)).

## Living progress

| Phase | Status | Notes |
|-------|--------|-------|
| Phase 0 — Repository bootstrap | ✅ | **SPEC_001_ST1** (initial commit) |
| Phase 1 — Core theory modules | ⬜ | Owned by [`EPIC_002_SELF_TRANSCENDING_GENERATORS`](../EPIC_002_SELF_TRANSCENDING_GENERATORS/EPIC_002_MASTER_ORCHESTRATION.md); bootstrap epic stays toolchain + manifest |

## Queue — ordered next steps

| # | Task | Spec / pointers | Status |
|---|------|------------------|--------|
| 1 | Satisfy **SPEC_001_ST1** (Lake, manifest, docs) | [SPEC_001_ST1_REPOSITORY_BOOTSTRAP.md](SPEC_001_ST1_REPOSITORY_BOOTSTRAP.md) | Done |
| 2 | Mathematical development | [EPIC_002_MASTER_ORCHESTRATION.md](../EPIC_002_SELF_TRANSCENDING_GENERATORS/EPIC_002_MASTER_ORCHESTRATION.md) — **`SPEC_003_RCT`** onward | Open |

## Cross-links

- Cross-epic queue: [`../../../../QUEUE.md`](../../../../QUEUE.md)
- Methodology: [`../../../../NOTES/PROJECT_SEED.md`](../../../../NOTES/PROJECT_SEED.md)
- Layout: [`../../../../docs/004_LEAN_LIBRARY_LAYOUT.md`](../../../../docs/004_LEAN_LIBRARY_LAYOUT.md)
- Manifest: [`../../../../MANIFEST.md`](../../../../MANIFEST.md)

## Completed / dropped

_Fill as phases close._
