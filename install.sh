#!/usr/bin/env bash
#
# Vireo Skill Installer
# Installs the Vireo (.dac) agent skill for Claude Code and Google Antigravity.
#
# Quick Install:
#   curl -fsSL https://raw.githubusercontent.com/DorMiwww/vireo-skill/main/install.sh | bash
#
# Usage:
#   bash install.sh [options]
#
# Options:
#   --global          Install globally for user account (default)
#   --local           Install locally into the current project/workspace
#   --claude          Install only for Claude Code
#   --antigravity     Install only for Google Antigravity
#   --all             Install for both Claude Code and Antigravity (default)
#   -h, --help        Show this help message
#

set -euo pipefail

# ANSI Colors
BOLD="\033[1m"
GREEN="\033[0;32m"
BLUE="\033[0;34m"
CYAN="\033[0;36m"
YELLOW="\033[0;33m"
RED="\033[0;31m"
RESET="\033[0m"

REPO_RAW_URL="https://raw.githubusercontent.com/DorMiwww/vireo-skill/main/SKILL.md"
SKILL_FILENAME="SKILL.md"

MODE="global"
TARGET_CLAUDE=true
TARGET_ANTIGRAVITY=true

print_banner() {
    echo -e "${CYAN}${BOLD}"
    echo "  ╔═════════════════════════════════════════════════════╗"
    echo "  ║             VIREO SKILL INSTALLER                   ║"
    echo "  ║      Graphic & Visual Design as Code (.dac)         ║"
    echo "  ╚═════════════════════════════════════════════════════╝"
    echo -e "${RESET}"
}

show_help() {
    print_banner
    echo -e "${BOLD}Usage:${RESET} install.sh [options]"
    echo ""
    echo -e "${BOLD}Options:${RESET}"
    echo "  --global           Install to user home directory (default)"
    echo "  --local, -l        Install into current workspace/repository"
    echo "  --claude           Install only for Claude Code"
    echo "  --antigravity      Install only for Google Antigravity"
    echo "  --all              Install for all supported AI agents (default)"
    echo "  -h, --help         Display this help message"
    echo ""
    echo -e "${BOLD}Examples:${RESET}"
    echo "  curl -fsSL https://raw.githubusercontent.com/DorMiwww/vireo-skill/main/install.sh | bash"
    echo "  curl -fsSL https://raw.githubusercontent.com/DorMiwww/vireo-skill/main/install.sh | bash -s -- --local"
    echo "  bash install.sh --global --claude"
    echo ""
    exit 0
}

# Parse arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        --global|-g)
            MODE="global"
            shift
            ;;
        --local|-l|--workspace|-w)
            MODE="local"
            shift
            ;;
        --claude)
            TARGET_CLAUDE=true
            TARGET_ANTIGRAVITY=false
            shift
            ;;
        --antigravity)
            TARGET_CLAUDE=false
            TARGET_ANTIGRAVITY=true
            shift
            ;;
        --all)
            TARGET_CLAUDE=true
            TARGET_ANTIGRAVITY=true
            shift
            ;;
        -h|--help)
            show_help
            ;;
        *)
            echo -e "${RED}Unknown option: $1${RESET}"
            echo "Run 'install.sh --help' for usage."
            exit 1
            ;;
    esac
done

print_banner

# Determine source of SKILL.md
TEMP_DIR=""
cleanup() {
    if [[ -n "$TEMP_DIR" && -d "$TEMP_DIR" ]]; then
        rm -rf "$TEMP_DIR"
    fi
}
trap cleanup EXIT

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd || echo "")"
SOURCE_SKILL=""

if [[ -n "$SCRIPT_DIR" && -f "$SCRIPT_DIR/$SKILL_FILENAME" ]]; then
    SOURCE_SKILL="$SCRIPT_DIR/$SKILL_FILENAME"
    echo -e "${BLUE}ℹ${RESET} Using local ${BOLD}$SKILL_FILENAME${RESET}"
else
    echo -e "${BLUE}ℹ${RESET} Fetching latest ${BOLD}SKILL.md${RESET} from GitHub..."
    TEMP_DIR="$(mktemp -d 2>/dev/null || mktemp -d -t 'vireo-skill')"
    SOURCE_SKILL="$TEMP_DIR/$SKILL_FILENAME"
    
    if command -v curl >/dev/null 2>&1; then
        curl -fsSL "$REPO_RAW_URL" -o "$SOURCE_SKILL"
    elif command -v wget >/dev/null 2>&1; then
        wget -qO "$SOURCE_SKILL" "$REPO_RAW_URL"
    else
        echo -e "${RED}Error: Neither curl nor wget is available.${RESET}"
        exit 1
    fi
fi

if [[ ! -s "$SOURCE_SKILL" ]]; then
    echo -e "${RED}Error: Failed to retrieve SKILL.md.${RESET}"
    exit 1
fi

DESTINATIONS=()

if [[ "$MODE" == "global" ]]; then
    echo -e "${BLUE}Mode:${RESET} ${BOLD}Global Installation${RESET} (User Home Directory)"
    if [[ "$TARGET_CLAUDE" == true ]]; then
        DESTINATIONS+=("$HOME/.claude/skills/vireo")
    fi
    if [[ "$TARGET_ANTIGRAVITY" == true ]]; then
        DESTINATIONS+=("$HOME/.gemini/antigravity/skills/vireo")
    fi
else
    CURRENT_DIR="$(pwd)"
    echo -e "${BLUE}Mode:${RESET} ${BOLD}Workspace Installation${RESET} ($CURRENT_DIR)"
    if [[ "$TARGET_CLAUDE" == true ]]; then
        DESTINATIONS+=("$CURRENT_DIR/.claude/skills/vireo")
    fi
    if [[ "$TARGET_ANTIGRAVITY" == true ]]; then
        DESTINATIONS+=("$CURRENT_DIR/.agents/skills/vireo")
    fi
fi

echo ""
INSTALLED_COUNT=0

for DEST in "${DESTINATIONS[@]}"; do
    mkdir -p "$DEST"
    cp "$SOURCE_SKILL" "$DEST/SKILL.md"
    echo -e "  ${GREEN}✓${RESET} Installed into: ${BOLD}$DEST/SKILL.md${RESET}"
    INSTALLED_COUNT=$((INSTALLED_COUNT + 1))
done

echo ""
if [[ $INSTALLED_COUNT -gt 0 ]]; then
    echo -e "${GREEN}${BOLD}🎉 Vireo skill installed successfully!${RESET}"
    echo ""
    echo -e "${BOLD}Triggers:${RESET}"
    echo "  The skill activates automatically when working with:"
    echo "  • Visual & Graphic Design as Code (.dac)"
    echo "  • Vireo component layouts, buttons, cards, forms, screens"
    echo "  • Design tokens (colors, typography, spacing, radii)"
    echo "  • Figma-to-code or code-to-Figma conversions"
    echo ""
    echo -e "${BOLD}Live Docs:${RESET} ${CYAN}https://dormiwww.github.io/Vireo/${RESET}"
    echo ""
else
    echo -e "${YELLOW}Warning: No destinations were selected.${RESET}"
fi
