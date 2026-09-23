# Vireo Skill (`vireo-skill`)

Official Agent Skill for **Claude Code** and **Google Antigravity** to architect, author, and validate professional **Design as a Code (`.dac`)** files for [Vireo](https://dormiwww.github.io/Vireo/).

---

## ⚡ Quick Install (One-Liner)

Install globally on your machine for both **Claude Code** and **Google Antigravity** with a single command:

```bash
curl -fsSL https://raw.githubusercontent.com/DorMiwww/vireo-skill/main/install.sh | bash
```

### Install Options

```bash
# Install locally into the current repository/workspace
curl -fsSL https://raw.githubusercontent.com/DorMiwww/vireo-skill/main/install.sh | bash -s -- --local

# Install only for Claude Code
curl -fsSL https://raw.githubusercontent.com/DorMiwww/vireo-skill/main/install.sh | bash -s -- --claude

# Install only for Google Antigravity
curl -fsSL https://raw.githubusercontent.com/DorMiwww/vireo-skill/main/install.sh | bash -s -- --antigravity
```

If you cloned this repository locally, you can also run:
```bash
./install.sh
# or
./install.sh --local
```

---

## 🌟 What This Skill Does

[Vireo](https://dormiwww.github.io/Vireo/) is a modern **Design as a Code (DaaC)** compiler that bridges design and engineering through a declarative, human-readable language (`.dac`).

This skill enables AI agents to act as expert DaaC visual architects:
- 🎨 **Visual & Graphic Design as Code**: Creates UI layouts, components, cards, buttons, badges, navigation bars, and responsive screen mockups.
- 📐 **Auto Layout Discipline**: Enforces fluid flexbox-like layouts, proper sizing (`fill`/`hug`), and semantic component inheritance using `ref:`.
- 🏗️ **Architect Design Systems**: Builds scalable atomic design structures (`tokens.dac`, `components/*.dac`, `screens/*.dac`).
- 🔄 **Zero-Hardcoding Guarantee**: Never relies on outdated training memory or static syntax. The agent dynamically fetches the latest syntax, component models, and CLI flags directly from live official documentation at [https://dormiwww.github.io/Vireo/](https://dormiwww.github.io/Vireo/).
- 🧪 **Compilation & Verification**: Runs syntax checks and multi-target renders (`html`, `figma`, `json`) using the `vireo` CLI.

---

## 🎯 When the Skill Triggers

AI agents automatically activate this skill when:
- Working with **`.dac`** files or the **`vireo`** CLI.
- The user requests **"Design as a Code"** or **"дизайн як код"** for graphic, visual, or UI interfaces.
- Designing visual UI components (buttons, input fields, badges, cards, navigation, headers, footers).
- Building screen mockups, dashboard layouts, mobile/web interfaces in code.
- Managing design tokens (color palettes, typography scales, spacing, border radii).
- Exporting or rendering design code to HTML previews (`vireo render -o html`) or Figma canvases (`vireo render -o figma`).

> [!NOTE]
> **Domain boundary:** This skill is strictly for **visual and graphic UI design as code**. It does NOT trigger for backend software system architecture, database design, or distributed systems.

---

## ⚡ Zero-Hardcoding Directive

The Vireo syntax and component capabilities evolve continuously. To guarantee 100% accuracy:
- The skill **does not bundle hardcoded grammar or component properties**.
- AI agents dynamically query the live docs at **[https://dormiwww.github.io/Vireo/](https://dormiwww.github.io/Vireo/)** (or read local `DOCS/` if working in a Vireo repository) before authoring `.dac` files.

---

## 📦 Manual Installation Paths

If you prefer installing without the shell script:

### Claude Code
- **Global:** Copy `SKILL.md` to `~/.claude/skills/vireo/SKILL.md`
- **Workspace:** Copy `SKILL.md` to `.claude/skills/vireo/SKILL.md`

### Google Antigravity
- **Global:** Copy `SKILL.md` to `~/.gemini/antigravity/skills/vireo/SKILL.md`
- **Workspace:** Copy `SKILL.md` to `.agents/skills/vireo/SKILL.md`

---

## 🚀 Example Usage

Once installed, simply ask your AI assistant:

```text
"Create a responsive pricing card component in Vireo (.dac)"
"Architect an auth screen with email/password inputs and social login buttons using .dac"
"Зроби дизайн як код для головного екрану мобільного додатку в .dac"
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
