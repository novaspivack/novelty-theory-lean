# Documentation index

Documentation shipped **with the library**: setup, toolchain, layout, theorem list, and reader-facing positioning notes. Authoritative mathematical content is in **`NoveltyTheory/`** and in the companion paper under **`paper/Final Draft/`**.

## Read first

1. [`001_PROJECT_OVERVIEW.md`](001_PROJECT_OVERVIEW.md)
2. [`002_DEVELOPER_SETUP.md`](002_DEVELOPER_SETUP.md) — Elan, `lake build`, paper build
3. [`003_LEAN_TOOLCHAIN_PIN.md`](003_LEAN_TOOLCHAIN_PIN.md)
4. [`004_LEAN_LIBRARY_LAYOUT.md`](004_LEAN_LIBRARY_LAYOUT.md)

## CI and paper checks

- [`.github/workflows/ci.yml`](../.github/workflows/ci.yml) — Lean + Lake CI
- [`scripts/verify_paper_leanrefs.py`](../scripts/verify_paper_leanrefs.py) — optional `\leanref{NoveltyTheory…}` check for the final-draft TeX
- [`paper/Final Draft/COMPILE.md`](../paper/Final%20Draft/COMPILE.md) — LaTeX build from the correct working directory

## Reference docs

| Doc | Description |
|-----|-------------|
| [001_PROJECT_OVERVIEW.md](001_PROJECT_OVERVIEW.md) | What this library is |
| [002_DEVELOPER_SETUP.md](002_DEVELOPER_SETUP.md) | Build and bump process |
| [003_LEAN_TOOLCHAIN_PIN.md](003_LEAN_TOOLCHAIN_PIN.md) | Pinned Lean / Mathlib |
| [004_LEAN_LIBRARY_LAYOUT.md](004_LEAN_LIBRARY_LAYOUT.md) | Lake layout, module shape |
| [THEOREM_INVENTORY.md](THEOREM_INVENTORY.md) | Catalog of main `theorem` / `lemma` declarations |
| [007_LIBRARY_POSITIONING_ASSESSMENT.md](007_LIBRARY_POSITIONING_ASSESSMENT.md) | How the inventory situates the library |
| [CROWN_POSITIONING.md](CROWN_POSITIONING.md) | Crown claims and boundaries |
| [CROWN_DEPENDENCY_MAP.md](CROWN_DEPENDENCY_MAP.md) | Crown-related import DAG |
| [GENERALIZED_CROWN_POSITIONING.md](GENERALIZED_CROWN_POSITIONING.md) | Generalized crown layer |
| [GENERALIZED_CROWN_DEPENDENCY_MAP.md](GENERALIZED_CROWN_DEPENDENCY_MAP.md) | Import DAG for generalized crown |
| [STRENGTHENED_CLAIM_SURFACE.md](STRENGTHENED_CLAIM_SURFACE.md) | Claim ↔ Lean table (broad transfer layer) |
| [STRENGTHENED_DEPENDENCY_MAP.md](STRENGTHENED_DEPENDENCY_MAP.md) | Import spine for that layer |
| [CANONICALITY_POSITIONING.md](CANONICALITY_POSITIONING.md) | Canonicality / minimality ledger |
| [CLOSURE_DICHOTOMY_MAP.md](CLOSURE_DICHOTOMY_MAP.md) | Closure / dichotomy boundary map |
