#!/bin/sh

cd "$(dirname "$0")/../../" || exit
flutter run --dart-define=FB_EMU_HOST=localhost