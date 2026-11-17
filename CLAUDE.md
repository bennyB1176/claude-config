# Engineering principles (all projects)

Based on "All Code Is Slop (Except Mine)" (Lauren Tan). Goal: ship fast without lowering quality, by making the
codebase and its checks trustworthy instead of relying on review.

## Where effort goes (cheapest and most reliable first)
1. Codebase: clear APIs, architecture and refactoring that make the wrong thing hard to write.
2. Static analysis: lint rules, types, compiler, tests, CI.
3. Verification: run the real thing and prove it works (runtime first; property-based or formal where it pays).
4. Prose: rules, skills, CLAUDE.md. Only for what needs judgment.
5. Human review: last and smallest.

## Rules
- Every correction from me becomes a deterministic check (lint rule, type, test) or is eliminated by better API
  design. Propose the check with the fix; build it once I agree, in the same change. Do not answer a correction
  with a new line of prose in CLAUDE.md, rules or comments.
- Fix root causes. No quick fixes that patch over a design problem (timers, retries, sleeps, flags, try/catch that
  swallows, special cases). If the real fix is larger, say so and ask; do not ship the workaround silently.
- The codebase is copied by the next agent. Never add a pattern you would not want repeated. When you touch
  code with an anti-pattern, fix it or say it should be fixed; prefer a lint rule that stops new occurrences.
- Comments: none, except a short "why" for something the code cannot express. Never use a comment to justify a
  workaround, describe what the code does, or leave notes for the next agent. Tool directives are fine.
- No unsolicited markdown: no new docs, notes, READMEs or rule files unless I ask. Do not turn a one-off
  correction into a permanent rule on your own.
- APIs that need nuance to use correctly lead to bugs. Prefer designs where the easy way is the right way; wrap
  or ban the nuanced API (e.g. raw useEffect in product code) and enforce it with a lint rule.
- Directory structure is context: one folder per feature, clear boundaries, import bans enforced by lint.
- Verification is the most important step. Before calling work done, run it: tests, type check, lint, build, and
  the real app (pages, CLI, API) with evidence such as screenshots, logs or command output. Spend more effort
  verifying than writing. Report what was verified and what was not.
- Reuse the project's verification tooling (feature map, verify scripts) instead of improvising each time; if
  there is none and the project runs something, propose building it.
- Do not automate a bad loop: improve code, checks and verification before adding automation.
