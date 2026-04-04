# Coding protocols (universal stub)

**Purpose:** Stack-agnostic rules for any repository cloned from this stub. Replace or extend the **Project specifics** section when you instantiate a real project.

**Reference packs in this repo:**

- **NEMS / Lean / LaTeX suite** (long-form): [`NOTES/CODING_PROTOCOLS_NEMS_SUITE.md`](NOTES/CODING_PROTOCOLS_NEMS_SUITE.md)

---

## Documentation and specs

| Area | Location | Rule |
|------|----------|------|
| **Normative specs** (requirements, acceptance, phased work) | `specs/` — especially `specs/INCOMPLETE/IN-PROCESS/` and `specs/COMPLETE/` | **Never** put specs under `docs/`. |
| **Finished explanations**, runbooks, developer reference | `docs/` | Numbered `NNN_TITLE.md`; maintain [`docs/000_INDEX.md`](docs/000_INDEX.md). |

### Spec filenames

- Pattern: **`SPEC_NNN_XXX_DESCRIPTIVE_NAME.md`**
  - `NNN`: next three-digit sequence after searching the repo for the highest existing spec number.
  - **`XXX`:** unique three-character alphanumeric suffix so parallel work never collides on the same number.
- References in prose, comments, and cross-links must cite **at least** `SPEC_NNN_XXX` (number + suffix), not a bare `SPEC_NNN`.

### Docs filenames

- Pattern: `NNN_TITLE.md`. Take the **next** sequence number after the highest doc in **this** repo; update the index when you add or remove docs.

If you see a cited spec number **without** a suffix in legacy material, search for duplicates and disambiguate before assuming which file is meant.

---

## Epics and orchestration

- Epic folders: `specs/.../EPIC_NNN_SHORT_TITLE/`
- Each epic should include a **master orchestration** file (living checklist, **Queue** of ordered next steps, cross-links). See [`NOTES/PROJECT_SEED.md`](NOTES/PROJECT_SEED.md) §5.
- **Repo-root [`QUEUE.md`](QUEUE.md):** cross-epic “next actions” and the **agent execution contract** (keep processing until epics are closed; STOP AND ASK only when truly stuck). Open **`QUEUE.md` every session** when doing sustained execution.
- Optional roll-up: [`specs/MASTER_STATUS.md`](specs/MASTER_STATUS.md)

---

## Execution discipline (all stacks)

Aligned with **[`QUEUE.md`](QUEUE.md)** (contract at top):

- **Default:** keep executing queue items yourself; update status in-repo after each; aim for the strongest defensible result (proofs or code) the spec allows.
- **Stop early only** for a real **STOP AND ASK** or **BLOCK** with documented unblocker ([`NOTES/PROJECT_SEED.md`](NOTES/PROJECT_SEED.md) §5.2).
- **Do not** pause for “advisor comfort” if you can still narrow the problem with tools and context — in most sessions you should finish the slice without owner input.

---

## Lean 4 (when this workspace includes a `*-lean` library)

- **Repository layout:** The Lean tree should normally be a **separate git repository** linked as a **`git submodule`** from the parent (see [`NOTES/PROJECT_SEED.md`](NOTES/PROJECT_SEED.md) §7.3). Parent holds docs/specs; commit Lean work **inside** the submodule.
- **Toolchain line:** `leanprover/lean4:v4.29.0-rc6` in the library root **`lean-toolchain`** (canonical pin; rationale and bump process: [`docs/003_LEAN_TOOLCHAIN_PIN.md`](docs/003_LEAN_TOOLCHAIN_PIN.md)).
- **Alignment:** Match **`reflexive-architecture/reflexive-architecture-lean`** unless this doc is explicitly updated.

### Proof quality (Lean)

These apply to **theorem proving** work (not to Python/Node unless you are editing Lean):

- **Strength:** Prefer the **most general** statements and arguments you can **fully justify** in-repo. Do not weaken a goal just to close a task unless the spec or owner explicitly allows it.
- **No smuggling:** Definitions and theorem statements must not **assume** what you still owe a proof of.
- **Earn the result:** Minimize **`sorry`**, avoid **shell proofs**, and treat **`axiom`** as a last resort with explicit documentation (what it buys, why it is needed, where to eliminate it).
- **Honesty:** Disclose **`sorry`**, nonstandard axioms, and proof gaps in the project’s **artifact manifest** (e.g. `MANIFEST.md`), epic notes, or spec; keep `lake build` green only when that reflects real partial work the team accepts.
- **Hygiene:** Match existing namespaces and style; no `//` inside Cypher-in-string-style pitfalls where `//` is not a comment.

**Ongoing Lean audit (every session that touches `*.lean`):** Search changed and related modules for **`sorry` and proof gaps**, **axioms** (needed vs accidental), **vacuous or near-vacuous claims** (hypotheses that collapse the statement), **lemmas that are weaker than they should be** for downstream use or honesty, and **definition smuggling** (predicates or structures that presuppose the main theorem). Tighten, prove, or document each finding — do not leave known gaps silent.

---

## Code quality (Python, Node, and imperative stacks)

When the artifact is **code** rather than Lean proofs:

- **Correctness:** Implement what the spec or ticket requires; fix **root causes** of failures — no silent catches or fake defaults that hide bugs.
- **Tests:** Add or update **automated tests** for behavior you change or add (`pytest`, `unittest`, Vitest/Jest, or project standard). Red/green on the paths you touch.
- **Types and lint:** Use **`mypy` / type hints** (Python) and **TypeScript strict** or project ESLint config (Node) when the repo already does; extend coverage when you touch modules.
- **APIs and I/O:** Validate boundaries; fail loud with actionable errors at trust boundaries; document non-obvious contracts.
- **Dependencies:** Prefer minimal, pinned versions where the project uses lockfiles; do not add heavy deps without a spec or debt note.

---

## External-facing identifiers and comments (all code)

Applies to **Lean**, **Python**, **Node**, and any other committed source:

- **Names:** Prefer **role-based**, **externally meaningful** identifiers (what the thing *is* in the problem domain), not chatty or private slang.
- **Comments:** **Externally helpful** only — state invariants, contracts, and non-obvious “why.” **No self-talk or meta-talk** (“we decided…”, “the user asked…”, “remind the PI…”).
- **People:** **Never** mention the **advisor**, **user**, **owner**, **PI**, or **any named person** in **code**, **identifiers**, or **comments**.

---

## LaTeX papers — audience boundary

Full policy: [`NOTES/PROJECT_SEED.md`](NOTES/PROJECT_SEED.md) §8. Summary:

- **References:** Include a real **References** section; use a **`.bib`** + bibliography toolchain when the user requests it **or** the project already does; otherwise maintain a clean manual bibliography.
- **Lean companion papers:** Prefer **appendices** with a **theorem / declaration inventory** and a **dependency map** (import / theory structure).
- **Internal docs OFF limits in prose:** Do **not** send readers to **`docs/*.md`**, **`specs/`**, **`QUEUE.md`**, or other internal paths — **put the substance in the paper**. Do **not** use internal specs/docs as stand-ins for scientific content (**exception:** a paper may cite a **designated public** documentation URL for a codebase).
- **Prologue template:** Align new `.tex` preambles with the exemplar **`Representational_Incompleteness.tex`** — [`/Users/nova/representational-incompleteness/lean/paper/Representational_Incompleteness.tex`](/Users/nova/representational-incompleteness/lean/paper/Representational_Incompleteness.tex) (`article` 11pt, `geometry` + core AMS + `hyperref`, `\leanref`-style Lean identifiers, `amsthm` setup, structured abstract with formal cross-refs).

---

## Migrations and schema (when applicable)

**Never edit a migration that has already run** in any environment. Add a **new** migration to fix or extend the schema. Migrations are identified by filename; changing old files causes drift and production failures.

---

## Code quality and execution

- **Root cause:** Fix failures at the source. Do not mask errors with silent fallbacks or “graceful” hiding of bugs.
- **Completeness:** Implement what the spec or ticket asks for; do not defer parts unless the user explicitly approves and you record the deferral.
- **Stubs and mocks:** If you add them, include a **TODO** in code calling out that they must be completed, with notes.
- **Pre-existing bugs:** If you find a bug in the repo, fix it (or register it in [`docs/006_TECHNICAL_DEBT_REGISTRY.md`](docs/006_TECHNICAL_DEBT_REGISTRY.md) with a concrete unblocker) — do not ignore it.
- **TODOs in code:** Add or refresh an entry in [`docs/005_TODO_REGISTRY.md`](docs/005_TODO_REGISTRY.md) when you add a actionable `TODO` in source.

**Difference (operational):** TODO registry = discrete implement/wire tasks. Technical debt registry = systemic gaps or multi-step design work; document honestly.

---

## Git and multi-repo hygiene

- Commit when work is coherent and verified; when multiple agents share a branch, prefer **commits that only include files you touched**.
- If the workspace has inner/outer repos or symlinks, **commit in each affected repository** as appropriate.
- Push or release only when the project owner approves.
- **`.gitignore`:** follow [**`NOTES/PROJECT_SEED.md`**](NOTES/PROJECT_SEED.md) §7.1 (keep **`.pdf`**, **`.md`**, needed **JSON/resources**, **`.env`** when policy says so; ignore **build outputs** and **logs**). **Large files:** Git LFS per §7.2 — verify `git lfs version` before relying on it.

Suggested message shape: **`[scope]: clear description`** (adjust to team convention).

---

## Definition of done (documentation)

After each coherent unit of work, update in-repo truth — not only chat:

1. [`docs/000_INDEX.md`](docs/000_INDEX.md) if docs changed.
2. Architecture or overview docs if structure or entry points changed.
3. Active spec/epic files: checklists, status, queue.
4. Repo-root **[`QUEUE.md`](QUEUE.md)** (cross-epic rows and contract block stay accurate).
5. TODO and technical debt registries as needed.

Full workflow: [`NOTES/PROJECT_SEED.md`](NOTES/PROJECT_SEED.md) §4–§5, §5.5, and §8 (papers + external-facing code).

---

## Project specifics — novelty-theory-lean

| Item | Value |
|------|--------|
| **Stack** | **Lean 4** + **Mathlib** (`v4.29.0-rc6`), Lake |
| **Install** | Elan; then `lake build` from repo root ([`docs/002_DEVELOPER_SETUP.md`](docs/002_DEVELOPER_SETUP.md)) |
| **Test / lint** | `lake build` (proofs are the test); follow proof-quality rules in this file |
| **Run** | N/A — library only |
| **Layout** | [`docs/004_LEAN_LIBRARY_LAYOUT.md`](docs/004_LEAN_LIBRARY_LAYOUT.md), [`MANIFEST.md`](MANIFEST.md) |

---

*End of universal protocols — keep this file short; put narrative and stack detail in `docs/`.*
