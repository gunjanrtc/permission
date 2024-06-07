#!/bin/bash

init() {
    pwd
    echo "starting build: $BUILDKITE_BUILD_NUMBER"
    echo "this is init"
    }

setup() {
    pwd 
    mkdir -p pipeline_code_files
    cd pipeline_code_files
    pwd
}

run() {
    pwd
    echo "Running test cases..."
    # Add your test case execution steps here
    echo "Test cases execution completed."
    cd pipeline_code_files
    pwd
}

clean() {
    pwd
    echo "cleaning stage"
    rm  pipeline_code_files
    pwd
}

conditional_clean() {
    pwd
    if [ -d /pipeline_code_files ]; then
        echo "folder pipeline_code_files exists"
    else
        echo "Directory /pipeline_code_files does not exist. Skipping clean step."
    fi
}

if [[ "$1" == "conditional_clean" ]]; then
    conditional_clean
elif [[ "$1" == "init" ]]; then
    init
elif [[ "$1" == "setup" ]]; then
    setup
elif [[ "$1" == "run" ]]; then
    run
elif [[ "$1" == "clean" ]]; then
    clean
fi