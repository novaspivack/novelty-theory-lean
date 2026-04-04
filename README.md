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

Other projects may embed this repo as a **`git submodule`** for **noncommercial** research or teaching consistent with [`LICENSE`](LICENSE). **Commercial** packaging, products, or redistribution beyond what that license allows needs **separate permission** from the copyright holder.

## Contributing

Use **Issues** for build problems, citation questions, or reproducibility. Substantive formal contributions should match the proof standards described in [`MANIFEST.md`](MANIFEST.md) and module docstrings. By contributing, you agree your contributions are licensed under the **same terms** as [`LICENSE`](LICENSE) for the library code you touch.

## License

This is **not** an OSI “open source” license (those cannot restrict commercial use). The library is **source-available** with **free noncommercial** use: personal work, research, and qualifying institutions are covered by [**PolyForm Noncommercial 1.0.0**](https://polyformproject.org/licenses/noncommercial/1.0.0/) as applied in [`LICENSE`](LICENSE), plus **attribution** when you **distribute** the code or public derivatives (see Required Notice lines there and cite the paper/repo as you would in scholarship).

| Material | Terms |
|----------|--------|
| **Lean library** (`NoveltyTheory/`, `NoveltyTheory.lean`, `lakefile.lean`, `scripts/`, etc.) | [**PolyForm Noncommercial 1.0.0**](LICENSE) — noncommercial use and sharing; **no** commercial sale or packaging **without permission**; **attribution** when distributing |
| **Companion paper** (`paper/Final Draft/`, TeX/Bib/figures) | [**CC BY-NC-ND 4.0**](paper/Final%20Draft/LICENSE) |
| **Dependencies** (e.g. Mathlib via Lake) | **Upstream licenses** (Mathlib is Apache-2.0) |
