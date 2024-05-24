#!/bin/sh

echo "Setup Flow"

cd /data

if [[ -f ./flow ]]; then
  php flow flow:cache:flush
  php flow flow:package:rescan
  until php flow doctrine:compileproxies; do sleep 1; done
  php flow doctrine:migrate
  php flow resource:publish --collection static
  php flow resource:publish --collection persistent
  php flow startup:init
fi

exit 0
