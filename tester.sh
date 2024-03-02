#!/bin/bash

# Initialize counters for success and failure
success_count=0
failure_count=0

for i in {1..100}; do
  # Replace "your_command_here" with the actual command you want to run
  if (pnpm run generate); then
    # Increment success counter if the command exits with status 0 (success)
    ((success_count++))
  else
    # Increment failure counter if the command exits with a non-zero status (failure)
    ((failure_count++))
  fi
done

# Calculate the percentage of failures using awk for floating-point arithmetic
failure_percentage=$(awk "BEGIN {printf \"%.2f\", ${failure_count}/100*100}")

# Output the statistics
echo "Total successes: $success_count"
echo "Total failures: $failure_count"
echo "Failure percentage: $failure_percentage%"
