#!/bin/sh

cd "$(dirname "$0")/../../_firebase" || exit
firebase emulators:start --import ./emulator_data --export-on-exit ./emulator_data
