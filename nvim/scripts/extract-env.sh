#!/bin/bash

# Usage: ./extract_env.sh KEY_NAME [ENV_FILE_PATH]
# Example: ./extract_env.sh ANTHROPIC_KEY
# Example: ./extract_env.sh ANTHROPIC_KEY /path/to/.env

KEY_NAME="$1"
ENV_FILE="${2:-.env}"

# Check if key name is provided
if [ -z "$KEY_NAME" ]; then
    echo "Usage: $0 KEY_NAME [ENV_FILE_PATH]" >&2
    echo "Example: $0 ANTHROPIC_KEY" >&2
    exit 1
fi

# Check if .env file exists
if [ ! -f "$ENV_FILE" ]; then
    echo "Error: $ENV_FILE file not found" >&2
    exit 1
fi

# Extract the value for the given key (KEY=VALUE format only)
VALUE=$(grep "^${KEY_NAME}=" "$ENV_FILE" | head -n1 | cut -d'=' -f2-)

if [ -z "$VALUE" ]; then
    echo "Error: Key '$KEY_NAME' not found in $ENV_FILE" >&2
    exit 1
fi

echo "$VALUE"
