# Vireo Skill (`vireo-skill`)

Official Agent Skill for **Claude Code** and **Google Antigravity** to architect, author, and validate professional **Design as a Code (`.dac`)** files for [Vireo](https://dormiwww.github.io/Vireo/).

---

## 🌟 Overview

[Vireo](https://dormiwww.github.io/Vireo/) is a modern **Design as a Code (DaaC)** compiler that bridges design and engineering through a declarative, human-readable language (`.dac`).

This skill enables AI agents to act as expert DaaC architects:
- 🏗️ **Architect Design Systems**: Build scalable atomic design structures (`tokens.dac`, `components/*.dac`, `screens/*.dac`).
- 🔄 **Zero-Hardcoding Guarantee**: No outdated syntax or static templates. The skill instructs agents to dynamically fetch the latest syntax, component models, and CLI flags directly from live official documentation.
- 📐 **Auto Layout Best Practices**: Enforce fluid flexbox-like layouts, proper sizing (`fill`/`hug`), and semantic component inheritance using `ref:`.
- 🧪 **Compilation & Verification**: Run syntax checks and multi-target renders (`html`, `figma`, `json`) using the `vireo` CLI.

---

## ⚡ Zero-Hardcoding Directive

The Vireo syntax and component capabilities evolve continuously. To ensure high accuracy:
- The skill **does not bundle hardcoded grammar or component properties**.
- AI agents dynamically query the live docs at **[https://dormiwww.github.io/Vireo/](https://dormiwww.github.io/Vireo/)** (or read local `DOCS/` if in a Vireo repository) before authoring `.dac` files.

---

## 📦 Installation

### Option 1: Claude Code

#### Workspace-Level (Recommended for projects using Vireo)
Clone or copy this skill into your project's `.claude/skills/` directory:
```bash
mkdir -p .claude/skills/vireo
cp /path/to/vireo-skill/SKILL.md .claude/skills/vireo/SKILL.md
```

#### Global Installation
Install globally for all Claude Code sessions:
```bash
mkdir -p ~/.claude/skills/vireo
cp /path/to/vireo-skill/SKILL.md ~/.claude/skills/vireo/SKILL.md
```

---

### Option 2: Google Antigravity

#### Workspace-Level
Place the skill in `.agents/skills/` within your project root:
```bash
mkdir -p .agents/skills/vireo
cp /path/to/vireo-skill/SKILL.md .agents/skills/vireo/SKILL.md
```

#### Global Installation
Add the skill to your global Antigravity skills directory:
```bash
mkdir -p ~/.gemini/antigravity/skills/vireo
cp /path/to/vireo-skill/SKILL.md ~/.gemini/antigravity/skills/vireo/SKILL.md
```

---

## 🚀 How to Use

Once installed, invoke the skill directly in conversation or ask your AI assistant to generate or refactor Vireo designs:

```text
"Create a responsive pricing card component in Vireo (.dac)"
"Architect an auth screen with email/password inputs and social login buttons using .dac"
"Refactor my .dac design system to use centralized tokens and Auto Layout"
```

The agent will automatically:
1. Fetch the latest component properties and syntax from `https://dormiwww.github.io/Vireo/`.
2. Plan and architect the modular design system structure.
3. Generate clean, valid `.dac` code conforming strictly to current compiler specs.
4. Run `vireo check <file.dac>` and `vireo render` to verify the output.

---

## 📚 Documentation Links

| Resource | URL |
| :--- | :--- |
| **Live Docs Home** | [https://dormiwww.github.io/Vireo/](https://dormiwww.github.io/Vireo/) |
| **Getting Started** | [https://dormiwww.github.io/Vireo/getting-started](https://dormiwww.github.io/Vireo/getting-started) |
| **Concepts & Addressing** | [https://dormiwww.github.io/Vireo/concepts/addressing](https://dormiwww.github.io/Vireo/concepts/addressing) |
| **Component Properties** | [https://dormiwww.github.io/Vireo/components/properties](https://dormiwww.github.io/Vireo/components/properties) |
| **Layout & Constraints** | [https://dormiwww.github.io/Vireo/layout](https://dormiwww.github.io/Vireo/layout) |
| **CLI Reference** | [https://dormiwww.github.io/Vireo/cli](https://dormiwww.github.io/Vireo/cli) |

---

## 📄 License

MIT © [DorMiwww](https://github.com/DorMiwww)
