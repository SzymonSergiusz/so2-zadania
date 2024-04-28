#!/usr/bin/env bash

GROOVIES=$(ls dane/groovies)

for FILE in $GROOVIES; do
    sed -i '' 's/Help docs://g' dane/groovies/"${FILE}"
    sed -i '' 's/\$HEADER\$/\/temat\//g' dane/groovies/"${FILE}"
done
