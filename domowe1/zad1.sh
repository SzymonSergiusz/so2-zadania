#!/usr/bin/env bash

SOURCE_DIR=${1:-lab_uno}
RM_LIST=${2:-2remove}
TARGET_DIR=${3:-bakap}

if [[ -d ${TARGET_DIR} ]]; then
    echo ""
else
    echo ""
    mkdir "$TARGET_DIR"
fi

for ITEM in ${RM_LIST}; do
    if [[ -x ${SOURCE_DIR}/${ITEM} ]]; then
        rm -rf "${SOURCE_DIR/$ITEM/}"
    fi
done

REMNANTS=$(ls "${SOURCE_DIR}")

for FILE in ${REMNANTS}; do
    if [[ -f ${SOURCE_DIR}/${FILE} ]]; then
    mv "${SOURCE_DIR}/${FILE}" "${TARGET_DIR}/${FILE}"
else
    cp -r "${SOURCE_DIR}/${FILE}" "${TARGET_DIR}/${FILE}"
fi
done

COUNT_FILES=$(find "${SOURCE_DIR}" -type f | wc -l)
echo "${COUNT_FILES}"
if [[ ${COUNT_FILES} -gt 0 ]]; then
    echo "Jeszcze coś zostało"

    if [[ ${COUNT_FILES} -ge 2 ]]; then
        echo "zostały co najmniej 2 pliki"
    fi
    if [[ ${COUNT_FILES} -gt 4 ]]; then
        echo "zostało więcej niż 4 pliki"
    elif [[ ${COUNT_FILES} -le 4 && ${COUNT_FILES} -ge 2 ]]; then
        echo "też coś zostało"
    fi
else
    echo "tu był Kononowicz"
fi

zip -r "bakap_$(date -I)" "${TARGET_DIR}"
