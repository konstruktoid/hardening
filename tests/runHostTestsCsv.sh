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

# Run bats tests and capture output
sudo bats . | tee "./${LOG_FILE}" >/dev/null

# Start creating CSV file
echo "Test Name,Result" > "${CSV_FILE}"
  
# Process log file for failed tests and add them to the CSV
while IFS= read -r line; do
  if [[ "$line" == not\ ok* ]]; then
    # Extract test name using parameter expansion and add to CSV as failed
    testName="${line#not ok }"
    echo "\"$testName\",Failed" >> "${CSV_FILE}"
    ((FAILED_TESTS++))
  fi
done < "${LOG_FILE}"

{
  # Add summary to the end of the CSV
  SCORE=$((100-(100*FAILED_TESTS/TESTS)))
  echo "Total Tests,$TESTS"
  echo "Failed Tests,$FAILED_TESTS"
  echo "Score,$SCORE%"
} >> "${CSV_FILE}"

# Optional: convert to Unix format if needed
if command -v dos2unix >/dev/null; then
  dos2unix "${CSV_FILE}"
fi

# Cleanup log file
rm "${LOG_FILE}"
