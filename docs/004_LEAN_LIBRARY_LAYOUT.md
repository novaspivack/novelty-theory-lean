# 004 — Lean library layout (novelty-theory-lean)

**Purpose:** Describe how Lake, modules, and repository metadata fit together.

## Repository role

This directory **is** the **novelty-theory-lean** library. Lean sources, `lakefile.lean`, and `lean-toolchain` live at the **repo root**. Other projects may embed it as a **`git submodule`**.

## Lake

| File | Role |
|------|------|
| [`lean-toolchain`](../lean-toolchain) | Pin to `leanprover/lean4:v4.29.0-rc6` — see [`003_LEAN_TOOLCHAIN_PIN.md`](003_LEAN_TOOLCHAIN_PIN.md) |
| [`lakefile.lean`](../lakefile.lean) | Package `«novelty-theory-lean»`, Mathlib **last**, `lean_lib «NoveltyTheory»` indexed from root **[`NoveltyTheory.lean`](../NoveltyTheory.lean)** |
| [`lake-manifest.json`](../lake-manifest.json) | Locked dependency revisions (commit after `lake update` / successful build) |

**CI / cache:** [`.github/workflows/ci.yml`](../.github/workflows/ci.yml) uses [`leanprover/lean-action`](https://github.com/leanprover/lean-action). Locally, `lake exe cache get` pulls Mathlib artifacts when needed.

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

## Documentation

**`docs/`** holds setup, inventory, and reader-facing maps. It does **not** replace module docstrings or the formal text in **`NoveltyTheory/`**.

_Keep this doc aligned with [`lakefile.lean`](../lakefile.lean) and the module graph under **`NoveltyTheory/`**._
