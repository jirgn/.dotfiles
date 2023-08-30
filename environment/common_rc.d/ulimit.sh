#!/usr/bin/env sh

if [[ "$(uname)" == "Darwin" ]] ; then
    ulimit -n 10240
fi
