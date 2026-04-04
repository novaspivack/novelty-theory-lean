# 004 — Lean library layout (novelty-theory-lean)

**Purpose:** Describe how Lake, modules, and repository metadata fit together.

## Repository role

This repository **is** the **novelty-theory-lean** library. Lean sources, `lakefile.lean`, and `lean-toolchain` live at the **repo root**. A separate repository may add this project as a **`git submodule`**; maintainer notes on that pattern live in **[novelty-theory](https://github.com/novaspivack/novelty-theory)** (`NOTES/PROJECT_SEED.md` there).

## Lake

| File | Role |
|------|------|
| [`lean-toolchain`](../lean-toolchain) | Pin to `leanprover/lean4:v4.29.0-rc6` — see [`003_LEAN_TOOLCHAIN_PIN.md`](003_LEAN_TOOLCHAIN_PIN.md) |
| [`lakefile.lean`](../lakefile.lean) | Package `«novelty-theory-lean»`, Mathlib **last** (same pin as `ugp-lean`), `lean_lib «NoveltyTheory»` indexed from root **[`NoveltyTheory.lean`](../NoveltyTheory.lean)** (Lake 5 / `ugp-lean` pattern) |
| [`lake-manifest.json`](../lake-manifest.json) | Locked dependency revisions (commit after `lake update` / successful build) |

**CI / cache:** Workflow [`.github/workflows/ci.yml`](../.github/workflows/ci.yml) uses [`leanprover/lean-action`](https://github.com/leanprover/lean-action). Locally, `lake exe cache get` pulls Mathlib artifacts when needed.

## Source layout

```text
NoveltyTheory.lean         # Lake root module (imports NoveltyTheory.All)
NoveltyTheory/
  All.lean                 # aggregate import (library body entry)
  Basic.lean               # thin shim importing All
  Core/                    # definitions (generative system, phase, regime, reduction, shift, tower)
  Foundation/              # small lemmas
  Models/                  # SignatureTower, InvariantTower, ReducerDiagonal, DupRegimeTower, BoundedRegimeDiagonal, SimulationVersusExplanation, …
  Ridge/                   # ShiftWitness, DiagonalNat, InterfaceAlignment, SignatureAdmissibleBundle, OrganizationHeightObstruction, RetroStructuralGap, …
  Summits/                 # summit packaging (incl. crown completion summits)
MANIFEST.md                # proof hygiene + module roll-up
```

Extend imports in **`NoveltyTheory/All.lean`**, keep **[`MANIFEST.md`](../MANIFEST.md)** and **[`THEOREM_INVENTORY.md`](THEOREM_INVENTORY.md)** current.

## Docs and specs (not Lean sources)

- **`docs/`** — developer reference (this file, setup, toolchain pin).
- **Companion [`novelty-theory/specs`](https://github.com/novaspivack/novelty-theory/tree/main/specs)** — normative work specs; cite as **`SPEC_NNN_XXX`**.

---

_Keep this doc aligned with `lakefile.lean` and the active epic in the companion [`specs/INCOMPLETE/IN-PROCESS/`](https://github.com/novaspivack/novelty-theory/tree/main/specs/INCOMPLETE/IN-PROCESS/) tree._
