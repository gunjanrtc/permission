#!/bin/bash

# Directory to check for changes
DIRECTORY_TO_CHECK="terraform/aws/"

# Check for changes in the specified directory
if git diff --name-only "$BUILDKITE_COMMIT" "$BUILDKITE_PREVIOUS_COMMIT" -- "$DIRECTORY_TO_CHECK" | grep -q "$DIRECTORY_TO_CHECK"; then
  echo "Changes detected in $DIRECTORY_TO_CHECK"
  export RUN_AWS_STEP=true
  exit 0
else
  echo "No changes detected in $DIRECTORY_TO_CHECK"
  export RUN_AWS_STEP=false
  exit 1
fi
