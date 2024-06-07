#!/bin/bash

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

if [[ "$1" == "setup" ]]; then
    setup
fi