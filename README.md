# OpenCode Skills

A collection of reusable [OpenCode](https://opencode.ai) skills.

## Available Skills

- **`git-workflow`** — Conventional commits, branch naming, rebase vs merge, squashing, PR descriptions, and conflict resolution.

## Usage

### Option 1: Global (available in all projects)

```bash
cp -r .opencode/skills ~/.config/opencode/
```

Restart OpenCode — skills are available automatically.

### Option 2: Per-project

Copy `.opencode/skills/` into your project's root:

```bash
cp -r .opencode/skills /path/to/your/project/.opencode/
```

## Adding a Skill

Create `.opencode/skills/<skill-name>/SKILL.md` with YAML frontmatter:

```markdown
---
name: my-skill
description: What this skill does and when to use it
---

# Instructions

Content here...
```
