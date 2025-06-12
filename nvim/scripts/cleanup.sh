#!/bin/bash

GREEN='\033[0;32m'
CLEAR='\033[0m'

rm -rf ~/.local/share/nvim && echo -e "${GREEN}~/.local/share/nvim has been cleared successfully.${CLEAR}"
rm -rf ~/.local/state/nvim && echo -e "${GREEN}~/.local/state/nvim has been cleared successfully.${CLEAR}"
rm -rf ~/.cache/nvim && echo -e "${GREEN}~/.cache/nvim has been cleared successfully.${CLEAR}"
