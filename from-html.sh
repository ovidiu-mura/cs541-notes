#!/bin/sh
ROOT=`basename "$1" .html`
pandoc -t markdown-smart-all_symbols_escapable --atx-headers -s "$1" |
    sed 's/^## /# /' |
    sed '/^[A-Za-z]/s/^/## /' |
    sed '/ *-   /s/-   /* /' >"$ROOT".md
