#!/bin/bash

# Directory to check for changes
DIRECTORY_TO_CHECK="terraform/aws/"
CURRENT_COMMIT="${BUILDKITE_COMMIT:-HEAD}"

# Get the previous commit (default to HEAD~1 if not set)
PREVIOUS_COMMIT="${BUILDKITE_PREVIOUS_COMMIT:-HEAD~1}"

# Check for changes in the specified directory
if git diff --name-only "$PREVIOUS_COMMIT" "$CURRENT_COMMIT" -- "$DIRECTORY_TO_CHECK" | grep -q "$DIRECTORY_TO_CHECK"; then
  echo "Changes detected in $DIRECTORY_TO_CHECK"
  export RUN_AWS_STEP=true
  buildkite-agent meta-data set RUN_AWS_STEP "true"
  if [[ "$(uname)" =~ "Windows" ]]; then
    exit /b 0
  else
    exit 0
  fi
else
  echo "No changes detected in $DIRECTORY_TO_CHECK"
  export RUN_AWS_STEP=false
  buildkite-agent meta-data set RUN_AWS_STEP "false"
  echo $RUN_AWS_STEP
  if [[ "$(uname)" =~ "Windows" ]]; then
    exit /b 1
  else
    exit 1
  fi
fi
