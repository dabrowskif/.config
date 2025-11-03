#!/bin/bash

DEBUGGER_DIR="vscode-js-debug"
DEBUGGER_PATH="$HOME/.local/share/nvim/$DEBUGGER_DIR"
mkdir -p $DEBUGGER_PATH
git clone https://github.com/microsoft/vscode-js-debug
cd vscode-js-debug
npm install --legacy-peer-deps
npx gulp vsDebugServerBundle
mkdir $DEBUGGER_PATH/out
mv dist/* $DEBUGGER_PATH/out
cd ..
rm -rf vscode-js-debug
