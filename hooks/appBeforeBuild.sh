#!/usr/bin/env bash
echo "[before_build] Start"
b=$(stat -f "%Sm" -t "%Y%m%dT%H%M%S" www/js/index.js)
if [ -f timestamp_indexjs.txt ]; then
    a=$(cat timestamp_indexjs.txt)
    if [ $a == $b ]; then
        echo "- No change in index.js"
    else
        echo "- Weback Build"
        echo $b>timestamp_indexjs.txt
        npm run build
    fi
else
    echo "- Weback Build"
    echo $b>timestamp_indexjs.txt
    npm run build
fi
echo "[before_build] End"
