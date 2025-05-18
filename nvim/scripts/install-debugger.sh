#!/bin/bash


NVIM_PATH="$HOME/.local/share/nvim/lazy/vscode-js-debug"
git clone https://github.com/microsoft/vscode-js-debug
cd vscode-js-debug
npm install --legacy-peer-deps
npx gulp vsDebugServerBundle
mv dist out
mv out "$NVIM_PATH"
cd ..
rm -rf vscode-js-debug
cd $NVIM_PATH
mkdir out
mv * out



               #
               # [dap-js] Error trying to launch JS debugger: ...nvim/lazy/nvim-dap-vscode-js/lua/dap-vscode-js/utils.lua:64: Debugger entrypoint file '/Users/filip.dabrowski/.local/share/nvim/lazy/vscode-js-debug/out/src/vsDebugServer.js' does not exist. Did it build properly?
