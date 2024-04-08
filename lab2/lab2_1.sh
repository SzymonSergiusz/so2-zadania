#!/usr/bin/env bash

TARGET_DIR=${1}

if [[ "${TARGET_DIR}" == "" ]]; then
    echo "Nie podano parametrów"
    exit 3
fi

FILES=$(ls "$TARGET_DIR")
if [ -d "${TARGET_DIR}" ]; then
    echo ""
    for FILE in ${FILES}; do
        # echo "${FILE##*.}"
        if [[ "${FILE##*.}" == "bak" ]]; then
            # echo "${FILE}"
            if [ -f "${TARGET_DIR}/$FILE" ]; then
                # echo "plik regularny $FILE"
                # zmienic prawa kazdemu aby nie mogl edytowac
                chmod a-w "${TARGET_DIR}/$FILE"
            else
                #TODO
                chmod  go=x "${TARGET_DIR}/$FILE"
                chmod  uo=r "${TARGET_DIR}/$FILE"
            fi
        elif [[ "${FILE##*.}" == "tmp" ]]; then
            # echo "${FILE}"
            chmod -R u=rwx "${TARGET_DIR}/$FILE"
            chmod -R go=rx "${TARGET_DIR}/$FILE"
        elif [[ "${FILE##*.}" == "txt" ]]; then
            # echo "${FILE}"
            chmod u=w,g=r,o=x "${TARGET_DIR}/$FILE"
            # chmod -R go=rx "${TARGET_DIR}/$FILE"
            
        fi
    done


else
    echo "podany katalog nie istnieje"
    exit 4
fi
