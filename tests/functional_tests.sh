#!/usr/bin/env sh

NAME=$1

sh tests/test_hello_world.sh "$NAME" && echo "test_hello_world: success" || echo "test_hello_world: fail"
