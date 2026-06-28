# OpenCode Skills

A collection of reusable [OpenCode](https://opencode.ai) agent skills.

Skills are markdown files with YAML frontmatter that provide domain-specific instructions to OpenCode agents. They're loaded on-demand via the built-in `skill` tool — agents see what's available and pull the full instructions when needed.

## Prerequisites

- [OpenCode](https://opencode.ai) installed (`brew install anomalyco/tap/opencode`, `npm i -g opencode-ai`, or via the install script)
- OpenCode initialized in a project (`/init` in the TUI) — recommended but not required

## Quick Start

### Clone the repo

```bash
git clone https://github.com/aadish0day/opencode-skills.git
cd opencode-skills
```

### Install globally with setup script (recommended)

```bash
./setup.sh
```

Or manually with GNU Stow:

```bash
stow -t ~ .
```

For a custom target directory:

```bash
./setup.sh /path/to/home
```

This symlinks `.config/opencode/` into your home directory. Skills and commands stay in the repo — any `git pull` updates them automatically.

### Install per-project (manual copy)

```bash
cp -r .opencode/skills /path/to/your/project/.opencode/
```

### Verify it's working

1. Start OpenCode in any project: `opencode`
2. Look for the skill in the available tools section when you start a session
3. Type a prompt that matches the skill's purpose (e.g., "commit this") — the agent should automatically load and follow the skill's instructions

## Available Skills

### `git-workflow`

A comprehensive Git workflow assistant. Triggered automatically when you ask about commits, branches, pushing, rebasing, squashing, PRs, or merge conflicts.

**Covers:**
- **Commit messages** — Conventional Commits format (`feat`, `fix`, `refactor`, etc.), scopes, body writing, issue references
- **Branch naming** — Type-prefixed kebab-case (`feature/`, `fix/`, `refactor/`, `chore/`)
- **Pushing** — Always sets upstream with `git push --set-upstream origin <branch>` on first push
- **Rebase vs merge** — Decision tree based on whether the branch is shared
- **Squashing** — Interactive rebase with consolidated commit messages
- **PR descriptions** — Structured markdown: Summary, Changes, Testing, Notes
- **Conflict resolution** — Explains hunks, proposes resolutions, runs build/tests after

## How Skills Work in OpenCode

Skills are stored in `.opencode/skills/<skill-name>/SKILL.md`. OpenCode discovers them automatically from two locations:

| Location | Scope |
|---|---|
| `~/.config/opencode/skills/<name>/SKILL.md` | **Global** — all projects |
| `.opencode/skills/<name>/SKILL.md` | **Project** — that repo only |
| `.claude/skills/<name>/SKILL.md` | **Project** — Claude Code compatible |
| `.agents/skills/<name>/SKILL.md` | **Project** — generic agent compatible |

OpenCode walks up from the current directory to the git worktree root, loading skills from any of these paths along the way.

## Using a Skill with `/git-workflow` (Slash Command)

By default, the agent loads skills automatically via the built-in `skill` tool when your prompt matches the skill's description. If you want to invoke it explicitly with a slash command like `/git-workflow`:

If you used `./setup.sh` or `stow -t ~ .`, the command is already linked. Just restart OpenCode and type `/git-workflow`.

To create it manually:

```bash
mkdir -p ~/.config/opencode/commands
cat > ~/.config/opencode/commands/git-workflow.md << 'EOF'
---
description: Git workflow assistant — commits, branches, rebase/merge, PRs
---

Use the git-workflow skill to handle this task.
EOF
```

Restart OpenCode, then type `/git-workflow` — the agent will load the skill.

## Skill File Format

Each `SKILL.md` requires YAML frontmatter:

```markdown
---
name: git-workflow              # Required: kebab-case, 1-64 chars, matches directory name
description: |-                  # Required: 1-1024 chars, specific enough for agent to pick correctly
  General git workflow assistant covering commit message writing,
  branching strategy, rebasing vs merging, and PR/MR descriptions.
  Use whenever the user asks about commits, branches, pushing, rebasing,
  squashing, PRs, or merge conflicts.
license: MIT                     # Optional
compatibility: opencode          # Optional
metadata:                        # Optional: string-to-string map
  audience: developers
  workflow: git
---

# Skill Instructions

Content here — the agent reads this when the skill is loaded.
```

**Rules:**
- `name` must match the directory name
- `name` regex: `^[a-z0-9]+(-[a-z0-9]+)*$`
- `description` must be 1–1024 characters

## Permissions

Control which skills agents can access via `opencode.json`:

```json
{
  "permission": {
    "skill": {
      "*": "allow",
      "internal-*": "deny",
      "experimental-*": "ask"
    }
  }
}
```

Values: `allow` (loads immediately), `deny` (hidden from agent), `ask` (prompts user).

## Troubleshooting

**Skill not showing up:**
1. Verify the file is named `SKILL.md` (all caps)
2. Check frontmatter includes `name` and `description`
3. Ensure `name` matches the parent directory name
4. Check permissions — `deny` hides the skill
5. Skill names must be unique across all locations
6. Restart OpenCode after adding a new skill

## Creating a New Skill

1. Create a directory: `.config/opencode/skills/<skill-name>/`
2. Create `SKILL.md` inside it with YAML frontmatter
3. Write the instructions in markdown
4. Run `./setup.sh` or `stow -t ~ .`  to symlink it
5. Restart OpenCode or start a new session

The `.opencode/` directory in this repo is a symlink to `.config/opencode/` — both paths stay in sync.

Contributions welcome — open a PR!
