#!/bin/bash
set -e
set -o pipefail

# Can not use separators [/, :, @]
cat android/key.properties.sample | sed \
  -e "s;\[ANDROID_KEYSTORE_PASSWORD\];$ANDROID_KEYSTORE_PASSWORD;g" \
  -e "s;\[ANDROID_KEYSTORE_PRIVATE_KEY_PASSWORD\];$ANDROID_KEYSTORE_PRIVATE_KEY_PASSWORD;g" \
  -e "s;\[ANDROID_KEYSTORE_ALIAS\];$ANDROID_KEYSTORE_ALIAS;g" \
  -e "s;\[ANDROID_KEYSTORE_PATH\];$ANDROID_KEYSTORE_PATH;g" \
> android/key.properties

