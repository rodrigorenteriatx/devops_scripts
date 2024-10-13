#!/usr/bin/env bash

echo -e "Top 5 IP addresses with the most requests\n"
cut -d ' ' -f 1 nginx-access.log | sort | uniq -c | sort -nr | head -5 | awk '{print $2" - "$1" requests"}'

echo -e "Top 5 most requested paths\n"
cut -d ' ' -f 7 nginx-access.log | sort | uniq -c | sort -nr | head -5 | awk '{print $2" - "$1" requests"}'

echo -e "Top 5 response status codes\n"
cut -d ' ' -f 9 nginx-access.log | grep '[0-9]' | sort | uniq -c | sort -nr | head -5 | awk '{print $2" - "$1" requests"}'

