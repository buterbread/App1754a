#!/usr/bin/env bash
echo "[before_build] Start"
b=$(stat -f "%Sm" -t "%Y%m%dT%H%M%S" www/js/index.js)
if [ -f timestamp_indexjs.txt ]; then
    a=$(cat timestamp_indexjs.txt)
    if [ $a == $b ]; then
        echo "- No change in index.js"
    else
        echo "- Calling Browserify (timestamp was changed)"
        echo $b>timestamp_indexjs.txt
        browserify -t vueify -e www/js/index.js -o www/build/build.js
    fi
else
    echo "- Calling Browserify (First run, no timestamp)"
    echo $b>timestamp_indexjs.txt
    browserify -t vueify -e www/js/index.js -o www/build/build.js
fi
echo "[before_build] End"
