#!/usr/bin/env bash

while IFS=, read -r ID FIRSTNAME SURNAME EMAIL GENDER IP WORTH; do
    if [[ $((ID % 2)) -eq 1 ]]; then
        echo "${ID} ${FIRSTNAME} ${SURNAME} ${EMAIL}" 2>&1
    fi

done < dane/yolo.csv

while IFS=, read -r ID FIRSTNAME SURNAME EMAIL GENDER IP WORTH; do

    if [[ ${WORTH} =~ \$(2\.99|5\.99|9\.99)(M|B) ]]; then
        echo "${SURNAME} ${WORTH}" 2>&1
    fi
done < dane/yolo.csv