#!/bin/bash

pwd
CHANGED_FILES=$(git diff origin/main...HEAD --name-only | grep 'terraform/aws/')
  if [[ -z "$CHANGED_FILES" ]]; then
    echo "Changes detected in AWS directory."
    export RUN_AWS_STEP=true
  else
    echo "No changes detected in AWS directory."
    unset RUN_AWS_STEP
  fi
  echo "all variables"
  echo $RUN_AWS_STEP
