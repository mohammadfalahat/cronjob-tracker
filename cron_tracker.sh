#!/bin/bash

# Log paths
SUCCESS_LOG="/var/log/cron.success.log"
ERROR_LOG="/var/log/cron.error.log"

# Arguments
EXIT_CODE="$1"
CRON_ID="$2"
OUTPUT_MESSAGE=$(cat)
TIMESTAMP=$(date +"%b %d %H:%M:%S")

# Determine success or error based on exit code
if [ "$EXIT_CODE" -eq 0 ]; then
    # Log success
    echo -e "$TIMESTAMP [SUCCESS]:\n$OUTPUT_MESSAGE\nCRON[$CRON_ID] finished. Exit Code: $EXIT_CODE" >> "$SUCCESS_LOG"
else
    # Log error
    echo -e "$TIMESTAMP [ERROR]:\n$OUTPUT_MESSAGE\nCRON[$CRON_ID] finished. Exit Code: $EXIT_CODE" >> "$ERROR_LOG"
fi
