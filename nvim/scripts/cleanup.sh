#!/bin/bash

# Colors for ASCII
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Cleanup nvim cache
rm -rf ~/.local/share/nvim && echo -e "${GREEN}~/.local/share/nvim has been cleared successfully.${NC}"
rm -rf ~/.local/state/nvim && echo -e "${GREEN}~/.local/state/nvim has been cleared successfully.${NC}"
rm -rf ~/.cache/nvim && echo -e "${GREEN}~/.cache/nvim has been cleared successfully.${NC}"
