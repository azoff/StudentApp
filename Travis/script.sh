#!/bin/sh
set -e

xcodebuild -project StudentApp.xcodeproj -scheme StudentApp -sdk iphonesimulator8.0 -configuration Release TEST_AFTER_BUILD=YES