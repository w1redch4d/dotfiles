#!/usr/bin/env bash

set -e

DIR="$HOME/.config"

echo "Checking if config directory exists..."

if [[ -d "$DIR" ]]; then
    echo "Backing up existing config directory..."
    mv "$DIR" "$DIR.bak"
fi

echo "Installing new config directory..."
mv config "$DIR"

if ! command -v nvim >/dev/null 2>&1; then
    echo "nvim not found, removing nvim config..."
    rm -rf "$DIR/nvim"
fi

if ! command -v fastfetch >/dev/null 2>&1; then
    echo "fastfetch not found, removing fastfetch config..."
    rm -rf "$DIR/fastfetch"
fi

echo "Installing local directory..."

if [[ -d "$HOME/.local" ]]; then
    mv "$HOME/.local" "$HOME/.local.bak"
fi

mv local "$HOME/.local"

echo "Done."
