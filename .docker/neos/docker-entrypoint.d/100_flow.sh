#!/bin/sh

cd /data

if [[ -f ./flow ]]; then
  php flow flow:cache:flush
  php flow flow:package:rescan
  php flow doctrine:migrate
  php flow resource:publish --collection static
  php flow resource:publish --collection persistent
  php flow startup:init
fi

exit 0
