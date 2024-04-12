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

        EXTENSION=${FILE##*.}
        FILE_NAME=$(basename "$FILE" ."$EXTENSION")
        FILE_NAME_UPPER=$(echo "$FILE_NAME" | tr '[:lower:]' '[:upper:]')

        ABS_PATH=${PWD}

        if [[ -f "${LIST_DIR}/${FILE}" ]]; then
            echo "${LIST_DIR}/${FILE} - plik regularny"
            ln -s "${FILE}" "${ABS_PATH}/${TARGET_DIR}/${FILE_NAME_UPPER}_ln.${EXTENSION}"

        elif [[ -d "${LIST_DIR}/${FILE}" ]]; then
            echo "${LIST_DIR}/${FILE} - katalog"
            ln -s "${FILE}" "${ABS_PATH}/${TARGET_DIR}/${FILE_NAME_UPPER}_ln"

        elif [[ -L "${LIST_DIR}/${FILE}" ]]; then
            echo "${LIST_DIR}/${FILE} - dowiązanie symboliczne"
        fi



    done


else
    echo "nie istnieją"
    exit 4
fi
