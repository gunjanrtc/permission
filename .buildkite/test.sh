#!/bin/bash

init() {
    pwd
    echo "starting build: $BUILDKITE_BUILD_NUMBER"
    echo "this is init"
    }

setup() {
    pwd 
    mkdir -p /pipeline_code_files
    cd /pipeline_code_files
    pwd
}

run() {
    echo "Running test cases..."
    # Add your test case execution steps here
    echo "Test cases execution completed."
    cd /pipeline_code_files
    pwd
}

clean() {
    echo "cleaning stage"
    rm /pipeline_code_files
}

if [ "$1" == "conditional_clean" ]; then
    if [ -d /tmp/pipeline_code_files ]; then
        clean
    else
        echo "Directory /tmp/pipeline_code_files does not exist. Skipping clean step."
    fi
elif [[ "$1" == "init"]]; then
    init
elif [[ "$1" == "setup"]]; then
    setup
elif [[ "$1" == "run"]]; then
    run
elif [[ "$1" == "clean"]]; then
    clean
fi