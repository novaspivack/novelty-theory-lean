# 002 — Developer setup (novelty-theory-lean)

## Prerequisites

- [Elan](https://github.com/leanprover/elan) (installs the pinned Lean from [`lean-toolchain`](../lean-toolchain))
- Network access for first **`lake build`** (fetches Mathlib)

## Clone and build

**Prefer Mathlib oleans** (avoids compiling Mathlib locally):

```bash
cd /path/to/novelty-theory-lean
lake exe cache get   # Azure Mathlib cache; re-run after `lake update` / toolchain bump
lake build
```

If you skip `cache get` and have never built Mathlib here, `lake build` may compile Mathlib for a long time and heat the machine.
Do **not** run `lake clean` unless you intend to wipe caches and pay that cost again.

Layout note: the Lake root module is **`NoveltyTheory.lean`** at the repo root (same idea as `UgpLean.lean` in **`ugp-lean`**); the library body is under **`NoveltyTheory/`**.

Elan reads **`lean-toolchain`** automatically when you run `lake` from this directory.

## Verify

- **`lake build`** completes with no errors.
- Optional: open **`NoveltyTheory/Basic.lean`** in an editor with Lean LSP.

## After dependency bumps

1. Edit **`lean-toolchain`** and Mathlib tag in **`lakefile.lean`** per [`003_LEAN_TOOLCHAIN_PIN.md`](003_LEAN_TOOLCHAIN_PIN.md).
2. Run **`lake update`** then **`lake build`**.
3. Commit **`lake-manifest.json`** with the Lean changes.

## LaTeX paper (`generalized crown`)

The PDF is built from **`paper/Final Draft/`** so BibTeX finds **`refs.bib`**. See **[`paper/Final Draft/COMPILE.md`](../paper/Final%20Draft/COMPILE.md)** (or run **`paper/Final Draft/build-paper.sh`**). Building from the repo root without `latexmk`’s directory change often breaks the bibliography and aux files.
