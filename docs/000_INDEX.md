# Documentation index

**Public map for novelty-theory-lean.** Normative specs and internal orchestration are in the sibling repository **[novelty-theory](https://github.com/novaspivack/novelty-theory)**.

## Read first

1. [`001_PROJECT_OVERVIEW.md`](001_PROJECT_OVERVIEW.md)
2. [`002_DEVELOPER_SETUP.md`](002_DEVELOPER_SETUP.md) — Elan, `lake build`, paper build
3. [`003_LEAN_TOOLCHAIN_PIN.md`](003_LEAN_TOOLCHAIN_PIN.md)
4. [`004_LEAN_LIBRARY_LAYOUT.md`](004_LEAN_LIBRARY_LAYOUT.md)

## CI and paper checks

- [`.github/workflows/ci.yml`](../.github/workflows/ci.yml) — `leanprover/lean-action` (Lean + Lake build)
- [`scripts/verify_paper_leanrefs.py`](../scripts/verify_paper_leanrefs.py) — optional cross-check of `\leanref{NoveltyTheory…}` in `paper/Final Draft/novelty_theory_generalized_crown.tex`
- [`paper/Final Draft/COMPILE.md`](../paper/Final%20Draft/COMPILE.md) — LaTeX build (`cwd`, BibTeX)

## Numbered and reference docs

| Doc | Description |
|-----|-------------|
| [001_PROJECT_OVERVIEW.md](001_PROJECT_OVERVIEW.md) | What this library is and how it is organized |
| [002_DEVELOPER_SETUP.md](002_DEVELOPER_SETUP.md) | Elan, `lake build`, bump process |
| [003_LEAN_TOOLCHAIN_PIN.md](003_LEAN_TOOLCHAIN_PIN.md) | Canonical Lean 4 RC |
| [004_LEAN_LIBRARY_LAYOUT.md](004_LEAN_LIBRARY_LAYOUT.md) | Lake, `NoveltyTheory/`, manifest |
| [THEOREM_INVENTORY.md](THEOREM_INVENTORY.md) | Catalog of `theorem` / `lemma` under `NoveltyTheory/` |
| [007_LIBRARY_POSITIONING_ASSESSMENT.md](007_LIBRARY_POSITIONING_ASSESSMENT.md) | How the inventory situates the library |
| [CROWN_POSITIONING.md](CROWN_POSITIONING.md) | Crown claims / boundaries |
| [CROWN_DEPENDENCY_MAP.md](CROWN_DEPENDENCY_MAP.md) | Crown-related dependency DAG |
| [GENERALIZED_CROWN_POSITIONING.md](GENERALIZED_CROWN_POSITIONING.md) | Generalized crown layer |
| [GENERALIZED_CROWN_DEPENDENCY_MAP.md](GENERALIZED_CROWN_DEPENDENCY_MAP.md) | Dependency DAG for generalized crown |
| [STRENGTHENED_CLAIM_SURFACE.md](STRENGTHENED_CLAIM_SURFACE.md) | Claim ↔ Lean table (broad transfer) |
| [STRENGTHENED_DEPENDENCY_MAP.md](STRENGTHENED_DEPENDENCY_MAP.md) | Summit DAG for strengthened layer |
| [CANONICALITY_POSITIONING.md](CANONICALITY_POSITIONING.md) | Canonicality / minimality ledger |
| [CLOSURE_DICHOTOMY_MAP.md](CLOSURE_DICHOTOMY_MAP.md) | Boundary / dichotomy map |

## Specs and epics (separate repo)

Orchestration, **`SPEC_NNN_XXX`** files, and theory seeds live under **[github.com/novaspivack/novelty-theory/specs](https://github.com/novaspivack/novelty-theory/tree/main/specs)**.

## Optional reference (maintainer repo)

NEMS / paper-suite notes may live under **`novelty-theory`** (e.g. `NOTES/` there), not in this public tree.
