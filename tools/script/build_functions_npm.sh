#!/bin/sh

cd "$(dirname "$0")/../../_firebase/functions" || exit
npm run build
