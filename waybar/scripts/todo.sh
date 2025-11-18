#!/bin/bash
# Processes a very simple todo list, where todos are lines
# that start with a hyphen. Indented subtasks aren't included
# in the count.

# Filter to lines that start with a hyphen.
COUNT=$(cat ~/todo.txt | grep "^-" | wc -l)

# The tooltip includes subtasks.
TODOS=$(cat ~/todo.txt | grep "^\s*-" | head -c -1 - | sed -z 's/\n/\\n/g')

printf '{"text": "%s", "tooltip": "%s"}\n' "$COUNT" "$TODOS"
