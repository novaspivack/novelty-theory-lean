# Documentation index

**Master map for novelty-theory-lean.** When you add, rename, or remove a doc under `docs/`, update this file in the same change.

## Read first (agents)

1. [`AGENTS.md`](../AGENTS.md)
2. [`QUEUE.md`](../QUEUE.md) — cross-epic queue + **agent execution contract**
3. [`NOTES/PROJECT_SEED.md`](../NOTES/PROJECT_SEED.md)
4. [`CODING_PROTOCOLS.md`](../CODING_PROTOCOLS.md) — Lean proof quality + execution discipline
5. [`.cursorrules`](../.cursorrules) / [`.cursor/rules/stub-agent-contract.mdc`](../.cursor/rules/stub-agent-contract.mdc)
6. This index — **001** overview, **002** setup, **004** layout, **007**–**008** positioning / paper prep

## CI

- [`.github/workflows/ci.yml`](../.github/workflows/ci.yml) — `leanprover/lean-action` (Lean + Lake build)
- [`scripts/verify_paper_leanrefs.py`](../scripts/verify_paper_leanrefs.py) — optional cross-check of `\leanref{NoveltyTheory…}` in `paper/Final Draft/novelty_theory_generalized_crown.tex`

## Numbered docs

| Doc | Description |
|-----|-------------|
| [001_PROJECT_OVERVIEW.md](001_PROJECT_OVERVIEW.md) | What this Lean library is and how it is organized |
| [002_DEVELOPER_SETUP.md](002_DEVELOPER_SETUP.md) | Elan, `lake build`, bump process |
| [003_LEAN_TOOLCHAIN_PIN.md](003_LEAN_TOOLCHAIN_PIN.md) | Canonical Lean 4 RC (`v4.29.0-rc6`) |
| [004_LEAN_LIBRARY_LAYOUT.md](004_LEAN_LIBRARY_LAYOUT.md) | Lake, `NoveltyTheory/`, manifest |
| [THEOREM_INVENTORY.md](THEOREM_INVENTORY.md) | Full catalog of public `theorem` / `lemma` under `NoveltyTheory/` |
| [007_LIBRARY_POSITIONING_ASSESSMENT.md](007_LIBRARY_POSITIONING_ASSESSMENT.md) | How the inventory reframes the library (Wave 2, beyond genotype/phenotype, crown targets) |
| [CROWN_POSITIONING.md](CROWN_POSITIONING.md) | What crown theorems claim / do not claim (boundaries vs universals) |
| [CROWN_DEPENDENCY_MAP.md](CROWN_DEPENDENCY_MAP.md) | Crown-related dependency DAG (includes landed `EPIC_011` modules) |
| [GENERALIZED_CROWN_POSITIONING.md](GENERALIZED_CROWN_POSITIONING.md) | Post-`EPIC_011` carrier / `v2` / modal / org / transfer boundary |
| [GENERALIZED_CROWN_DEPENDENCY_MAP.md](GENERALIZED_CROWN_DEPENDENCY_MAP.md) | Dependency DAG for **`EPIC_012`** (`SPEC_048_GC1`–`SPEC_053_GC6`) |
| [STRENGTHENED_CLAIM_SURFACE.md](STRENGTHENED_CLAIM_SURFACE.md) | Claim ↔ Lean table + trust boundary for **`EPIC_013`** (naturality / broad transfer / anti-closure) |
| [STRENGTHENED_DEPENDENCY_MAP.md](STRENGTHENED_DEPENDENCY_MAP.md) | Import / summit DAG for **`EPIC_013`** modules |
| [CANONICALITY_POSITIONING.md](CANONICALITY_POSITIONING.md) | Claim ledger for **`EPIC_014`** (canonicality / minimality / inevitability; epic complete) |
| [CLOSURE_DICHOTOMY_MAP.md](CLOSURE_DICHOTOMY_MAP.md) | Numeric `FutureDefeat` ↔ bounded-trace boundary + open lifts (**`EPIC_014`**) |
| [000.1_AI_CODING_BEST_PRACTICES.md](000.1_AI_CODING_BEST_PRACTICES.md) | Optional AI/agent workflow notes |
| [005_TODO_REGISTRY.md](005_TODO_REGISTRY.md) | Discrete TODOs tied to code locations |
| [006_TECHNICAL_DEBT_REGISTRY.md](006_TECHNICAL_DEBT_REGISTRY.md) | Larger follow-ups |
| [008_PAPER_PREPARATION_FIXED_GENERATION.md](008_PAPER_PREPARATION_FIXED_GENERATION.md) | Claim freeze, theorem↔prose discipline, comparison/boundary checklist for the LaTeX paper |
| [KEY_LEARNINGS.md](KEY_LEARNINGS.md) | Durable pitfalls and FAQs |

## Specs and status

- Roll-up: [`../specs/MASTER_STATUS.md`](../specs/MASTER_STATUS.md)
- Bootstrap epic: [`../specs/INCOMPLETE/IN-PROCESS/EPIC_001_NOVELTY_THEORY_LEAN/`](../specs/INCOMPLETE/IN-PROCESS/EPIC_001_NOVELTY_THEORY_LEAN/)
- Theory epic (self-transcending generators): [`../specs/INCOMPLETE/IN-PROCESS/EPIC_002_SELF_TRANSCENDING_GENERATORS/`](../specs/INCOMPLETE/IN-PROCESS/EPIC_002_SELF_TRANSCENDING_GENERATORS/); normative closure [`SPEC_034_R2B`](../specs/INCOMPLETE/IN-PROCESS/SPEC_034_R2B_EPIC002_SCOPE_CLOSURE.md)
- Sentence / strata / organization wave (**`SPEC_013_ES1`**–**`SPEC_032_SVE3`**) + formal tranche closure (**`SPEC_033_K7A`**): [`../specs/INCOMPLETE/IN-PROCESS/EPIC_003_EXPRESSIVE_STRATA_AND_SENTENCE_UNIVERSE/`](../specs/INCOMPLETE/IN-PROCESS/EPIC_003_EXPRESSIVE_STRATA_AND_SENTENCE_UNIVERSE/) through [`../specs/INCOMPLETE/IN-PROCESS/EPIC_008_SIMULATION_VS_EXPLANATION_ABSTRACT/`](../specs/INCOMPLETE/IN-PROCESS/EPIC_008_SIMULATION_VS_EXPLANATION_ABSTRACT/); roll-up [`../specs/INCOMPLETE/IN-PROCESS/SPEC_033_K7A_FORMAL_TRANCHE_CLOSURE.md`](../specs/INCOMPLETE/IN-PROCESS/SPEC_033_K7A_FORMAL_TRANCHE_CLOSURE.md)
- Post-closure program (**complete v1**): **[`EPIC_009`](../specs/INCOMPLETE/IN-PROCESS/EPIC_009_STRICT_ITERATED_ASCENT/EPIC_009_MASTER_ORCHESTRATION.md)** (crown v1), **[`EPIC_010`](../specs/INCOMPLETE/IN-PROCESS/EPIC_010_EXPRESSIVE_ORGANIZATION_FRONTIER/EPIC_010_MASTER_ORCHESTRATION.md)** (expressive / org frontier). **Crown completion v2:** **[`EPIC_011`](../specs/INCOMPLETE/IN-PROCESS/EPIC_011_CROWN_COMPLETION/EPIC_011_MASTER_ORCHESTRATION.md)** (`SPEC_042_CG1`–`SPEC_047_CG6`). **Generalized crown frontier:** **[`EPIC_012`](../specs/INCOMPLETE/IN-PROCESS/EPIC_012_GENERALIZED_CROWN_FRONTIER/EPIC_012_MASTER_ORCHESTRATION.md)** (`SPEC_048_GC1`–`SPEC_053_GC6`). **Naturality + inevitability:** **[`EPIC_013`](../specs/INCOMPLETE/IN-PROCESS/EPIC_013_NATURALITY_AND_INEVITABILITY_STRENGTHENING/EPIC_013_MASTER_ORCHESTRATION.md)** (`SPEC_054_NS1`–`SPEC_059_NS6`). **Canonicality / minimality / inevitability:** **[`EPIC_014`](../specs/INCOMPLETE/IN-PROCESS/EPIC_014_CANONICALITY_MINIMALITY_AND_INEVITABILITY/EPIC_014_MASTER_ORCHESTRATION.md)** (`SPEC_060_CMI1`–`SPEC_064_CMI5`). **Minimality audit (Lean-adjacent):** [`../NoveltyTheory/docs/MINIMALITY_AUDIT.md`](../NoveltyTheory/docs/MINIMALITY_AUDIT.md).
- Theory seed: [`../specs/INCOMPLETE/IN-PROCESS/THEORY_SEED.md/002_OCN_ORIGINAL_CONCEPT.md`](../specs/INCOMPLETE/IN-PROCESS/THEORY_SEED.md/002_OCN_ORIGINAL_CONCEPT.md) (**`SPEC_002_OCN`**), [`../specs/INCOMPLETE/IN-PROCESS/THEORY_SEED.md/003_NXT_NEXT_WAVE.md`](../specs/INCOMPLETE/IN-PROCESS/THEORY_SEED.md/003_NXT_NEXT_WAVE.md) (**`SPEC_003_NXT`**), [`../specs/INCOMPLETE/IN-PROCESS/THEORY_SEED.md/004_IMPROVEMENTS.md`](../specs/INCOMPLETE/IN-PROCESS/THEORY_SEED.md/004_IMPROVEMENTS.md) (roadmap; formal specs use **013**–**032** suffix IDs)

## Reference packs (optional)

| Path | Note |
|------|------|
| [`../NOTES/CODING_PROTOCOLS_NEMS_SUITE.md`](../NOTES/CODING_PROTOCOLS_NEMS_SUITE.md) | NEMS / paper-suite reference (not required for this library) |
