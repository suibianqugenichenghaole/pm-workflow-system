# PRD Final Self-Check — Rule Coverage Checklist

On-demand detail for `SKILL.md` §13. Load when running the final self-check before returning a PRD. The role-based check (frontend / backend / test) stays in `SKILL.md`; this file holds the full 15-item rule-coverage list.

Check rule coverage:

1. Field completeness: requiredness, type, constraint, default.
2. Operation branches: success, failure, boundary.
3. Batch operations: all-success, partial-failure, all-failure.
4. Boundary scenarios: empty, network-failure, extreme, invalid.
5. Display precision: truncation, tooltip, expansion, multi-value.
6. Scope boundary: `本期不处理` states real product exclusions.
7. Copy completeness: naming, copied/non-copied fields, initial status, list position.
8. Linkage described both ways.
9. Reference mode: realtime sync vs snapshot.
10. Hierarchy cascade: delete, hide, move, disable, copy.
11. Interaction form: move, sort, multi-select, search, wizard.
12. State lock: granularity, exceptions, reasons, disabled states.
13. Readonly reference: update timing, source modification/deletion, invalid states.
14. Priority rule: judgment order, fallback, field clear/retain.
15. Field organization: definition, linkage, validation, exceptions not scattered.

If any answer is no, revise before returning. Do not knowingly hand back scattered logic, missing modules, invented states, or vague rules.
