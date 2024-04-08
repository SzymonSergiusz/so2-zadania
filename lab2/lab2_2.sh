#!/usr/bin/env bash

LIST_DIR=${1}
TARGET_DIR=${2}

if [[ "${LIST_DIR}" == "" ]] || [[ "${TARGET_DIR}" == "" ]]; then
    echo "Nie podano parametrów"
    exit 2
fi


if [ -d "${LIST_DIR}" ] && [ -d "${TARGET_DIR}" ]; then
    echo ""
    FILES=$(ls "$LIST_DIR")

    for FILE in ${FILES}; do
        echo "$FILE"
        if [[ -f "${LIST_DIR}/{$FILE}" ]]; then
            echo ""
        fi
    done
else
    echo "nie istnieją"
    exit 4
fi
