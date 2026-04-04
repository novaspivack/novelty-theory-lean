#!/usr/bin/env python3
"""
Cross-check \\leanref{NoveltyTheory...} paths in the generalized crown paper against
repository .lean files and top-level declarations (theorem / def / lemma / ...).

Usage (from repo root):
  python3 scripts/verify_paper_leanrefs.py

Exit code 0 if all references resolve; nonzero on failure.
"""
from __future__ import annotations

import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PAPER = ROOT / "paper/Final Draft/Self-Transcending_Generators.tex"


def collect_leanrefs(tex: str) -> list[str]:
    raw = re.findall(r"\\leanref\{([^}]+)\}", tex)
    out: list[str] = []
    seen: set[str] = set()
    for r in raw:
        name = r.replace(r"\_", "_").replace("\n", " ").strip()
        if name.startswith("NoveltyTheory.") and name not in seen:
            seen.add(name)
            out.append(name)
    return out


def resolve_lean_file(qualified: str) -> tuple[Path | None, str | None]:
    """Return (.lean path, declaration suffix) or (None, None)."""
    parts = qualified.split(".")
    if len(parts) < 3 or parts[0] != "NoveltyTheory":
        return None, None
    path_parts = parts[1:]
    for i in range(len(path_parts), 0, -1):
        candidate = ROOT / "NoveltyTheory" / "/".join(path_parts[:i])
        f = candidate.with_suffix(".lean")
        if f.is_file():
            decl = ".".join(path_parts[i:]) if i < len(path_parts) else None
            return f, decl
    return None, None


def decl_exists(lean_file: Path, decl: str) -> bool:
    text = lean_file.read_text()
    pat = re.compile(
        r"^(theorem|lemma|def|abbrev|structure|inductive|class|instance)\s+"
        + re.escape(decl)
        + r"\b",
        re.M,
    )
    return bool(pat.search(text))


def main() -> int:
    if not PAPER.is_file():
        print("error: paper not found:", PAPER, file=sys.stderr)
        return 2
    tex = PAPER.read_text()
    refs = collect_leanrefs(tex)
    errors: list[str] = []
    for full in refs:
        lf, decl = resolve_lean_file(full)
        if lf is None:
            errors.append(f"{full}: no matching .lean module prefix under NoveltyTheory/")
            continue
        if decl and not decl_exists(lf, decl):
            errors.append(f"{full}: declaration {decl!r} not found in {lf.relative_to(ROOT)}")

    print(f"checked {len(refs)} distinct NoveltyTheory leanrefs in {PAPER.name}")
    if errors:
        print(f"{len(errors)} error(s):", file=sys.stderr)
        for e in errors:
            print(" ", e, file=sys.stderr)
        return 1
    print("ok")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
