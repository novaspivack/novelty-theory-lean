# novelty-theory-lean

Public **Lean 4** library and **machine-checked companion** to novelty theory, with the **final-draft** crown paper under `paper/Final Draft/`.

- **Lean:** Mathlib **`v4.29.0-rc6`**, toolchain pinned in [`lean-toolchain`](lean-toolchain) — see [`docs/003_LEAN_TOOLCHAIN_PIN.md`](docs/003_LEAN_TOOLCHAIN_PIN.md).
- **Paper:** `paper/Final Draft/novelty_theory_generalized_crown.tex` (+ `refs.bib`). Build from that directory; see [`paper/Final Draft/COMPILE.md`](paper/Final%20Draft/COMPILE.md).
- **Maps / inventory:** [`MANIFEST.md`](MANIFEST.md), [`docs/THEOREM_INVENTORY.md`](docs/THEOREM_INVENTORY.md), and dependency/positioning docs under [`docs/`](docs/000_INDEX.md).

## Quick start

```bash
lake exe cache get   # optional; Mathlib oleans
lake build
```

Details: [`docs/002_DEVELOPER_SETUP.md`](docs/002_DEVELOPER_SETUP.md).

## Normative specs and maintainer workflow

Epic specs, queues, and agent methodology live in the separate **[novelty-theory](https://github.com/novaspivack/novelty-theory)** repository. This repo tracks only what belongs in a public **library + paper** artifact.

To work on both: clone **`novelty-theory`** with submodules — see **[Maintainer workflow](https://github.com/novaspivack/novelty-theory/blob/main/MAINTAINERS.md)** in that repo.

## Layout

- **`NoveltyTheory/`** — library sources (root module: [`NoveltyTheory.lean`](NoveltyTheory.lean))
- **`paper/Final Draft/`** — submission-grade LaTeX
- **`docs/`** — developer and external-facing reference (not normative specs)
- **`scripts/`** — e.g. optional `\leanref` verification against the TeX source

## Submodule

Parent prose or orchestration projects may embed this repository as a **`git submodule`** at their chosen path; this tree is the **library root**.

## License

_Add a `LICENSE` file when you publish._
