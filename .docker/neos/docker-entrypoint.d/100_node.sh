#!/bin/sh

echo "Setup Node"

cd /data

yes | corepack enable
pnpm config set node-linker hoisted
yes | pnpm install --prod

exit 0
