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

Other projects may depend on this repository as a **`git submodule`**; treat this directory as the **library root**.

## Contributing

Use **Issues** for build problems, citation questions, or reproducibility. Substantive formal contributions should match the proof standards described in [`MANIFEST.md`](MANIFEST.md) and module docstrings. By contributing changes to the **Lean sources**, you agree that your contributions are licensed under the same terms as [`LICENSE`](LICENSE) (PolyForm Noncommercial 1.0.0) for distribution with this project.

## License

| Material | License |
|----------|---------|
| **Lean library** (`NoveltyTheory/`, `NoveltyTheory.lean`, `lakefile.lean`, `scripts/` as original work) | [**PolyForm Noncommercial 1.0.0**](LICENSE) — noncommercial use; you may use, modify, and distribute (noncommercially) subject to the license. **Commercial use is not permitted** for this original work. |
| **Companion paper** (`paper/Final Draft/`) | [**CC BY-NC-ND 4.0**](paper/Final%20Draft/LICENSE) — attribution; **no commercial use**; **no sharing of modified versions** of the paper. |
| **Dependencies** (e.g. Mathlib via Lake) | **Each dependency’s own license** (Mathlib is Apache-2.0). This repository’s licenses apply only to original work here. |
