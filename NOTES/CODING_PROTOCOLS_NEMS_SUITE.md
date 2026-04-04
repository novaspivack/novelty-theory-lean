# NEMS Suite — Coding Protocols

> **Bundled as reference:** This file ships with the **Default-repo-stub** template under `NOTES/` for teams working on the NEMS/PSC paper suite. Remove or replace if your copied repo does not use that stack.

**For:** Agents and developers working on the NEMS/PSC paper suite and Lean library  
**Updated:** March 2026  
**Primary location (full suite):** `NEMS_PAPERS/` (when used inside the paper repository)

This document explains how the LaTeX suite and the Lean library are structured,
how to add new content correctly, and how the two systems relate to each other.
Read this before making any changes.

---

## Part 0: Master Reference — All Lean Libraries

**Agents:** Use this table to locate every Lean library. All are symlinked into the workspace; build always from the **real path**.

| Library | In workspace (symlink) | Real path (build here) | MANIFEST | docs | Papers |
|---------|------------------------|------------------------|----------|------|--------|
| **infinity-compression** | (this repository) | **`/Users/nova/infinity-compression/infinity-compression-lean`** | `infinity-compression-lean/MANIFEST.md` | `specs/NOTES/` (crown reader, ledger, Summit B), EPIC_001 | EPIC_001 program |
| **nems-lean** | `NEMS_PAPERS/nems-lean` | **`/Users/nova/nems-lean`** | `~/nems-lean/MANIFEST.md` | `~/nems-lean/docs/` | 01–51 |
| **reflexive-closure-lean** | `NEMS_PAPERS/reflexive-closure-lean` | **`/Users/nova/reflexive-closure-lean`** | `~/reflexive-closure-lean/MANIFEST.md` | `~/reflexive-closure-lean/docs/` | 52–70 |
| **viable-continuation-lean** | `NEMS_PAPERS/viable-continuation-lean` | `NEMS_PAPERS/viable-continuation-lean` or **`~/viable-continuation-lean`** | `viable-continuation-lean/MANIFEST.md` | `viable-continuation-lean/docs/` | 71–72 |
| **sentience-lean** | `NEMS_PAPERS/73_Sentience_Program/sentience-lean` | **`/Users/nova/sentience-lean`** | `~/sentience-lean/MANIFEST.md` | `~/sentience-lean/docs/` | 73 |
| **phenomenology-lean** | `NEMS_PAPERS/74_Formal_Structure_of_Phenomenology/phenomenology-lean` or `NEMS_PAPERS/73_Sentience_Program/phenomenology-lean` | **`/Users/nova/phenomenology-lean`** | `~/phenomenology-lean/MANIFEST.md` | `~/phenomenology-lean/docs/` | 74, 75 |
| **transputation-lean** | `NEMS_PAPERS/76_Formal_Theory_of_Transputation/transputation-lean` (symlink) | **`/Users/nova/transputation-lean`** | `~/transputation-lean/MANIFEST.md` | `~/transputation-lean/docs/` | 76, 77 |

**Build rule:** Always `cd` to the real path, then `lake build`. Never run `lake build` from the long workspace path (Mathlib path-length errors).

**When you add a new Lean library:** Create it at a short path (e.g. `~/phenomenology-lean`), add a symlink from the appropriate NEMS_PAPERS location, and add it to this table. Update MANIFEST.md, ARTIFACT.md, README.md, docs/Overview.md in that library.

---

## Part 1: Directory Structure

```
NEMS_PAPERS/
├── suite_preamble.tex          ← Shared LaTeX packages + theorem environments
├── suite_macros.tex            ← Shared notation macros
├── 01_The_NEMS_Framework/      ← Paper 1: NEMS overview, audits, machine-checked artifact
├── 02_Semantic_Closure_Under_NEMS/  ← Paper 2: Trichotomy, ER, Full PSC
├── 03_structural_stability/    ← Paper 3: PSC ⇒ RC ⇒ NM*
├── 04_Instantiating No External Model Selection in Physics/  ← Paper 4
├── 05_A_PSC_Derivation_of_the_Standard_Model/  ← Paper 5: Two-Layer PSC Theorem
├── … 06–25 (NEMS framework spine: QG, Physicists, MFRR bridge, diagonal, BICS, etc.)
├── 26_General_Self_Reference_Calculus/   ← Paper 26: abstract SRI, MFP-1, MFP-2 (SelfReference)
├── 27_A No-Free-Bits Calculus for Determinacy and Outsourcing/  ← Paper 27 (Closure)
├── 28_Reflection_as_a_Resource/ ← Paper 28 (Reflection)
├── 29_Selector_Strength_and_Completion_Hierarchies/  ← Paper 29 (SelectorStrength)
├── 30_Learning_Self_Trust_Incompleteness/ ← Paper 30 (Learning)
├── 31_Epistemic_Agency_Under_Diagonal_Constraints/   ← Paper 31 (EpistemicAgency)
├── 32_Self_Improvement_Under_Diagonal_Constraints/  ← Paper 32 (SelfImprovement)
├── 33_Self_Awareness_as_Resource/  ← Paper 33 (SelfAwareness)
├── 34_Sieve_Engine_for_Theory_Spaces/  ← Paper 34 (Sieve)
├── 35_Oracles_as_External_Selectors/  ← Paper 35: companion (Hypercomputation/ in nems-lean; 0 sorry)
├── 36_Arrow_Of_Time/                  ← Paper 36 (ArrowOfTime)
├── 37_Chronology_Under_Closure/        ← Paper 37 (ChronologyUnderClosure)
├── 38_Black_Hole_Information/         ← Paper 38 (BlackHoles)
├── 39_GPT_Probability/                 ← Paper 39 (GPTClosure)
├── 40_Institutional_Epistemics/       ← Paper 40 (InstitutionalEpistemics)
├── 41_Refinement_Flow_World_Types/     ← Paper 41 (RefinementFlow)
├── 42_Record_Entropy_Noncomputability/ ← Paper 42 (RecordEntropy)
├── … 43–46 (Error-Correcting Universe, Calibration, Semantic Nonlocality, Causal Nonlocality)
├── 47_No_Spooky_to_Signal_Compiler/    ← Paper 47 (FTLConstraints)
├── 48_Holography_Under_Closure/        ← Paper 48 (HolographyUnderClosure)
├── … 49–51 (Cosmic Audit, CertificationLogic, SemanticSelfDescription)
├── … 52–70 (reflexive-closure arc: see Part 1c below)
├── nems-lean/                  ← **Symlink** to Lean 4 proof library (see Part 1a below)
├── reflexive-closure-lean/    ← **Symlink** to reflexive-closure Lean 4 library (see Part 1c below)
├── 72_Structural_Principles/   ← Paper 72: Principles (from VC program)
├── 73_Sentience_Program/
│   ├── sentience-lean/         ← **Symlink** to sentience-lean (Paper 73; see Part 1e)
│   ├── phenomenology-lean/     ← **Symlink** to phenomenology-lean (Papers 74–75; see Part 1f)
│   └── …
├── 74_Formal_Structure_of_Phenomenology/  ← Paper 74
├── 75_Uniqueness_of_Phenomenology/         ← Paper 75
├── 76_Formal_Theory_of_Transputation/      ← Paper 76: transputation theory (transputation-lean symlink)
├── 77_DSAC_as_a_Realization_of_Transputation/  ← Paper 77: DSAC realization companion
├── psc-computational-validation/  ← Python: theory space scanner, universe enumeration
├── create_consolidated_md.py      ← Rebuild consolidated .md and sync PDFs (see Part 5.1)
├── NEMS_Consolidated_Paper_Suite/ ← Output: consolidated .md files and synced PDFs
└── notes/
    ├── SUBMISSION_STRATEGY.md
    ├── NEMS_LEAN_BUILD_NOTE.md
    ├── CODING_PROTOCOLS.md     ← this file
    ├── ROADMAPS/               ← Paper specs and roadmaps
    └── Companion Note: A Reader's Guide to the NEMS-PSC Suite.tex
```

### Part 1a: Where the Lean code lives (nems-lean) — agents read this

**In this repo**, `NEMS_PAPERS/nems-lean` is a **symlink**. The actual Lean 4 library (and its build) lives at a short path to avoid filesystem path-length errors when building Mathlib.

| In repo (what you see) | Actual location (where to build) |
|------------------------|----------------------------------|
| `NEMS_PAPERS/nems-lean` (symlink) | **`/Users/nova/nems-lean`** (or `~/nems-lean`) |

**Git tracking:** `nems-lean` is tracked as a **symlink** (not a Git submodule). This allows `git status` and commits from the outer repo to work while the symlink points to the real Lean repo at `~/nems-lean`. If the repo ever had `nems-lean` as a submodule, it was converted to a symlink so that the same repo can be edited via the symlink and built from the short path.

**Rules for agents and developers:**
- **Editing:** You can edit Lean files via the repo path (the symlink resolves); Cursor/IDE will open files under `NEMS_PAPERS/nems-lean` and that is the same as `~/nems-lean`.
- **Building:** Always run Lake from the **real path**: `cd ~/nems-lean` then `lake build` (or `lake build RecordEntropy`, etc.). Do not run `lake build` from the long repo path or Mathlib build may fail with "no such file or directory."
- **Commits:** Commit Lean changes from `~/nems-lean` (the real path). Commit paper and repo changes (including the symlink if it changed) from the outer repo root. From the repo root, `git status` works and shows the symlink as a normal tracked file.

**Installation for new clones (other users / other machines):**

The tracked symlink stores an **absolute path** (e.g. `/Users/nova/nems-lean`). After cloning this repo, that path will not exist on your machine. To install and run the NEMS papers suite with Lean support:

1. **Clone this (outer) repo** as usual. You will see `NEMS_PAPERS/nems-lean` as a symlink; it will be broken or point to the original author’s path.

2. **Clone the nems-lean repo** to a **short path** on your machine (e.g. `~/nems-lean`). Use the same repo URL as the author (e.g. the nems-lean repo used by this suite). Short paths avoid Mathlib/Lake path-length errors during build.
   ```bash
   git clone <nems-lean-repo-url> ~/nems-lean
   ```

3. **Replace the symlink** so it points to your clone:
   - Remove the existing (broken or wrong) symlink at `NEMS_PAPERS/nems-lean`.
   - Create a new symlink from `NEMS_PAPERS/nems-lean` to your clone (e.g. `~/nems-lean`).
   ```bash
   # From the outer repo root (e.g. Particle Derivations or si_optimizer_data/Physics_Papers/NEMS_PAPERS parent):
   rm "Optimizer new tests/si_optimizer_data/Physics_Papers/NEMS_PAPERS/nems-lean"
   ln -s "$HOME/nems-lean" "Optimizer new tests/si_optimizer_data/Physics_Papers/NEMS_PAPERS/nems-lean"
   ```
   Use the correct relative path from your repo root to `NEMS_PAPERS` if your layout differs.

4. **Install Lean toolchain** (if not already installed). From **Part 3.3** below:
   ```bash
   curl https://elan.lean-lang.org/elan-init.sh -sSf | sh -s -- -y
   source ~/.elan/env   # or restart terminal
   ```

5. **Build the Lean library** only from the **real path** (never from the long symlink path):
   ```bash
   cd ~/nems-lean
   lake update    # first time: downloads Mathlib (~2–5 min)
   lake build     # compiles the library
   ```

6. **Edit and commit:** Edit Lean files via the repo (the symlink resolves). Commit Lean changes from `~/nems-lean`; commit LaTeX and other repo changes from the outer repo root. The outer repo tracks `nems-lean` as a symlink (blob), so `git status` works at the repo root.

See also **NEMS_PAPERS/NEMS_LEAN_BUILD_NOTE.md** for build details and path-length rationale.

---

**Paper numbering:** Papers 01–25 form the **NEMS framework spine** (classification, PSC, diagonal barrier, MFRR bridge, BICS, adjudication, rigidity, etc.). Papers 26–48 form the **abstract-core spine and physics-arc** (and companions): they introduce and use the **higher-level abstract Lean libraries** (SelfReference, Closure, Reflection, SelectorStrength, Learning, EpistemicAgency, SelfImprovement, SelfAwareness, Sieve, ArrowOfTime, ChronologyUnderClosure, BlackHoles, GPTClosure, InstitutionalEpistemics, RefinementFlow, RecordEntropy, FTLConstraints, HolographyUnderClosure, etc.). See **Part 1b** below.

---

## Part 1b: Abstract-Core Spine — Use the Higher-Level Framework

**Mandatory for Papers 26 and later (abstract-core spine and any follow-on papers):**

- **Use the higher-level abstract framework** as we have been doing. Papers in this range are written and formalized **using** the abstract libraries: SelfReference (SRI, MFP-1, MFP-2), Closure (observational semantics, world-types, selectors, audit soundness, canonicalization, BoundedSelector), Reflection (SRI_R, DiagClosed, restricted fixed point), SelectorStrength (strength poset, barrier schema, no_total_decider_at_strength), Learning (claims, no total self-certifier, stratified self-certification), EpistemicAgency (society as verification protocol, strict separation, diversity necessity), SelfImprovement (upgrade certifiers, stratified improvement, meta-barrier), SelfAwareness (claim hierarchy, selector necessity, rightness barrier), Sieve (theory space, constraints, residual, monotonicity, pullback).
- **Do not** re-derive or re-implement the older, lower-level machinery that existed **before** the abstract framework was written. Papers 01–25 and the **NemS** Lean library were written when the abstract calculus did not yet exist; they use the concrete NEMS classification (Framework, ObsEq, Trichotomy, Diagonal barrier, MFRR bridge) in its original form. That lower-level layer remains in the **NemS** library for the framework spine and for NemS as an **instance** of the abstract calculus (e.g. SelfReference.Instances.NEMS, Closure bridge to SelfReference).
- **New papers and new Lean code** in the abstract-core line (and companions like Paper 35) must:
  - **Cite and use** the appropriate abstract libraries (SelfReference, Closure, Reflection, SelectorStrength, Learning, etc.) for fixed points, barriers, selectors, and audit soundness.
  - **Not** introduce parallel, ad hoc definitions that duplicate SelfReference/Closure/Reflection/SelectorStrength concepts.
  - **Compose** with the existing abstract APIs (e.g. Reflection supplies hFP for SelectorStrength; Closure supplies selector-at-strength vocabulary; Learning composes with SelectorStrength and Reflection).
- **Companion papers** (e.g. Paper 35 — Oracles) follow the same LaTeX and conceptual discipline: they state results in terms of the abstract framework (Closure for oracle-as-selector, SelectorStrength for no-internal-hypercomputer, taxonomy). Paper 35's companion library \texttt{Hypercomputation/} is implemented in nems-lean (0 sorry).

Summary: **Later papers = abstract framework.** Earlier papers (01–25) and the NemS Lean module are the lower-level, pre-abstract layer; do not use that style for new abstract-core or companion work.

---

### Part 1c: reflexive-closure-lean (Papers 52–70) — agents read this

**In this repo**, `NEMS_PAPERS/reflexive-closure-lean` is a **symlink**. The actual Lean 4 library lives at a short path (sibling to nems-lean).

| In repo (what you see) | Actual location (where to build) |
|------------------------|----------------------------------|
| `NEMS_PAPERS/reflexive-closure-lean` (symlink) | **`/Users/nova/reflexive-closure-lean`** (or `~/reflexive-closure-lean`) |

**Dependency:** reflexive-closure-lean **imports** nems-lean. The `lakefile.lean` requires nems-lean at `../nems-lean` relative to reflexive-closure-lean. Both repos should be siblings (e.g. `~/nems-lean` and `~/reflexive-closure-lean`).

**Rules for agents and developers:**
- **Editing:** Edit Lean files via the repo path (the symlink resolves).
- **Building:** Run Lake from the **real path**: `cd ~/reflexive-closure-lean` then `lake build`. Ensure nems-lean is built first (`cd ~/nems-lean && lake build`).
- **Commits:** Commit Lean changes from `~/reflexive-closure-lean`; commit paper and repo changes from the outer repo root.

**Libraries (Papers 52–70):** SemanticSelfReference (52), SyntaxSemantics (53), SemanticSelfReference.Theorems.ObserverCorollary (54), QualiaLedger (55), ReflexiveClosure (56), ReflexiveUnfolding (57), NecessaryReflexiveIntelligence (58), CalculusOfIntelligence (59), RealityAsRecursiveIntelligence (60), GhostCollapse (61), LedgerGround (62), Alpha (63), GroundedExistence (64), QualiaAlphaGrounded (65), GroundManifestation (66), AwarenessGround (67), AlphaNonNull (68), UnifiedPresence (69), GoldenBridge (70). See **reflexive-closure-lean/MANIFEST.md** for theorem tables and module layout.

---

### Part 1d: viable-continuation-lean (Papers 71–72) — agents read this

**Repository:** https://github.com/novaspivack/viable-continuation-lean  
**In this repo**, `NEMS_PAPERS/viable-continuation-lean` is a **Git submodule** (or symlink). The Lean library may be cloned separately to a short path for builds.

| In repo (what you see) | Actual location (where to build) |
|------------------------|----------------------------------|
| `NEMS_PAPERS/viable-continuation-lean` (submodule) | `NEMS_PAPERS/viable-continuation-lean` or `~/viable-continuation-lean` if cloned for short-path builds |

**Dependency:** viable-continuation-lean is self-contained; it does not require nems-lean or reflexive-closure-lean for its core build (Bridges may optionally import them for domain instantiations).

**Rules for agents and developers:**
- **Editing:** Edit Lean files via the repo path (submodule or symlink resolves).
- **Building:** Run Lake from a **short path** to avoid Mathlib path-length errors: `cd viable-continuation-lean` (or `~/viable-continuation-lean` if cloned there) then `lake build`.
- **Commits:** Commit Lean changes from within the viable-continuation-lean repo; commit submodule reference updates from the outer repo root (`git add viable-continuation-lean && git commit`).

**Libraries (Papers 71–72):** ViableContinuation (Core, Measures, Theorems, Bridges). Phases I–VI: ontology, measures, foothill/ridge/summit theorems. Phase VII: nine domain bridge schemas (AGI, Law, Bio, Civ, War, Pluralism, Ecology, Science, Physical). Phase VII+: Bridges.FrontierPrinciples (frontier canon → defect witnesses). See **viable-continuation-lean/MANIFEST.md** and **ARTIFACT.md** for theorem tables.

---

### Part 1e: sentience-lean (Paper 73) — agents read this

**In this repo**, `NEMS_PAPERS/73_Sentience_Program/sentience-lean` is a **symlink**. The actual Lean 4 library lives at a short path (sibling to nems-lean).

| In repo (what you see) | Actual location (where to build) |
|------------------------|----------------------------------|
| `73_Sentience_Program/sentience-lean` (symlink) | **`/Users/nova/sentience-lean`** (or `~/sentience-lean`) |

**Dependency:** sentience-lean imports viable-continuation-lean, nems-lean, reflexive-closure-lean. The `lakefile.lean` requires them at sibling paths.

**Rules for agents and developers:**
- **Editing:** Edit Lean files via the repo path (the symlink resolves).
- **Building:** Run Lake from the **real path**: `cd ~/sentience-lean` then `lake build`. Ensure viable-continuation-lean, nems-lean, reflexive-closure-lean are built first.
- **Commits:** Commit Lean changes from `~/sentience-lean`; commit paper and repo changes from the outer repo root.

**Libraries (Paper 73):** ProcessWindow, DefectProfiles, OSIAM, Invariants, EncodingRobustness, Adjudication, Bridges (ToViableContinuation, ToNEMS, ToPaper31/33/16), Separation theorems. See **sentience-lean/MANIFEST.md**, **sentience-lean/docs/FLAGSHIP_THEOREM_SPINE_AUDIT.md**, **sentience-lean/docs/DISCHARGE_NEXT_STEPS.md**.

**DSAC companion:** `73_Sentience_Program/sentience-compute` (scenarios, TDA, burden analysis). See sentience-compute/README.md.

---

### Part 1f: phenomenology-lean (Papers 74, 75) — agents read this

**Repository:** https://github.com/novaspivack/phenomenology-lean

**In this repo**, `NEMS_PAPERS/73_Sentience_Program/phenomenology-lean` is a **symlink** (or will be). The actual Lean 4 library lives at a short path (sibling to sentience-lean).

| In repo (what you see) | Actual location (where to build) |
|------------------------|----------------------------------|
| `73_Sentience_Program/phenomenology-lean` (symlink) | **`/Users/nova/phenomenology-lean`** (or `~/phenomenology-lean`) |

**Installation for new clones:** `git clone https://github.com/novaspivack/phenomenology-lean ~/phenomenology-lean`. Create symlink: `ln -s ~/phenomenology-lean "73_Sentience_Program/phenomenology-lean"` (from NEMS_PAPERS parent).

**Dependency:** phenomenology-lean imports sentience-lean, nems-lean, reflexive-closure-lean. Primary dependencies: sentience-lean, nems-lean, reflexive-closure-lean. Physics modules quarantined.

**Rules for agents and developers:**
- **Editing:** Edit Lean files via the repo path (symlink resolves).
- **Building:** Run Lake from the **real path**: `cd ~/phenomenology-lean` then `lake build`.
- **Commits:** Commit Lean changes from `~/phenomenology-lean`; commit paper and repo changes from the outer repo root.

**Libraries (Papers 74, 75):** Phenomenology/Ontology, Manifestation, Access; Phenomenology/Meta (Paper 75 uniqueness). See **74_Formal_Structure_of_Phenomenology/74_notes/MASTER_SPEC_PAPER_74.md**, **75_Uniqueness_of_Phenomenology/75_notes/MASTER_SPEC_PAPER_75.md**.

**DSAC companion (Paper 73):** `phenomenology-compute/` (planned; do not add to delta-machine or sentience-compute).

---

### Part 1g: transputation-lean (Papers 76, 77) — agents read this

**Repository:** https://github.com/novaspivack/transputation-lean (or create at `~/transputation-lean`)

**In this repo**, `NEMS_PAPERS/76_Formal_Theory_of_Transputation/transputation-lean` is a **symlink**. The actual Lean 4 library lives at a short path (sibling to nems-lean).

| In repo (what you see) | Actual location (where to build) |
|------------------------|----------------------------------|
| `76_Formal_Theory_of_Transputation/transputation-lean` (symlink) | **`/Users/nova/transputation-lean`** (or `~/transputation-lean`) |

**Installation for new clones:** Clone or create transputation-lean at `~/transputation-lean`. Create symlink: `ln -sf ~/transputation-lean "76_Formal_Theory_of_Transputation/transputation-lean"` (from NEMS_PAPERS directory).

**Dependency:** transputation-lean imports nems-lean only. Does **not** import sentience-lean or phenomenology-lean.

**Rules for agents and developers:**
- **Editing:** Edit Lean files via the repo path (the symlink resolves).
- **Building:** Run Lake from the **real path**: `cd ~/transputation-lean` then `lake build`. Ensure nems-lean is built first.
- **Commits:** Commit Lean changes from `~/transputation-lean`; commit paper and repo changes from the outer repo root.

**Libraries (Papers 76, 77):** Transputation (Core, Theorems, Interfaces). Theorem spine: computation sufficiency, forced adjudication, diagonal barrier bridge, no collapse, classification. See **76_Formal_Theory_of_Transputation/76_notes/**, **PAPERS_76_77_PLAN.md**.

---

## Part 2: LaTeX Suite

### 2.1 The shared infrastructure

Every paper in the suite uses two shared files at the root level:

**`suite_preamble.tex`** — packages and theorem environments  
**`suite_macros.tex`** — notation macros

Every paper's `.tex` file MUST begin with:

```latex
\documentclass[11pt]{article}
\input{../suite_preamble}
\input{../suite_macros}
```

The `../` path goes up one level from the paper's subdirectory to the root.
If a paper needs extra packages (e.g. `physics`), add them AFTER the inputs:

```latex
\documentclass[11pt]{article}
\input{../suite_preamble}
\usepackage{physics}
\input{../suite_macros}
```

**NEVER** redefine macros or theorem environments locally in a paper file.
If you need a new macro, add it to `suite_macros.tex`.
If you need a new theorem environment, add it to `suite_preamble.tex`.

### 2.2 Theorem environments (from suite_preamble.tex)

All theorem-like environments are numbered by section (`\newtheorem{theorem}{Theorem}[section]`).
All share a counter so numbering is consistent within a paper.

| Environment | Style | Use for |
|-------------|-------|---------|
| `theorem` | plain | Main results |
| `lemma` | plain | Supporting results |
| `proposition` | plain | Intermediate results |
| `corollary` | plain | Direct consequences |
| `definition` | definition | Formal definitions |
| `axiom` | definition | Axioms |
| `assumption` | definition | Named premises |
| `example` | definition | Concrete instances |
| `condition` | definition | Named conditions (e.g. audit steps) |
| `conjecture` | definition | Open conjectures |
| `remark` | remark | Explanatory notes |

**Usage:**
```latex
\begin{theorem}[Descriptive name]\label{thm:my-theorem}
Statement here.
\end{theorem}

\begin{proof}
Proof here.
\end{proof}
```

**MANDATORY: Labels and references**

- **Every** theorem-like environment (`theorem`, `lemma`, `proposition`, `corollary`, `definition`, `axiom`, `assumption`, `example`, `condition`, `conjecture`) MUST have a `\label` immediately after the opening tag.
- **Every** section that may be cross-referenced SHOULD have `\label{sec:short-name}`.
- Use `\Cref{label}` (from `cleveref`) for references—not `\ref`—so the output includes the type (Theorem, Definition, etc.).
- Unresolved references (showing as `??` in the PDF) are bugs: ensure every `\ref`/`\Cref` target has a matching `\label` in the same document (or in an `\input`/included file).
- Run `pdflatex` twice after adding labels so cross-references resolve.

### 2.3 Notation macros (from suite_macros.tex)

**Languages:**

| Macro | Output | Meaning |
|-------|--------|---------|
| `\Lang` | $\mathcal{L}$ | Base language |
| `\LangObs` | $\mathcal{L}_{\mathrm{obs}}$ | Observational sublanguage |
| `\LangRec` | $\mathcal{L}_{\mathrm{rec}}$ | Record language |
| `\LangRecGrav` | $\mathcal{L}_{\mathrm{rec}}^{\mathrm{grav}}$ | Gravitational record language |

**Theories and models:**

| Macro | Output | Meaning |
|-------|--------|---------|
| `\Thy` | $\mathsf{T}$ | Theory |
| `\Mod` | $\mathsf{Mod}$ | Model class |
| `\WTypes` | $\mathsf{WTypes}$ | Observational world-types |

**Equivalence relations:**

| Macro | Output | Meaning |
|-------|--------|---------|
| `\ObsEq` | $\sim_{\mathrm{obs}}$ | Observational equivalence |
| `\ObsEqRec` | $\sim_{\mathrm{rec}}$ | Record observational equivalence |
| `\ObsEqGrav` | $\sim_{\mathrm{grav}}$ | Gravitational record equivalence |

**Selection and computation:**

| Macro | Output | Meaning |
|-------|--------|---------|
| `\Sel` | $\mathsf{Sel}$ | Selector |
| `\Truth` | $\mathsf{Truth}$ | Truth predicate |
| `\Code` | $\mathsf{Code}$ | Coding apparatus |
| `\Eval` | $\mathsf{eval}$ | Evaluation map |
| `\NN` | $\mathbb{N}$ | Natural numbers |

**Gauge theory:**

| Macro | Output | Meaning |
|-------|--------|---------|
| `\TSpace` | $\mathcal{T}_{4\mathrm{D}}$ | 4D gauge theory space |
| `\ParamSpace` | $\Theta$ | Parameter manifold |
| `\QType` | $\mathcal{Q}$ | Qualitative type space |

**PSC/NEMS abbreviations:**

| Macro | Output | Meaning |
|-------|--------|---------|
| `\PSC` | $\mathrm{PSC}$ | Perfect Self-Containment |
| `\RC` | $\mathrm{RC}$ | Reflexive Closure |
| `\SA` | $\mathrm{SA}$ | Semantic Admissibility |
| `\TV` | $\mathrm{TV}$ | Thermodynamic Viability |
| `\PI` | $\mathrm{PI}$ | Presentation Invariance |
| `\NMstar` | $\mathrm{NM}^{*}$ | Structural Stability condition |

### 2.4 Cross-citations between papers

Every paper must cite other suite papers it depends on. The canonical bibitem keys follow the pattern `Spivack2026-NN` or paper-specific keys (e.g. `SpivackFramework` for Paper 1). For the full list of papers and keys, see **0.1_PAPER_SUMMARIES.md** (Section 6: NEMS Papers 01–25, Section 7: Abstract-core 26–48) and each paper’s bibliography.

**Examples:**

| Key | Paper |
|-----|-------|
| `SpivackFramework` | Paper 1: The NEMS Framework |
| `NEMSTheorem` | Paper 2: Semantic Closure |
| `SpivackNMstar` | Paper 3: Structural Stability |
| `SpivackPhysics` | Paper 4: Instantiating NEMS |
| `SpivackPSCOpt` | Paper 5: PSC-Optimality |
| `SpivackQG` | Paper 6: QG |
| `SpivackPhysicists` | Paper 7: NEMS for Physicists |
| `SpivackMFRR` | Paper 8: NEMS-to-MFRR Bridge |
| `Spivack2026-26` … `Spivack2026-48` | Papers 26–48 (abstract-core spine and physics-arc) |
| `NEMSLean` | Lean artifact (see nems-lean/MANIFEST.md for version) |

**Standard bibitem format:**
```latex
\bibitem{Spivack2026-34}
N.~Spivack.
\newblock \emph{A Sieve Engine for Theory Spaces}.
\newblock Manuscript, 2026.
```

All dates are **2026** (not 2025). When adding a new paper, add a `\bibitem{Spivack2026-NN}` (or chosen key) to **all** other papers that are cited in the suite so the citation graph stays consistent.

### 2.5 Compiling a paper

From the paper's subdirectory:
```bash
pdflatex -interaction=nonstopmode "Paper Title.tex"
pdflatex -interaction=nonstopmode "Paper Title.tex"   # second pass for cross-refs
```

Two passes are needed for `\tableofcontents`, `\Cref`, and bibliography references to resolve.
Check for errors: the log should show `0 errors` and `Output written on ...`.

### 2.6 Adding a new paper

1. Create a new subdirectory: `NN_Paper_Title/` (e.g. `36_Chronology_Under_Closure/`). Use zero-padded two-digit number `NN` matching the paper number.
2. Create the `.tex` file starting with:
   ```latex
   \documentclass[11pt]{article}
   \input{../suite_preamble}
   \input{../suite_macros}
   ```
3. Add bibitem entries for all existing suite papers.
4. Add a `\bibitem{SpivackNewPaper}` entry to all existing papers.
5. Compile and verify zero errors.

---

## Part 3: Lean Library (`nems-lean/`)

### 3.1 What Lean is and why we use it

Lean 4 is a proof assistant and programming language. When you write a theorem in Lean
and it compiles without errors, the theorem is **machine-checked**: Lean's kernel has
verified that the proof is logically valid given the stated definitions and axioms.

We use Lean to certify the NEMS theorem spine. This means:
- Critics cannot dismiss the logic as "AI hallucinated the proofs"
- The proofs are reproducible by anyone with Lean installed
- The exact axioms and definitions are explicit and auditable

**Key property:** The abstract-core libraries (Closure, Reflection, SelectorStrength, Learning, EpistemicAgency, SelfImprovement, SelfAwareness, Sieve) are **zero `sorry`**. The NemS and SelfReference libraries have a small, documented number of `sorry`s in instance layers (see MANIFEST.md). No proof steps are skipped without documentation.

### 3.2 Two-tier structure: abstract framework vs. NemS application

The Lean codebase has two tiers. **Use the correct tier for the paper you are working on.**

| Tier | Papers | Purpose |
|------|--------|---------|
| **Abstract framework** | 26–35 (SelfReference, Closure, Reflection, SelectorStrength, Learning, EpistemicAgency, SelfImprovement, SelfAwareness, Sieve, Hypercomputation) | Reusable calculus: SRI, MFP-1, MFP-2, observational semantics, selectors, audit soundness, barrier schema, etc. Hypercomputation (Paper 35) formalizes oracle-audit, no-internal-hypercomputer, taxonomy; 0 sorry. **All new abstract-core and companion papers use this tier.** |
| **NemS application** | 01–25 | NEMS framework spine: Framework, ObsEq, Trichotomy, Diagonal barrier, MFRR bridge, BICS, adjudication, rigidity, etc. This is the *lower-level* layer that existed before the abstract framework; NemS also provides *instances* of the abstract calculus (e.g. SelfReference.Instances.NEMS). |

**Rule:** Papers 26 and later (and their Lean code) **must use the higher-level abstract framework** (Part 1b). Do not add new theorems to the abstract-core line by re-implementing or duplicating the lower-level NemS definitions; instead, add to the appropriate abstract library (SelfReference, Closure, Reflection, SelectorStrength, Learning, etc.) and compose with existing APIs.

### 3.3 Lean version and toolchain

```
Lean 4.29.0-rc3 (arm64-apple-darwin, native Apple Silicon)
Mathlib 4.29.0-rc3
elan 4.2.0 (version manager, like rustup for Rust)
Lake 5.0.0 (build/package manager)
```

The toolchain is pinned in `nems-lean/lean-toolchain`:
```
leanprover/lean4:v4.29.0-rc3
```

**Installing elan (first time):**
```bash
curl https://elan.lean-lang.org/elan-init.sh -sSf | sh -s -- -y
source ~/.elan/env   # or restart terminal
```

### 3.4 Building the library

```bash
cd nems-lean/
lake update    # downloads Mathlib (first time: ~2-5 min, cached oleans)
lake build     # compiles the library (~3s if cached, ~60s cold)
```

Expected output: `Build completed successfully` with job count (see **MANIFEST.md** for current count, e.g. 8042 jobs).

The `lake update` step downloads Lean's Mathlib library and caches precompiled
`.olean` files. After the first run, subsequent builds are fast.

### 3.5 Library structure (overview)

```
nems-lean/
├── lean-toolchain          ← pins Lean version
├── lakefile.lean           ← package config + Mathlib dependency
├── MANIFEST.md             ← artifact manifest, theorem list, sorry count
├── ARTIFACT.md             ← Zenodo/citation, Companion Papers
├── README.md
├── docs/Overview.md        ← user-oriented overview of all libraries
├── SelfReference.lean      ← Paper 26: SRI, MFP-1, MFP-2, instances (Gödel, Kleene, Löb, NEMS)
├── Closure.lean            ← Paper 27: ObsSemantics, selectors, audit soundness, BoundedSelector
├── Reflection.lean         ← Paper 28: SRI_R, DiagClosed, restricted_master_fixed_point
├── SelectorStrength.lean   ← Paper 29: Strength poset, barrier schema, bridges
├── Learning.lean           ← Paper 30: Claims, no_total_self_certifier, stratified
├── EpistemicAgency.lean    ← Paper 31: Society as verification protocol, diversity
├── SelfImprovement.lean    ← Paper 32: Upgrade certifiers, meta-barrier
├── SelfAwareness.lean      ← Paper 33: Claim hierarchy, selector necessity, rightness
├── Sieve.lean              ← Paper 34: TheorySpace, constraints, Residual, pullback
├── Hypercomputation.lean   ← Paper 35: OracleAsSelector, no_internal_hypercomputer, taxonomy
└── NemS.lean               ← Papers 1–25: Framework, ObsEq, Trichotomy, Diagonal, MFRR, BICS, …
    └── NemS/               ← Core, Reduction, Visibility, Diagonal, MFRR, ReverseBICS, Adjudication, …
```

**Paper 35** (Oracles): Lean library **Hypercomputation/** in nems-lean. Formalizes oracle-audit interface, no-internal-hypercomputer theorem, premise-failure taxonomy, with halting and record-truth examples (0 sorry). Imports Closure and SelectorStrength.

For **detailed** file-by-file layout and theorem names, see **nems-lean/MANIFEST.md**. For how the libraries fit together and how to use them, see **nems-lean/docs/Overview.md**.

### 3.6 NemS application layer (Papers 1–25) — reference detail

The **NemS** library (lower-level, framework spine) contains the original NEMS definitions and theorems. Summary only; full tables are in MANIFEST.md.

```
NemS/
├── Prelude.lean        ← import Mathlib + global options
├── Core/               ← Basics (Framework), ObsEq, Categoricity, Selectors, Trichotomy, Internality
├── Reduction/          ← Externality, EnlargedSpace, ER
├── Visibility/         ← Recordability, SelfEncoding, SemanticExternality
├── Diagonal/            ← ASR, HaltingReduction, Barrier, Instantiation
├── Examples/Toy.lean
├── Meta/AuditProtocol.lean
└── MFRR/               ← ChoicePoints, PSCBundle, PTSelector, DiagonalBarrier, BridgeToNEMS, PTNonEffective, ToyMFRR
```

Also: ReverseBICS (Paper 14), Adjudication (Papers 15–16, 19, 22), RelativePSC (16), Observers/RSMC (17), Optimality/Terminality (18), Physics/Terminality (20–21), Reflexive (23), Cosmology (24), Bridge (25), Quantum (Paper 13).

### 3.7 Key definitions and theorems (NemS layer — reference)

**The `Framework` structure** (`Core/Basics.lean`):
```lean
structure Framework where
  Model : Type u    -- realizations / vacua / histories
  Rec   : Type v    -- record statements
  Truth : Model → Rec → Prop  -- truth valuation
```

**Observational equivalence** (`Core/ObsEq.lean`):
```lean
def Framework.ObsEq (F : Framework) (M N : F.Model) : Prop :=
  ∀ r : F.Rec, F.Truth M r ↔ F.Truth N r
```

**NEMS and NeedsExternalSelection** (`Core/Trichotomy.lean`):
```lean
def NeedsExternalSelection (F : Framework) (IsInternal : F.Selector → Prop) : Prop :=
  ¬ F.ObsCategorical ∧ ¬ ∃ S : F.Selector, IsInternal S

def NEMS (F : Framework) (IsInternal : F.Selector → Prop) : Prop :=
  ¬ NeedsExternalSelection F IsInternal
```

**The flagship theorem** (`Core/Trichotomy.lean`):
```lean
theorem nems_trichotomy (F : Framework) (IsInternal : F.Selector → Prop) :
    F.ObsCategorical ∨
    (∃ S : F.Selector, IsInternal S) ∨
    NeedsExternalSelection F IsInternal

theorem nems_implies_cat_or_internal
    (h : NEMS F IsInternal) :
    F.ObsCategorical ∨ ∃ S : F.Selector, IsInternal S
```

**Externality Reduction** (`Reduction/ER.lean`):
```lean
-- Any external dependency induces non-categoricity in the enlarged space
theorem er_non_categorical (dep : F.ExternalDependency) :
    ¬ Framework.ObsCategorical (F.enlarge dep)

-- NEMS on enlarged space forces an internal selector
theorem er_nems_forces_internal_selector
    (dep : F.ExternalDependency)
    (IsInternal : (F.enlarge dep).Selector → Prop)
    (hNEMS : NEMS (F.enlarge dep) IsInternal) :
    ∃ S : (F.enlarge dep).Selector, IsInternal S
```

### 3.8 The `IsInternal` predicate (NemS)

`IsInternal : F.Selector → Prop` is an **abstract parameter** throughout the library.
The Trichotomy and ER theorems are parametric over any `IsInternal`.

Two concrete instantiations are provided in `Core/Internality.lean`:

```lean
-- Definability-style: selector is uniquely determined + automorphism-invariant
def IsDefinabilityInternal (S : Selector F) : Prop :=
  (∀ S' : Selector F, (∀ M, S.sel M = S'.sel M) → S = S') ∧
  (∀ σ, (∀ M N, ObsEq F M N → ObsEq F (σ M) (σ N)) →
    ∀ M, S.sel (σ M) = σ (S.sel M))

-- Computability-style: selector factors through the quotient map
def IsComputabilityInternal (S : Selector F) : Prop :=
  (∃ q : Quotient (obsEqSetoid F) → F.Model,
    ∀ M, S.sel M = q (toWorldType F M)) ∧
  (∃ q : Quotient (obsEqSetoid F) → F.Model,
    ∀ wt, toWorldType F (q wt) = wt)
```

### 3.9 MFRR bridge definitions and theorems (NemS)

**Choice points** (`MFRR/ChoicePoints.lean`):
```lean
structure ChoiceData (F : Framework) where
  CP : F.Model → Type
  branches : {M : F.Model} → CP M → Set F.Model
  nonempty : ∀ {M : F.Model} (c : CP M), (branches c).Nonempty

def HasRecordDivergentChoice (F : Framework) (cd : ChoiceData F) : Prop :=
  ∃ (M : F.Model) (c : cd.CP M) (b₁ b₂ : F.Model),
    b₁ ∈ cd.branches c ∧ b₂ ∈ cd.branches c ∧ ¬ F.ObsEq b₁ b₂
```

**PSC bundle** (`MFRR/PSCBundle.lean`):
```lean
structure PSCBundle (F : Framework) (IsInternal : F.Selector → Prop) where
  nems : NEMS F IsInternal
  detPSC : F.DeterminacyPSC
```

**PT (Transputation)** (`MFRR/PTSelector.lean`):
```lean
structure PT (F : Framework) (IsInternal : F.Selector → Prop) where
  selector : F.Selector
  internal : IsInternal selector
```

**ASR structure** (`Diagonal/ASR.lean`):
```lean
structure ASR (F : Framework) where
  RT : ℕ → Prop
  encode : Code → ℕ → ℕ
  encode_computable : Computable₂ encode
  halts_iff_RT : ∀ (c : Code) (x : ℕ), (eval c x).Dom ↔ RT (encode c x)
```

**Diagonal barrier (fully proved, zero axioms)** (`Diagonal/HaltingReduction.lean`):
```lean
theorem asr_rt_not_computable (asr : ASR F) : ¬ ComputablePred asr.RT
```

**DiagonalCapable (carries ASR data)** (`MFRR/DiagonalBarrier.lean`):
```lean
class DiagonalCapable (F : Framework) where
  asr : ASR F

theorem diagonal_barrier_rt (F : Framework) [dc : DiagonalCapable F] :
  ¬ ComputablePred dc.asr.RT
```

**Headline bridge theorems** (`MFRR/BridgeToNEMS.lean`):
```lean
theorem PSC_and_choice_force_PT :
  PSCBundle F IsInternal → HasRecordDivergentChoice F cd → ∃ _pt : PT F IsInternal, True

theorem PSC_choice_diagonal_forces_constrained_selection [DiagonalCapable F] :
  PSCBundle F IsInternal → HasRecordDivergentChoice F cd →
  (∃ S, IsInternal S) ∧ ¬ ComputablePred dc.asr.RT

theorem PSC_classification [DiagonalCapable F] :
  PSCBundle F IsInternal →
  F.ObsCategorical ∨ ((∃ S, IsInternal S) ∧ ¬ ComputablePred dc.asr.RT)
```

### 3.10 Adding a new theorem to the library

1. **Choose the right tier.** For **abstract-core papers (26+)** or companion formalizations: add to the appropriate **abstract library** (SelfReference, Closure, Reflection, SelectorStrength, Learning, EpistemicAgency, SelfImprovement, SelfAwareness, Sieve). For **framework-spine content (Papers 1–25)**: add to **NemS** (Core, Diagonal, MFRR, etc.). Do not duplicate abstract definitions inside NemS for new abstract-core results.
2. **Decide which file it belongs in** based on MANIFEST.md and the module structure (abstract libs vs. NemS/).
3. **Read the existing file** to understand the namespace and variable conventions.
4. **Write the theorem** using the existing definitions. Key conventions:
   - Use `variable {F : Framework}` for implicit framework arguments
   - Use `variable {IsInternal : F.Selector → Prop}` for implicit internality
   - Use `NEMS F IsInternal` (explicit args), not `F.NEMS IsInternal` (dot notation causes resolution issues)
   - Label every theorem: `\label{thm:my-theorem}` in LaTeX, `@[simp]` or named in Lean
5. **Import the file** in the root barrel for that library (e.g. `SelfReference.lean`, `Closure.lean`, or `NemS.lean`) if it's a new file.
6. **Run `lake build`** and fix any errors before committing.

**Common Lean 4 pitfalls in this library:**
- `import` must be the **first line** of a file (before doc comments)
- Dot notation `F.NEMS` can fail if `NEMS` takes explicit `F` arg; use `NEMS F IsInternal` instead
- `push_neg` doesn't work on unexpanded `def`s; use `simp only [DefName, ...]` first
- `Quotient.inductionOn` syntax: `| h M => ?_` not `| h => ?_`

### 3.11 Lean ↔ LaTeX correspondence

Every Lean theorem should correspond to a named result in the LaTeX papers.
The correspondence is documented in `nems-lean/MANIFEST.md` and in the
"Machine-Checked Proof Artifact" section of each paper.

When you add a new Lean theorem, also:
1. Add it to the correspondence table in `MANIFEST.md`
2. Add a `\bibitem{NEMSLean}` citation at the relevant point in the LaTeX paper
3. Update the "Machine-Checked Proof Artifact" section if it's a headline result

### 3.12 The `lakefile.lean`

```lean
import Lake
open Lake DSL

package nems where

require mathlib from git
  "https://github.com/leanprover-community/mathlib4.git" @ "v4.29.0-rc3"

@[default_target]
lean_lib NemS where
  globs := #[.submodules `NemS]
```

- `require mathlib` pins Mathlib to v4.29.0-rc3 (matching the Lean toolchain)
- Each library (NemS, SelfReference, Closure, …) has a `lean_lib` target with `globs := #[.submodules \`LibName]`
- To add a new **abstract** library (e.g. Hypercomputation for Paper 35): add a new `lean_lib` and root barrel; follow the pattern of Sieve or Learning. To add a new submodule under an existing lib, create the directory and files; Lake picks them up automatically

---

## Part 4: Workflow for New Content

### Adding a new paper (LaTeX)

```
1. mkdir "NN_Paper_Title"
2. Create NN_Paper_Title.tex with \input{../suite_preamble} + \input{../suite_macros}
3. Write content using suite macros
4. Add all cross-citations (bibitem keys above)
5. Add \bibitem{SpivackNewPaper} to all other papers
6. pdflatex twice to compile
7. git add -A && git commit
```

### Adding a new Lean module

**Abstract-core (Papers 26+):** Add to the appropriate abstract library (SelfReference, Closure, Reflection, SelectorStrength, Learning, EpistemicAgency, SelfImprovement, SelfAwareness, Sieve). Use existing APIs; do not re-implement NemS-level definitions.

**Framework spine (Papers 1–25):** Add to NemS (e.g. NemS/Module/File.lean).

```
1. Create LibName/Module/File.lean  (or NemS/Module/File.lean for framework spine)
2. First line: import LibName.Dep  (e.g. Reflection.Core.SRI_R, or NemS.Core.Trichotomy)
3. Write theorems in the library’s namespace
4. Add import to the library’s root barrel (e.g. Reflection.lean, NemS.lean)
5. lake build  (fix any errors)
6. Update MANIFEST.md (and ARTIFACT.md / README.md if new library)
7. git add -A && git commit
```

### Modifying an existing theorem

```
1. Read the file carefully first
2. Make the change
3. lake build  (must still show 0 errors, zero sorry)
4. If the change affects a LaTeX paper, update the paper too
5. git add -A && git commit
```

---

## Part 5: After Finishing a Paper

**Required:** When a paper is completed (or a new Lean library is added for a paper), update all of the following so the suite and artifact stay in sync:

**For NEMS/abstract-core papers (01–70):** Use `nems-lean/` and `reflexive-closure-lean/` as applicable.  
**For Viable Continuation papers (71–72):** Use `viable-continuation-lean/`.  
**For Sentience (73):** Use `sentience-lean/` (real path: `~/sentience-lean`).  
**For Phenomenology (74, 75):** Use `phenomenology-lean/` (real path: `~/phenomenology-lean`).

| Item | Location | Action |
|------|----------|--------|
| **MANIFEST.md** | `nems-lean/MANIFEST.md` | Add the paper’s Lean library (if any), theorem table, and companion-papers line; update job count if needed. |
| **ARTIFACT.md** | `nems-lean/ARTIFACT.md` | Add the paper to the abstract-core spine list and Companion Papers; update build/job description if needed. |
| **README.md** | `nems-lean/README.md` | Add the library to the intro line, the Libraries table, and the “Papers and manifest” list. |
| **lakefile.lean** | `nems-lean/lakefile.lean` | If the paper has a new Lean library, add `lean_lib LibraryName where globs := #[.submodules \`LibraryName]`. |
| **lake-manifest.json** | `nems-lean/lake-manifest.json` | Updated by `lake update` when dependencies change; run after editing `lakefile.lean` if needed. |
| **0.1_PAPER_SUMMARIES.md** | `si_optimizer_data/0.1_PAPER_SUMMARIES.md` | Add a one-paragraph summary for the new paper in the correct section (§6 NEMS 01–25, §7 abstract-core 26–51, §9 Viable Continuation 71–72). |
| **docs/Overview.md** | `nems-lean/docs/Overview.md` | If the new paper has a Lean library or is listed in the overview, add/update the library description and References section. |

Also update **STATUS.md** at `NEMS_PAPERS/STATUS.md` (or the paper’s STATUS.md in its folder) for spine range and Lean artifact line. Do not advance to the next paper without completing these updates.

### 5.1 Consolidated docs and PDFs (MANDATORY when finishing a paper)

**Script location:** `NEMS_PAPERS/create_consolidated_md.py`  
**Full path:** `.../si_optimizer_data/Physics_Papers/NEMS_PAPERS/create_consolidated_md.py`

When you complete or add a new flagship paper (including Papers 73, 74, 75 when they exist), you **must**:

1. **Add the paper to `create_consolidated_md.py`** if it is a new paper type (e.g. Paper 74 flagship, Paper 75 flagship). The script has `build_sentience_papers()` for Paper 73; extend or add analogous builders for Papers 74/75 when their flagship `.tex` files exist.

2. **Run the consolidated build:**
   ```bash
   cd NEMS_PAPERS
   python create_consolidated_md.py --all
   python create_consolidated_md.py --sync-pdfs
   ```

3. **Output locations:** Consolidated `.md` files go to `NEMS_PAPERS/NEMS_Consolidated_Paper_Suite/`:
   - `NEMS_75_Papers_Plus_UGP_GTE_Formalization.md`
   - `NEMS_75_Papers_Plus_Notes_Only.md`
   - `Full_Suite_NEMS_Physics_01_12_GTE_Meta_Nuclear_MFRR_Zipf.md`

   PDFs are copied from paper directories to `NEMS_Consolidated_Paper_Suite/` when you run `--sync-pdfs`.

**Rule:** Do not consider a paper "finished" until the consolidated docs have been rebuilt and the new paper is included.

---

## Part 6: Git Conventions

- **Commit message format:** `[scope]: brief description`
  - `Paper 2: add ER section`
  - `Lean: add diagonal barrier module`
  - `Suite: fix cross-citations`
- **Commit all changed files together** — don't split LaTeX and Lean changes across commits unless they're logically independent
- The Lean library lives in its own repo at `~/nems-lean`; the outer repo tracks `NEMS_PAPERS/nems-lean` as a **symlink** to that path. Commit Lean changes from the real path: `cd ~/nems-lean && git add -A && git commit`. Commit paper and repo changes (including the symlink if you recreated it) from the outer repo root.

### How to commit everything (full-suite commit)

When you have uncommitted changes in **both** the Lean library and the outer repo (papers, docs, symlink), use this order so both repos end up consistent:

1. **Commit the Lean repo first** (from the real path, not via the symlink):
   ```bash
   cd ~/nems-lean
   git add -A
   git status   # optional: verify what will be committed
   git commit -m "Your message (e.g. Papers 42-50: libs X,Y,Z; MANIFEST, ARTIFACT, README)"
   ```

2. **Then commit the outer repo** (from the repo root that contains `NEMS_PAPERS/`):
   ```bash
   cd "/path/to/your/repo/root"   # e.g. Particle Derivations or parent of si_optimizer_data
   git add -A
   git status   # optional: verify; nems-lean will show as symlink typechange if needed
   git commit -m "Your message (e.g. NEMS: Papers 42-50; docs; nems-lean symlink)"
   ```

The outer repo records the **symlink** (and any path/type change); it does not commit the contents of `~/nems-lean`, which live only in the Lean repo. Doing the Lean commit first keeps the two histories aligned when you have both Lean and paper changes.

---

## Part 7: Quick Reference Card

### LaTeX

| Task | How |
|------|-----|
| Start a new paper | `\documentclass[11pt]{article}` + `\input{../suite_preamble}` + `\input{../suite_macros}` |
| Write a theorem | `\begin{theorem}[Name]\label{thm:x}` ... `\end{theorem}` |
| Reference a theorem | `\Cref{thm:x}` |
| Use record language | `\LangRec` |
| Use NEMS abbreviation | `\NMstar`, `\PSC`, `\RC`, `\SA` |
| Compile | `pdflatex -interaction=nonstopmode "File.tex"` (twice) |

### Lean

| Task | How |
|------|-----|
| Build library | `cd ~/nems-lean` (or `~/sentience-lean`, etc.) then `lake build` — always use real path, never long symlink |
| Check one file | `lake build NemS.Core.Trichotomy` or e.g. `lake build Sieve.Theorems.Residual` |
| Add a theorem (abstract-core) | Add to appropriate abstract lib: `SelfReference/`, `Closure/`, `Reflection/`, `SelectorStrength/`, `Learning/`, etc. |
| Add a theorem (framework spine) | Add to `NemS/Module/File.lean` |
| Use NEMS (NemS) | `NEMS F IsInternal` (explicit args) |
| Use ObsEq (NemS) | `Framework.ObsEq F M N` or `F.ObsEq M N` |
| Quotient (NemS) | `toWorldType F M` returns `Quotient (obsEqSetoid F)` |
| Avoid sorry | Do not use `sorry` without documenting in MANIFEST.md; use `exact?`, `apply?`, `simp?` to find proofs |

### Consolidated docs

| Task | How |
|------|-----|
| Rebuild consolidated .md | `cd NEMS_PAPERS && python create_consolidated_md.py --all` |
| Sync PDFs to suite | `cd NEMS_PAPERS && python create_consolidated_md.py --sync-pdfs` |
| Add new paper | Edit `create_consolidated_md.py` (e.g. add builder for Paper 73/74), then run `--all` and `--sync-pdfs` |
