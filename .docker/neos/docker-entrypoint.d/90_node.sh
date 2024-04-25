#!/bin/sh

cd /data

yes | corepack enable
pnpm install --prod --no-color
