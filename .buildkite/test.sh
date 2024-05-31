#!/bin/bash

file_changed = $(git log -n 1 --oneline | grep terraform/aws/)
echo $file_changed
