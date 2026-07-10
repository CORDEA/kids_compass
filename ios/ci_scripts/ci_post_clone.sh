#!/bin/sh
set -e

export MISE_DATA_DIR="$CI_DERIVED_DATA_PATH/cache/mise"
export PUB_CACHE="$CI_DERIVED_DATA_PATH/cache/pub-cache"

brew install mise cmake

cd "$CI_PRIMARY_REPOSITORY_PATH"
mise install flutter

export PATH="$MISE_DATA_DIR/shims:$PATH"

flutter build ios --config-only
dart run build_runner build --delete-conflicting-outputs
