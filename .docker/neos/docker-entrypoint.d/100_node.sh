#!/bin/sh

echo "Setup Node"

cd /data

pnpm config set node-linker hoisted
yes | pnpm install --prod

exit 0
