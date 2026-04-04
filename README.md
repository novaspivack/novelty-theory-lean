# novelty-theory-lean

**Lean 4** formalization with a machine-checked companion paper (“generalized crown” final draft under `paper/Final Draft/`).

- **Lean:** Mathlib **`v4.29.0-rc6`**, toolchain in [`lean-toolchain`](lean-toolchain) — [`docs/003_LEAN_TOOLCHAIN_PIN.md`](docs/003_LEAN_TOOLCHAIN_PIN.md).
- **Paper:** `paper/Final Draft/novelty_theory_generalized_crown.tex` and `refs.bib`. Build from that directory: [`paper/Final Draft/COMPILE.md`](paper/Final%20Draft/COMPILE.md).
- **Maps:** [`MANIFEST.md`](MANIFEST.md), [`docs/THEOREM_INVENTORY.md`](docs/THEOREM_INVENTORY.md), [`docs/000_INDEX.md`](docs/000_INDEX.md).

## Quick start

```bash
lake exe cache get   # optional; Mathlib oleans
lake build
```

More detail: [`docs/002_DEVELOPER_SETUP.md`](docs/002_DEVELOPER_SETUP.md).

## Layout

- **`NoveltyTheory/`** — library (`NoveltyTheory.lean` is the Lake root import)
- **`paper/Final Draft/`** — LaTeX sources for the companion paper
- **`docs/`** — build setup, toolchain, theorem inventory, dependency/positioning notes for readers of the library
- **`scripts/`** — optional checks (e.g. `\leanref` strings vs Lean sources)

## Submodule

Embedding this repo as a **`git submodule`** still pulls **this** upstream; do not republish or bundle the sources elsewhere except as permitted in [`LICENSE`](LICENSE).

## Contributing

Use **Issues** for build problems, citation questions, or reproducibility. Substantive formal contributions should match the proof standards described in [`MANIFEST.md`](MANIFEST.md) and module docstrings. By contributing changes to the **Lean sources**, you grant the copyright holder the rights needed to include your contribution in this project under the same [`LICENSE`](LICENSE) terms (the project itself is **not** open redistribution).

## License

**MIT and similar OSI licenses allow redistribution.** This library is **not** offered on those terms.

| Material | Terms |
|----------|--------|
| **Lean library** (original work: `NoveltyTheory/`, `NoveltyTheory.lean`, `lakefile.lean`, `scripts/`, etc.) | [**Proprietary — see `LICENSE`**](LICENSE): you may **use** (clone, build, study, local changes for yourself); you may **not** **redistribute** the code or use it commercially without permission from the copyright holder. **Mathlib and other deps:** their licenses apply to those components only. |
| **Companion paper** (`paper/Final Draft/`) | [**CC BY-NC-ND 4.0**](paper/Final%20Draft/LICENSE) — separate terms for the paper only. |
| **Dependencies** (e.g. Mathlib) | **Upstream licenses** (Mathlib is Apache-2.0). |
