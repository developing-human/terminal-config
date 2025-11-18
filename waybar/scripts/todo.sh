#!/bin/bash
COUNT=$(cat ~/todo.txt | grep "^-" | wc -l)
TODOS=$(cat ~/todo.txt | grep "^\s*-" | head -c -1 - | sed -z 's/\n/\\n/g')
printf '{"text": "%s", "tooltip": "%s"}\n' "$COUNT" "$TODOS"
