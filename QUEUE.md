# QUEUE — cross-epic backlog + agent execution contract

**Read this file every session** before working the backlog. The sections at the top are **stable requirements** (update them only when the project owner changes policy). The tables below are the **living queue** — edit them as work completes.

---

## Agent execution contract (do not remove — edit only with owner approval)

1. **Keep executing:** Process the queue by **doing the work yourself**. Pick the next item, implement it, update status in-repo, then **immediately** take the next item. Do not stop early because you “could ask the user” — keep going.

2. **Ambition:** Seek the **highest, strongest, most universal, and most earned** results the spec allows. Choose **optimal** queue ordering, proof strategy (Lean), and implementation tactics as you learn more.

3. **When to stop:** Pause only for a true **STOP AND ASK** (see [`NOTES/PROJECT_SEED.md`](NOTES/PROJECT_SEED.md) §5.2): you are **genuinely blocked** after exhausting repo context, tools, and `docs/KEY_LEARNINGS.md`, and **need the owner’s judgment** (irreversible tradeoff, unclear spec, missing credential/data). In **~90% of cases** you should **not** need advisor input — solve it.

4. **Completion:** Continue until **all active epics** are **complete** per their orchestration and specs (or explicitly moved to a terminal state there). When everything in scope is **closed**, **then** summarize for the owner what was done and how to verify — do not declare “done” with open epic items.

5. **Lean proofs:** Follow [**Proof quality (Lean)**](CODING_PROTOCOLS.md#proof-quality-lean) in [`CODING_PROTOCOLS.md`](CODING_PROTOCOLS.md). Prefer **no `sorry`**, **minimal axioms**, **strong general statements**, and **honest** documentation of any deviation.

6. **Lean audit (always):** Whenever you touch Lean, **actively audit** the surrounding proof mass for **`sorry` / proof gaps**, **undocumented or unnecessary `axiom`s**, **vacuous or nearly vacuous statements** (hypotheses that trivialize the goal), **weak lemmas that should be strengthened** for reuse or science honesty, and **definition smuggling** (definitions that bake in the theorem they are meant to support). Fix or **register** findings in the artifact manifest / epic / spec in the same work pass when you cannot close them immediately.

7. **Python / Node / other code:** Follow [**Code quality (Python, Node, and imperative stacks)**](CODING_PROTOCOLS.md#code-quality-python-node-and-imperative-stacks) in [`CODING_PROTOCOLS.md`](CODING_PROTOCOLS.md). No error-masking, root-cause fixes, tests for behavior you add or change, and types/linters as the project adopts them.

8. **External-facing names and comments:** Identifiers must be **role-based** and meaningful to **external** readers. Comments are short and **helpful to a stranger** — **no self-talk / meta-talk**. **Never** name or allude to the **advisor**, **user**, **owner**, **PI**, or **any person** in code, names, or comments ([`CODING_PROTOCOLS.md`](CODING_PROTOCOLS.md) — *External-facing identifiers and comments*).

9. **Lean layout:** This repository **is** the **novelty-theory-lean** library root — **commit Lean work here**. A separate prose/orchestration repo should normally embed this library as a **`git submodule`** ([`NOTES/PROJECT_SEED.md`](NOTES/PROJECT_SEED.md) §7.3).

10. **LaTeX papers:** Every paper gets a proper **References** section; use **`.bib`** when asked or when the repo already does. For Lean-backed papers, **append theorem inventory + dependency map** when practical. **Never** point readers at internal **`docs/`**, **`specs/`**, **`QUEUE.md`**, or similar — write the content **in the paper**; **never** cite internal specs/docs for narrative (**exception:** explicit public codebase doc URL). **Prologue:** match **`Representational_Incompleteness.tex`** — [`/Users/nova/representational-incompleteness/lean/paper/Representational_Incompleteness.tex`](/Users/nova/representational-incompleteness/lean/paper/Representational_Incompleteness.tex) ([`NOTES/PROJECT_SEED.md`](NOTES/PROJECT_SEED.md) §8).

---

## How this file relates to epics

| Level | Where | Purpose |
|-------|--------|---------|
| **This file** | repo root | Cross-epic ordering + **permanent** execution rules you see every time you open the queue. |
| **Epic orchestration** | `specs/.../EPIC_NNN_*/EPIC_*_MASTER_ORCHESTRATION.md` | Phase tables, epic-specific queue, acceptance links. |
| **Roll-up** | [`specs/MASTER_STATUS.md`](specs/MASTER_STATUS.md) | Which epics are active, deferred, or complete. |

**Rules:** Same add / reprioritize / remove / status discipline as [`NOTES/PROJECT_SEED.md`](NOTES/PROJECT_SEED.md) §5.2. When this queue and an epic queue disagree, **reconcile** them in the same edit pass (usually: epic is authoritative for domain tasks; this file for cross-epic “next across the program”).

---

## Cross-epic queue — next actions

| # | Outcome | Owner / epic | Spec / files | Status |
|---|---------|----------------|--------------|--------|
| 1 | Close **SPEC_001_ST1** (Lake manifest, `lake build`, docs) | `EPIC_001_NOVELTY_THEORY_LEAN` | `specs/INCOMPLETE/IN-PROCESS/EPIC_001_NOVELTY_THEORY_LEAN/` | Done |
| 2 | Research-grade follow-ons beyond current Lean: universal “adequate organization” quantifier, richer retro sentence universe (**`SPEC_003_NXT`**) | `EPIC_002_SELF_TRANSCENDING_GENERATORS` | `specs/INCOMPLETE/IN-PROCESS/EPIC_002_SELF_TRANSCENDING_GENERATORS/`, [`docs/THEOREM_INVENTORY.md`](docs/THEOREM_INVENTORY.md) | Open (A/B/C + B off-axis + summits + NXT S6–S10 templates; bundled `SignatureAdmissibleInterface`; see inventory *Not achievable* / *Still open*) |

_Add rows: each row must be executable without re-deriving context. Mark **Done**, **Blocked** (unblocker in Notes), or **Dropped** (reason)._

## Notes / blockers

_Free text for BLOCK state — what was tried, exact unblocker._

---

_Last template refresh: keep the **Agent execution contract** block in sync with [`CODING_PROTOCOLS.md`](CODING_PROTOCOLS.md) and [`NOTES/PROJECT_SEED.md`](NOTES/PROJECT_SEED.md) when policy changes._
