#!/bin/bash

. settings.sh

# set -x

# docker run --rm -it \
docker run --rm -d \
  -p 8080:80 \
  -e IDCS_SERVER_URL=${IDCS_SERVER_URL} \
  -e OIDC_REDIRECT_URL=${OIDC_REDIRECT_URL} \
  -e OIDC_CLIENT_ID=${OIDC_CLIENT_ID} \
  -e OIDC_CLIENT_SECRET=${OIDC_CLIENT_SECRET} \
  -e OIDC_PASSPHRASE=${OIDC_PASSPHRASE} \
  $IMGNAME

open http://localhost:${HTTP_LISTEN_PORT}
