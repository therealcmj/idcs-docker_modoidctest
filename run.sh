#!/bin/bash

. settings.sh

# before spinning the container make sure that the JWK URL is open
status=`curl -s -o /dev/null -w "%{http_code}" ${IDCS_SERVER_URL}/admin/v1/SigningCert/jwk`
if [ $status -ne "200" ]; then
  echo "Sanity check failed - did you unprotect the keys in the IDCS console?"
  exit -1
fi

# set -x

# docker run --rm -it \
docker run --rm -d \
  -p ${HTTP_LISTEN_PORT}:80 \
  -e IDCS_SERVER_URL=${IDCS_SERVER_URL} \
  -e OIDC_REDIRECT_URL=${OIDC_REDIRECT_URL} \
  -e OIDC_CLIENT_ID=${OIDC_CLIENT_ID} \
  -e OIDC_CLIENT_SECRET=${OIDC_CLIENT_SECRET} \
  -e OIDC_PASSPHRASE=${OIDC_PASSPHRASE} \
  $IMGNAME

docker ps | grep $IMGNAME

open http://localhost:${HTTP_LISTEN_PORT}
