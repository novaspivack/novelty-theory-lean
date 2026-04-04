# Paper bundle (`novelty-theory-lean`)

LaTeX source for the **fixed generation / stratified provability** paper, using the
same technical conventions as **ugp-lean** (preamble, `tcolorbox` key boxes,
`listings` Lean4 style) and the `\leanref{}` line-breaking helper from
**Representational_Incompleteness.tex**.

## Build

From this directory:

```bash
latexmk -pdf -interaction=nonstopmode novelty_theory_lean_fixed_generation.tex
```

Or manually:

```bash
pdflatex novelty_theory_lean_fixed_generation.tex
bibtex novelty_theory_lean_fixed_generation
pdflatex novelty_theory_lean_fixed_generation.tex
pdflatex novelty_theory_lean_fixed_generation.tex
```

Requires a standard TeX Live–style install (`latexmk`, `pdflatex`, `bibtex`).

## Files

| File | Role |
|------|------|
| `novelty_theory_lean_fixed_generation.tex` | Main document (abstract, outline sections, appendices) |
| `refs.bib` | Bibliography |
| `figures/theorem_to_prose_table.tex` | Appendix: four-column claim ↔ theorem ↔ assumptions ↔ boundary |
| `figures/layer_dependency.tex` | One-page TikZ layer diagram |

Author-facing preparation notes (claim freeze, comparison framing, ``does not prove'')
live in **[`docs/008_PAPER_PREPARATION_FIXED_GENERATION.md`](../docs/008_PAPER_PREPARATION_FIXED_GENERATION.md)**.
