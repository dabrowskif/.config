#!/bin/bash


NVIM_PATH="$HOME/.local/share/nvim/lazy/vscode-js-debug"
git clone https://github.com/microsoft/vscode-js-debug
cd vscode-js-debug
npm install --legacy-peer-deps
npx gulp vsDebugServerBundle
mkdir $NVIM_PATH/out
mv dist/* $NVIM_PATH/out
cd ..
rm -rf vscode-js-debug


