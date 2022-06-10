
#!/bin/bash
set -e
set -o pipefail

cat lib/secret/secret.dart.sample | sed \
  -e "s|\[SECRET_TWITTER_API_KEY\]|$SECRET_TWITTER_API_KEY|g" \
  -e "s|\[SECRET_TWITTER_API_KEY_SECRET\]|$SECRET_TWITTER_API_KEY_SECRET|g" \
> lib/secret/secret.dart


