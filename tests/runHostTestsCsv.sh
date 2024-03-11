#!/bin/bash

# Check if bats is installed
if ! command -v bats >/dev/null; then
  echo "bats isn't installed. Exiting."
  exit 1
fi

# Define variables
HOST="$(hostname -s)"
LOG_FILE="${HOST}-bats.log"
CSV_FILE="TESTRESULTS-${HOST}.csv"
TESTS=$(grep -Ro '@test' ./*.bats | wc -l)
FAILED_TESTS=0

# Run bats tests
sudo bats . | tee "./${LOG_FILE}" >/dev/null

# Start creating CSV
{
  echo "Test Name,Result" > "${CSV_FILE}"
  
  # Add each failed test to the CSV
  while IFS= read -r line; do
    if [[ "$line" == not\ ok* ]]; then
      echo "${line/not ok /},"Failed"" >> "${CSV_FILE}"
      ((FAILED_TESTS++))
    fi
  done < "${LOG_FILE}"

  # Add summary row to the CSV
  echo "Total Tests,${TESTS}" >> "${CSV_FILE}"
  echo "Failed Tests,${FAILED_TESTS}" >> "${CSV_FILE}"
  SCORE=$((100-(100*FAILED_TESTS/TESTS)))
  echo "Score,${SCORE}" >> "${CSV_FILE}"

} 

# Optional: convert to Unix format if needed
if command -v dos2unix >/dev/null; then
  dos2unix "${CSV_FILE}"
fi

# Clean up
rm "${LOG_FILE}"
