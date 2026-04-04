# Building `Self-Transcending_Generators.tex`

This paper must be built with **working directory = this folder** (`paper/Final Draft/`), so that:

- `\bibliography{refs}` resolves to `./refs.bib`
- BibTeX reads the same `.aux` as pdfTeX
- all auxiliary files (`.aux`, `.bbl`, `.out`, …) live **next to** the `.tex` file

If you run `pdflatex` or `bibtex` from the **repository root** without changing directory, TeX often writes `Self-Transcending_Generators.aux` (and sometimes the PDF) **into the root**, misses `refs.bib`, skips or breaks the bibliography, and can **corrupt** cross-references. Delete any stray `Self-Transcending_Generators.*` in the repo root if you see them; add patterns under `.gitignore` if needed; they still confuse local builds.

## Recommended (one command)

From **anywhere** (paths relative to the `novelty-theory-lean` repo root):

```bash
cd paper/Final\ Draft
./build-paper.sh
```

Or the same without the script:

```bash
cd paper/Final\ Draft
latexmk -pdf -interaction=nonstopmode -halt-on-error Self-Transcending_Generators.tex
```

## From repository root (no `cd` into `paper/Final Draft`)

Either rely on the **tracked** repo-root `.latexmkrc` (`$do_cd = 1`), **or** pass `-cd`:

```bash
latexmk -pdf -cd -interaction=nonstopmode "paper/Final Draft/Self-Transcending_Generators.tex"
```

## Clean rebuild

```bash
cd paper/Final\ Draft
latexmk -C Self-Transcending_Generators.tex
latexmk -pdf -interaction=nonstopmode Self-Transcending_Generators.tex
```

Also remove stray root artifacts (wrong-cwd builds) from the **repository root** if present:

```bash
rm -f Self-Transcending_Generators.{aux,bbl,blg,log,out,pdf,toc,fls,fdb_latexmk}
```

## If you see `Runaway argument` / `Extra }, or forgotten $endgroup` in .aux`

The `.aux` file was truncated or merged from a **wrong-directory** build. Delete `*.aux`, `*.out`, `*.toc` in **this folder**, clean stray files in the repo root as above, then run **Recommended** again.

## Requirements

- `latexmk`, `pdflatex`, `bibtex` (e.g. MacTeX / TeX Live)
