# PROJECT_SEED — Agent-Oriented Project Brain

**Purpose:** Copy this file into the root of a Cursor workspace (or symlink it) so agents inherit a consistent methodology without you repeating it every session. Treat it as the **default contract** for how work is planned, executed, recorded, and handed off.

> **This repository (novelty-theory-lean):** Standalone **Lean 4** library at repo root — see **[`QUEUE.md`](../QUEUE.md)** item 9 on submodule layout for *parent* repos. Proof discipline: **[`CODING_PROTOCOLS.md`](../CODING_PROTOCOLS.md)** (*Proof quality* + *Lean audit* in **[`QUEUE.md`](../QUEUE.md)**).

**Scope:** This seed is **methodology**, not product facts. Replace bracketed placeholders when you instantiate it on a new repo. VYRA-shaped examples below illustrate patterns you can reuse in any stack (Python, Lean, Node, mixed).

---

## 1. Why this exists

Agents reason better with **persistent structure** than with chat history alone. You get:

- A stable map (`docs` index + architecture) so retrieval and onboarding stay cheap.
- Executable truth for active work (`specs/` + epic orchestration) so priorities do not drift.
- Registries that separate **actionable tasks** (TODO) from **structural gaps** (technical debt).
- Progress artifacts humans can grep or skim for status without re-running the conversation.

---

## 2. Directory skeleton (recommended)

Use the same shape **even when the project is not Python or Lean**; empty folders or minimal stubs are fine until code arrives.

```text
docs/
  000_INDEX.md              # Master map: every doc; "must read" ranked list optional
  001_* ...                 # Numbered docs: overview, usage, conventions, architecture ...
  005_TODO_REGISTRY.md      # Discrete TODOs tied to code locations (optional but high leverage)
  006_TECHNICAL_DEBT_REGISTRY.md
  KEY_LEARNINGS.md          # Optional: grep-friendly meta-knowledge (see §9)
specs/
  MASTER_STATUS.md          # Optional repo-wide epic/spec audit and roadmap
  COMPLETE/
    EPIC_NNN_.../           # Finished epics grouped by folder
  INCOMPLETE/
    IN-PROCESS/
      EPIC_NNN_.../
        EPIC_NNN_MASTER_ORCHESTRATION.md   # Phases, queue, cross-links
        SPEC_*_*.md
NOTES/                      # Non-normative seeds, scratch, methodology (this file)
QUEUE.md                    # Cross-epic queue + agent execution contract (repo root)
.cursorrules                # Or .cursor/rules/ — enforce project-local constraints
```

**Specs vs docs:** **Never** put normative specs under `docs/`. Specs belong under `specs/` (IN-PROCESS / INCOMPLETE / COMPLETE). `docs/` is for **finished explanations**, runbooks, and developer-facing references.

---

## 3. Naming and numbering

### 3.1 Documentation (`docs/`)

- Pattern: `NNN_TITLE.md` (three-digit prefix, then descriptive `TITLE`).
- **Always** take the **next** sequence number after the highest existing doc **in that repo** (search both number and title conflicts).
- Maintain **`docs/000_INDEX.md`** (or your repo’s chosen index name): every add/remove of a doc updates the index. The index may also link to specs and epics (VYRA uses a large unified index).

### 3.2 Specs (`specs/`)

- Pattern: **`SPEC_NNN_XXX_DESCRIPTIVE_NAME.md`**
  - `NNN`: three-digit sequence — assign **next** after global search for highest spec number.
  - **`XXX`:** unique three-character **alphanumeric suffix** so parallel agents never collide on `SPEC_123` titles.
- References in prose, code comments, and other specs must cite **at least** `SPEC_NNN_XXX` (number + suffix), not bare `SPEC_123`.
- Lifecycle: active work under `specs/INCOMPLETE/IN-PROCESS/` (often grouped in `EPIC_NNN_*` folders); completed work under `specs/COMPLETE/`.

### 3.3 Epics

- Folder: `specs/.../EPIC_NNN_SHORT_TITLE/`
- **Master orchestration** file in that folder (e.g. `EPIC_NNN_MASTER_ORCHESTRATION.md`): goal, dependencies, phase breakdown, **living checklist**, and **Queue** section for ordered next steps.
- Optional repo-wide roll-up: `specs/MASTER_STATUS.md` — one table for active epics, deferred, complete, and “where to look next.”

---

## 4. The documentation stack (what agents must keep fresh)

After **each coherent unit of work** (a spec phase, a bugfix batch that changes behavior, a new entrypoint):

1. **`docs/000_INDEX.md`** — new or removed docs linked.
2. **Architecture doc** — for non–pure-formal projects, keep something like `docs/004_*_ARCHITECTURE*.md` aligned with modules, pipelines, and entry points. When a spec lands, the architecture doc should not lie about what exists.
3. **Focused functional docs** — if a feature area is large (run modes, validation harness, help system), add or update a dedicated numbered doc and index it.
4. **Spec / epic files** — mark acceptance criteria, checkboxes, and status; move to `COMPLETE` when done per project rules.
5. **Registries:**
   - **TODO registry** — any new `TODO` in code gets an entry (file, scope, status). Resolve by moving to a “Resolved” section or deleting with the fix.
   - **Technical debt registry** — use for *systemic* gaps (“we only support single scenario”) vs one-off TODOs.

**Difference (operational):** TODO = implement this stub or wire this call site. Debt = we need a design or multi-sprint effort; document the gap honestly.

If the project uses **manifests, artifact inventories, theorem lists, or formalization maps**, treat updates to those as **part of the same “definition of done”** as code and tests — not optional polish.

---

## 5. Orchestration, handoff, and queue discipline

### 5.1 Single source of truth per epic

The epic’s **`EPIC_NNN_MASTER_ORCHESTRATION.md`** (or `STATUS_AND_HANDOFF.md` where you use that name) should answer:

- What is **done** (with pointers to commits, CLIs, artifact paths).
- What is **in flight**.
- **Queue:** ordered next actions; each row should be executable without re-deriving context.
- **Cross-links:** score logs, experiment JSONL paths, architecture sections, other specs.

See VYRA’s pattern: a **“Living progress tracker”** table + **“Queue — roadmap”** section with phased tables and explicit “next” lines.

Each queued row should be **stable text in the repo** (not only chat): when you learn something that changes sequencing, **edit the file** so the next agent inherits the truth.

### 5.2 Managing the queue (agent owns the backlog)

The model **actively maintains** the queue, not only reads it. Treat the queue as a **living backlog** in markdown (or your issue tracker, if the project uses one — same rules).

| Operation | What to do |
|-----------|------------|
| **Add** | Insert a new row or bullet with clear outcome, owner context (“agent”), pointers (spec section, files). If urgency matters, set **priority** (see below). |
| **Reprioritize** | Reorder rows, or add a **P0 / P1 / P2** column (or “Next / Later / Icebox”). Document *why* in one line when it is not obvious. |
| **Remove** | Delete or move to a **“Dropped / superseded”** subsection with a one-line reason (avoids revive loops). |
| **Done** | Mark complete (checkbox `[x]`, status **Done**, or move row to a **“Completed”** table with date + evidence link). |
| **Status without finishing** | Use explicit states: **Blocked**, **Waiting on user/PI**, **In progress**, **Superseded**, **Deferred** (with pointer to debt/TODO if deferred). Do not leave items ambiguous. |

**Default execution scope:** Unless the user clearly limits work (e.g. “only Phase 4B” or “stop after the next three items”), assume the target is **`DONE` for the entire queue** that applies to the current epic or `QUEUE.md`. If the user names a **major segment** of the queue, complete that segment as the success criterion, then report done for that segment.

**Run until one of these terminal conditions:**

1. **`DONE`** — Every item in scope is completed or explicitly moved to a non-pending terminal state; summarize evidence (what changed, where it is documented, how to verify).
2. **`BLOCK`** — Cannot proceed without an external dependency (credentials, third-party fix, missing data). Document: what is missing, what was tried, exact unblocker.
3. **`STOP AND ASK`** — Only when **user or PI (principal investigator / product owner) judgment** is required: e.g. irreversible tradeoff, security/legal call, spec interpretability that changes science or scope, or spend/cost approval. Do **not** use this for ordinary debugging — exhaust repo context, tests, and `KEY_LEARNINGS` first.

Between terminal states: **pick the next item by priority**, execute it, update status in the same edit pass as the code/docs when practical, then immediately **consume the next queue item** (no “I could continue” without continuing, unless you hit 1–3).

### 5.3 Repo-wide status

Maintain **`specs/MASTER_STATUS.md`** (or equivalent) when many epics run in parallel: active / deferred / complete epic rows, key metrics or validation summaries if they drive decisions.

### 5.4 Agent work loop (contract)

When the user asks for sustained execution:

1. **Read** the epic orchestration + current spec + relevant architecture slice; **reconcile the queue** (§5.2) so it matches reality.
2. **Execute** the highest-priority **not-done** item (or the user’s explicit override task).
3. **Update** the queue row’s status, orchestration checklist, spec acceptance, and registries **in-repo** — not only in chat.
4. **Run** tests / lints per project rules; fix failures at the root cause.
5. **Loop:** return to step 2 until one of the terminal conditions in §5.2 (**DONE**, **BLOCK**, **STOP AND ASK**) for the **agreed scope** (whole queue by default).

### 5.5 Repo-root `QUEUE.md` (recommended default)

Keep a project-root **`QUEUE.md`** in every repo that uses this seed. It serves two roles:

1. **Cross-epic backlog** — ordered rows for work that spans or sequences multiple epics (`MASTER_STATUS` still rolls up epic state).
2. **Persistent agent contract** — a **non-optional block at the top** of `QUEUE.md` that restates execution discipline: **keep processing the queue yourself** until epics are **fully closed** per specs; seek the **strongest** proofs (Lean) or **most robust** code (Python/Node per [`CODING_PROTOCOLS.md`](../CODING_PROTOCOLS.md)); use **STOP AND ASK** only when **genuinely stuck** after exhausting repo context and tools (see §5.2). Agents should **open `QUEUE.md` every session** so this contract stays in view.

The template stub ships **[`QUEUE.md`](../QUEUE.md)** at the repo root — **do not delete the contract block** without owner approval; update the tables as work moves.

---

## 6. Cursor rules and protocols

- Put **non-negotiables** in **`.cursorrules`** or `.cursor/rules/` (environment, forbidden patterns, lint discipline, spec/doc update obligations). Keep that file **short and enforceable**; put narrative in `docs/` and this seed.
- If you use **`CODING_PROTOCOLS.md`** (repo root or `docs/`), link it from the index and mention it in `.cursorrules` so agents load it for style, commit discipline, and review expectations.

---

## 7. Git and multi-repo hygiene

- **Commit** changes in **this** repo when work is coherent and tested; prefer **commits only for files you touched** when multiple agents share a branch (avoids stomping).
- If the workspace has **inner/outer repos**, **symlinked dependencies**, or you intentionally edit another checkout: **commit in each affected repo** as appropriate.
- **Push** only when the user approves (some teams treat push as release-grade).

### 7.1 `.gitignore` — what to keep vs omit

Root **`.gitignore`** (and per-directory ignore files) should follow this **default contract** unless the project documents an explicit exception:

| Policy | Patterns / files | Notes |
|--------|------------------|--------|
| **Do not ignore** | **`*.pdf`**, **`*.md`** | Papers, exports, and prose belong in the repo when they are source or deliverables. |
| **Do not ignore** | **Important JSON** and other **small committed resources** (fixtures, manifests, schemas, non-generated config) | Do not blanket-ignore `*.json` if the team tracks real artifacts; ignore only generated paths. |
| **Do not ignore** | **`.env` files** | When this repo’s policy is to version environment files (or templates alongside real `.env`), **do not** add rules that drop `.env` from Git without an explicit, documented decision. |
| **Ignore** | **Build artifacts** | Stack-specific outputs: e.g. `dist/`, `build/`, `target/`, `.lake/`, `node_modules/`, compiled objects, package caches. |
| **Ignore** | **Logs** | e.g. `*.log`, dedicated log directories. |

Avoid catch-all rules (e.g. `*` patterns) that accidentally exclude PDFs, markdown, needed JSON, or `.env` files the team relies on.

### 7.2 Large files and Git LFS

**Large** binaries, datasets, or generated blobs must **not** be committed as ordinary Git objects.

- Use **Git LFS**: `git lfs install` (per clone), track patterns in **`.gitattributes`**, document the setup in **`docs/002_*`** or **`README.md`**.
- **Inform contributors** that LFS is required for those paths (clone with LFS, CI smudge filters).
- **Verify LFS is available** before assuming it works: run `git lfs version` locally and in CI. It is **usually** installed on developer machines; treat “probably there” as something you **confirm**, not assume.

### 7.3 Lean libraries — Git submodule (default layout)

When a project ships a **Lean 4** library alongside prose or orchestration in the **parent** repository, the Lean tree should normally be a **separate git repository** registered as a **`git submodule`** under the parent (not an unwritten inner `.git` without submodule, and not only a loose folder without its own history unless the owner opts out). The parent tracks **docs/specs/** and submodule pointer; Lean commits happen **inside** the submodule directory.

---

## 8. External-facing code, commentary, and LaTeX papers

### 8.1 Code names and comments (public / role-based)

- **Identifiers (modules, types, public APIs, repo-visible names):** Choose **role-based** names oriented to **external audiences** (readers and users of the artifact), not private nicknames or chat shorthand.
- **Comments:** No **self-talk** or **meta-talk** (“I think…”, “the user wanted…”, “TODO for advisor”). Write **externally helpful** comments: what the construct does, invariants, or non-obvious contract — as if for a reviewer or downstream maintainer you will never meet.
- **Never** refer to the **advisor**, **user**, **owner**, **PI**, or **any person** in **code**, **identifiers**, or **comments**.

### 8.2 LaTeX papers — audience boundary

- **References:** Every paper must include a proper **References** section. Use a **`.bib` file** and `\bibliography` / `biblatex` when the user asks for one **or** the project already uses that pattern; otherwise maintain a **manual bibliography** section with consistent citations.
- **Lean-backed papers — appendices:** It is **good practice** to include a **theorem / declaration inventory** and a **dependency map** (imports / theory graph) as **appendices** so readers can navigate the formal artifact.
- **No internal dev paths in prose:** Do **not** tell readers to open **`docs/*.md`**, **`specs/`**, **`QUEUE.md`**, or other **internal** repo paths. If content matters for the paper, **write it in the paper** (or cite a stable **external** URL if one exists).
- **No internal specs/docs as substitutes for content:** Do **not** point paper readers at **`specs/`** or **`docs/`** for the scientific narrative. Those trees are for **internal** audiences (`code` / `docs` / `specs` / `NOTES`). **Exception:** it is acceptable when a paper **explicitly** cites a **designated public documentation location** for a codebase (e.g. published manual or Zenodo README) — not ad-hoc markdown in a private workflow.

### 8.3 LaTeX prologue template (exemplar)

**New `.tex` papers** should mirror the **structural prologue** of the exemplar (adjust packages to need, keep the same *class* of choices):

- **Path (authoritative exemplar):** `representational-incompleteness/lean/paper/Representational_Incompleteness.tex` — full path on the author machine: **`/Users/nova/representational-incompleteness/lean/paper/Representational_Incompleteness.tex`**
- **Pattern:** leading **comment** identifying the source and Lean companion; **`article` 11pt**; **`geometry`**, **`amsmath` / `amssymb` / `amsthm`**, **`hyperref`**; supporting utilities (`enumitem`, `array`, `booktabs`, `longtable`, `xcolor`, `stmaryrd`, `tcolorbox` as needed); **expl3 `\leanref`** (or equivalent) so long **Lean** names break in monospace; **`amsthm`** environments declared before `\begin{document}`; **`title` / `author` / `date`**, **`\maketitle`**, then a **structured `abstract`** with explicit **`\leanref{...}`** (or your stack’s analogue) tying prose to formal declarations.

When in doubt, **diff your preamble** against that file and align structure before adding idiosyncratic packages.

---

## 9. `docs/KEY_LEARNINGS.md` (optional but high ROI)

Use it as a **durable FAQ / pitfall log** for humans and agents:

- **Numbered entries** (e.g. `L-042`) with short titles.
- Enough **synonyms and error strings** in the body that `grep` finds the entry from different phrasings.
- **Cross-references** to specs, tickets, and files (`path/to/module.py`).
- When stuck, agents should **search KEY_LEARNINGS** before inventing workarounds.

You can fold FAQs, “don’t forget,” and postmortems here — not in scattered chats.

---

## 10. Starting a new agent chat (minimal grounding set)

Point context at:

1. This **PROJECT_SEED** (or the project’s `.cursorrules`).
2. **Repo-root [`QUEUE.md`](../QUEUE.md)** — execution contract + cross-epic queue (**especially for sustained execution**).
3. **`docs/000_INDEX.md`** and the **architecture** doc.
4. The active **`SPEC_NNN_XXX`** and **`EPIC_NNN_MASTER_ORCHESTRATION.md`**.
5. The module directory you will edit (`@path/to/module/`).

---

## 11. Model usage (pragmatic)

From practice (see also `docs/000.1_AI_CODING_BEST_PRACTICES.md` in VYRA):

- **Fast models:** large specs, boilerplate, straightforward implementations, doc updates.
- **Stronger models:** architecture, subtle debugging, high-risk refactors, spec review before execution.

Strategy-first beats purely ad-hoc Plan mode: **specs and orchestration are the plan**.

---

## 12. Instantiating this seed on a new workspace

1. Copy this file to `NOTES/PROJECT_SEED.md` (or repo root if you prefer).
2. Add a one-line pointer in **`docs/000_INDEX.md`** or `.cursorrules`: “Agents: read `NOTES/PROJECT_SEED.md` first.”
3. Create empty `docs/000_INDEX.md`, `specs/MASTER_STATUS.md`, and first epic folder as needed.
4. Keep **repo-root [`QUEUE.md`](../QUEUE.md)** with the **agent execution contract** at the top (see §5.5) — do not omit it unless the owner explicitly opts out.
5. Add project-specific **non-negotiables** to `.cursorrules` (stack, test command, migrations rule, etc.).
6. **Lean nested libraries:** Add them as a **git submodule** (§7.3) and pin **`lean-toolchain`** to the **canonical RC** in **`docs/003_LEAN_TOOLCHAIN_PIN.md`** (aligned with `reflexive-architecture-lean`), not an arbitrary nightly.

---

## 13. Reference: VYRA-specific files that exemplify this seed

| Pattern | Example path |
|--------|----------------|
| Doc index + ranked must-reads | `docs/000_INDEX.md` |
| AI + maintenance workflow | `docs/000.1_AI_CODING_BEST_PRACTICES.md` |
| Architecture | `docs/004_VYRA_ARCHITECTURE_DOCS.md` |
| TODO / debt | `docs/005_TODO_REGISTRY.md`, `docs/006_TECHNICAL_DEBT_REGISTRY.md` |
| Epic roll-up | `specs/MASTER_STATUS.md` |
| Living queue + progress | `specs/INCOMPLETE/IN-PROCESS/EPIC_027_*/EPIC_027_MASTER_ORCHESTRATION.md` |
| Cross-epic queue + agent contract | **`QUEUE.md`** (repo root) |

These are **illustrations**; other projects should mirror the *roles* of these files, not necessarily VYRA’s scale.

---

*End of seed — safe to copy verbatim into new workspaces and trim for smaller projects.*
