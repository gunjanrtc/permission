#!/bin/bash

init() {
    pwd
    echo "this is init"
    ls
    }

setup() {
    pwd 
    echo "create dir"
    mkdir -p pipeline_code_files
    echo "list all"
    ls
    echo "cd to dir"
    cd pipeline_code_files
    echo "pwd - "
    pwd
}

run() {
    pwd
    echo "Running test cases..."
    # Add your test case execution steps here
    echo "Test cases execution completed."
    ls
    echo "cd to dir"
    cd /pipeline_code_files
    pwd
}

clean() {
    pwd
    echo "cleaning stage"
    ls
    rm  -r pipeline_code_files
    pwd
}

conditional_clean() {
    pwd
    if [ -d pipeline_code_files ]; then
        echo "folder pipeline_code_files exists"
        ls
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