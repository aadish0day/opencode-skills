---
name: ui-ux-master
description: Comprehensive UI/UX design and layout toolkit for web interfaces. Use when designing or building web UIs, creating design systems and tokens, making layout/typography/color decisions, adding animations and microinteractions, implementing responsive behavior, designing component states and empty/error states, or reviewing UI code for accessibility, performance, and polish. Covers design systems, distinctive visual design, responsive layout, interaction/motion design, interface polish, and a full accessibility/quality checklist.
---

# UI/UX Master

A router skill. **Keep this file lean — read only the reference files a given task needs.** Do not load everything at once.

The skill combines six areas plus targeted gap-fillers. Each area has detailed references under `references/`.

## How to use this skill

1. Identify the task type from the decision table below.
2. Read only the listed reference file(s).
3. Follow the recommended workflow when doing an end-to-end build.
4. Run the self-audit rubric before declaring the work done.

## Decision table — task → reference

| If the task is… | Read |
| --- | --- |
| Create/maintain a design system, generate tokens | run `references/design_token_generator.py`; then `references/tokens-to-code.md` |
| Wire tokens into CSS vars / Tailwind v4 / TS | `references/tokens-to-code.md` |
| Choose aesthetic direction, typography, avoid generic looks | **§ Distinctive Design** below (self-contained) |
| Responsive layout, breakpoints, fluid type, container queries | `references/details.md`, `references/breakpoint-strategies.md`, `references/container-queries.md`, `references/fluid-layouts.md` |
| Animations, microinteractions, transitions, loading states | `references/microinteraction-patterns.md`, `references/scroll-animations.md`, `references/animation-libraries.md` |
| UI polish: radii, shadows, optical alignment, enter/exit anims | `references/polish-surfaces.md`, `references/polish-animations.md`, `references/polish-typography.md`, `references/polish-performance.md` |
| Define component states (hover/focus/disabled/loading/error) | `references/component-states.md` |
| Empty / error / loading / edge states | `references/empty-error-states.md` |
| Deep accessibility work or audit | `references/accessibility-testing.md`, `references/web-interface-guidelines.md` |
| Final quality/performance review | `references/web-interface-guidelines.md` + Self-Audit Rubric below |

## When NOT to over-apply (gating)

- **Static, content-only pages**: skip interaction/animation references. Motion here reads as AI-generated noise.
- **Prototypes / throwaway demos**: skip the full a11y audit and token pipeline; keep only focus rings + semantics.
- **Existing design system present**: do NOT generate new tokens — consume the existing ones. Only add tokens, never fork the scale.
- **Small single-component edit**: read just the polish + component-states refs, not the whole workflow.
- **`prefers-reduced-motion` users**: reduce/disable motion regardless of what the interaction refs suggest.

## Recommended end-to-end workflow

1. **System first** — tokens (color, type scale, spacing), responsive rules, a11y baseline. → `tokens-to-code.md`
2. **Aesthetic direction** — deliberate, non-templated choices. → § Distinctive Design
3. **Responsive layout** — mobile-first, fluid type, grid, container queries. → responsive refs
4. **Component states** — enumerate every state before styling. → `component-states.md`
5. **Interactions** — purposeful motion and feedback. → interaction refs
6. **Edge states** — loading/empty/error/offline. → `empty-error-states.md`
7. **Polish** — concentric radii, optical alignment, shadows, tabular numbers. → polish refs
8. **Audit** — accessibility + performance + rubric. → `accessibility-testing.md`, `web-interface-guidelines.md`

---

## § Distinctive Design (self-contained)

Approach as the design lead at a studio known for identities that can't be mistaken for anyone else's. Make deliberate, opinionated choices about palette, typography, and layout specific to the brief; take one real aesthetic risk you can justify.

- **Ground it in the subject.** If the brief doesn't pin down the product, pin it yourself: subject, audience, the page's single job. Distinctive choices come from the subject's own materials, artifacts, and vernacular.
- **Hero is a thesis.** Open with the most characteristic thing. Avoid the template answer (big number + label + gradient) unless truly best.
- **Typography carries personality.** Pair display and body faces deliberately; set an intentional type scale.
- **Structure is information.** Numbering/eyebrows/dividers must encode something true. Only use `01/02/03` if content is genuinely a sequence.
- **Motion deliberately.** One orchestrated moment beats scattered effects; often less is more.
- **Match complexity to vision.** Maximalist needs elaborate execution; minimal needs precision.

**Anti-generic calibration.** AI design clusters around: (1) cream #F4F1EA + serif + terracotta; (2) near-black + one acid accent; (3) broadsheet hairline rules, zero radius, dense columns. Legitimate for some briefs but defaults, not choices. Follow the brief where it pins a direction; where an axis is free, don't spend it on a default.

**Process:** brainstorm a compact token plan (Color: 4–6 named hex; Type: 2+ roles; Layout: concept + ASCII wireframes; Signature: the one memorable element) → critique it against the brief and revise anything generic → build deriving every decision from the plan. Watch CSS selector specificity (type vs element selectors cancelling paddings). Spend boldness in one place; keep everything else quiet.

**Writing:** words make a design easier to use. Write from the user's side ("manage notifications", not "webhook config"), active voice ("Save changes", not "Submit"), consistent action names through a flow, errors/empty states as direction not mood, conversational register in sentence case.

---

## Self-Audit Rubric

Score each dimension 0–2 (0 = missing, 1 = partial, 2 = solid). **Do not ship below 1 on any row; target ≥ total 16/20.**

| # | Dimension | 0 | 1 | 2 |
| --- | --- | --- | --- | --- |
| 1 | **Tokens** | Hard-coded hex/px | Some tokens | Everything derives from tokens |
| 2 | **Typographic hierarchy** | Flat/inconsistent | Basic scale | Deliberate scale, balanced wrapping |
| 3 | **Distinctiveness** | Generic default look | Some intent | Clear signature, non-templated |
| 4 | **Responsive** | Breaks on mobile/wide | Works, minor issues | Fluid, tested mobile→ultra-wide |
| 5 | **Component states** | Only default | Most states | All applicable states incl. focus-visible |
| 6 | **Edge states** | None | Some | Loading/empty/error/offline all designed |
| 7 | **Motion** | None or janky | Present | Purposeful, interruptible, reduced-motion honored |
| 8 | **Polish** | Mismatched radii/borders | Some | Concentric radii, shadows, optical alignment |
| 9 | **Accessibility** | Fails basics | Keyboard+labels | APCA contrast, SR pass, semantics-first |
| 10 | **Performance** | CLS/jank | Acceptable | No CLS, virtualized lists, compositor-only anims |

If any row scores 0, go back to the matching reference file before finishing.

---

## Reference index

- `references/design_token_generator.py` — generate tokens from a brand color (`python … "#3B82F6" modern css`)
- `references/tokens-to-code.md` — wire tokens into CSS vars, Tailwind v4, TypeScript, dark mode
- `references/details.md`, `references/breakpoint-strategies.md`, `references/container-queries.md`, `references/fluid-layouts.md` — responsive patterns
- `references/microinteraction-patterns.md`, `references/scroll-animations.md`, `references/animation-libraries.md` — interaction patterns
- `references/polish-typography.md`, `references/polish-surfaces.md`, `references/polish-animations.md`, `references/polish-performance.md` — UI polish details
- `references/component-states.md` — full component state matrix
- `references/empty-error-states.md` — loading/empty/error/edge states
- `references/accessibility-testing.md` — APCA, screen-reader flows, keyboard matrix, tooling
- `references/web-interface-guidelines.md` — full MUST/SHOULD/NEVER quality checklist
