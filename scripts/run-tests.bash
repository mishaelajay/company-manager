#!/usr/bin/env bash

set -e

cd "${0%/*}/.."

echo "Running tests"
rails test:all
