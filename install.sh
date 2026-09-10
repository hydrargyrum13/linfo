#!/usr/bin/env bash
set -e

SRC_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET_DIR="$HOME/.local/bin"
TARGET="$TARGET_DIR/linfo"

mkdir -p "$TARGET_DIR"
cp "$SRC_DIR/linfo" "$TARGET"
chmod +x "$TARGET"

echo
printf '\033[36mInstalling linfo...\033[0m\n'

case ":$PATH:" in
  *":$TARGET_DIR:"*) : ;;
  *)
    SHELL_NAME="$(basename "${SHELL:-bash}")"
    case "$SHELL_NAME" in
      zsh) RC="$HOME/.zshrc" ;;
      fish)
        mkdir -p "$HOME/.config/fish/conf.d"
        RC="$HOME/.config/fish/conf.d/linfo.fish"
        printf 'fish_add_path %s\n' "$TARGET_DIR" > "$RC"
        RC=""
        ;;
      *) RC="$HOME/.bashrc" ;;
    esac
    if [ -n "${RC:-}" ]; then
      touch "$RC"
      grep -Fq 'export PATH="$HOME/.local/bin:$PATH"' "$RC" || printf '\nexport PATH="$HOME/.local/bin:$PATH"\n' >> "$RC"
    fi
    ;;
esac

printf '\033[32mInstalled.\033[0m\n'
printf 'Run now with: %s\n' "$TARGET"
printf 'Or open a new terminal and run: linfo\n\n'
