import NoveltyTheory.All

/-!
# Basic — compatibility shim

The default Lake root is [`NoveltyTheory.All`](NoveltyTheory/All.lean). This module re-exports it
for older links and smoke tests.
-/

theorem library_root_import_ok : True := trivial
