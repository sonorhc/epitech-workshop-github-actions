#!/usr/bin/env sh

NAME=$1

./"$NAME" | grep -q "Hello, World!"
