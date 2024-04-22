#!/usr/bin/env bash
cut -d ' ' -f 1 ./dane/access_log | grep -o  -E "\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}" ./dane/access_log |uniq|head -10
grep -o  -E "DELETE .+" ./dane/access_log | uniq