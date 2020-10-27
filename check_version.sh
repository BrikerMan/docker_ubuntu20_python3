#!/usr/bin/env bash

set -e

# This is being run as root and so sudo is not needed

function check_version() {
    echo $1
    if [[ $1 =~ ^[0-9]\.[0-9]$ ]]; then
        latest_version=`curl -is https://www.python.org/downloads/ | 
            awk 'match($0, /Python [0-9]\.[0-9]{1,2}\.[0-9]{1,2}/) {print substr($0, RSTART+7, RLENGTH-7)}' |
            sort | grep ${BASH_REMATCH} | tail -n 1`
        PYTHON_VERSION=$latest_version
    fi
    
    if [[ "$1" == "latest" ]]; then
        latest_version=`curl -is https://www.python.org/downloads/ | 
            awk 'match($0, /Python [0-9]\.[0-9]{1,2}\.[0-9]{1,2}/) {print substr($0, RSTART+7, RLENGTH-7)}' |
            sort | grep '3.' | tail -n 1`
        PYTHON_VERSION=$latest_version
    fi
    echo "Final Python version is ${PYTHON_VERSION}"
}


function main() {
    # 1: the Python version tag
    # 2: bool of if should symlink python and pip to python3 versions
    PYTHON_VERSION=$1
    LINK_PYTHON_TO_PYTHON3=1

    check_version $PYTHON_VERSION
}

main "$@" || exit 1