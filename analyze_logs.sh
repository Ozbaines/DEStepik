#!/bin/bash

LOG_FILE="access.log"
REPORT_FILE="report.txt"

TOTAL_REQUESTS=$(wc -l < "$LOG_FILE")
UNIQUE_IPS=$(awk '{print $1}' "$LOG_FILE" | sort | uniq | wc -l)
GET_REQUESTS=$(awk '/GET/ {count++} END {print count}' "$LOG_FILE")
POST_REQUESTS=$(awk '/POST/ {count++} END {print count}' "$LOG_FILE")
POPULAR_URL=$(awk '{print $7}' "$LOG_FILE" | sort | uniq -c | sort -nr | head -n 1 | awk '{print $2}')

{
  echo "Отчет о логе веб-сервера:"
  echo "----------------"
  echo "Общее количество запросов: $TOTAL_REQUESTS"
  echo "Количество уникальных IP-адресов: $UNIQUE_IPS"
  echo "Количество запросов по методам: GET: $GET_REQUESTS POST: $POST_REQUESTS"
  echo "Самый популярный URL: $POPULAR_URL"
} > "$REPORT_FILE"

