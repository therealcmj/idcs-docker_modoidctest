#!/bin/bash

. settings.sh

set -x

# this cleans up the old one
idcs app setactive -name="$IDCS_APPNAME" -active=false
idcs app delete -name="$IDCS_APPNAME"

idcs app create -name="$IDCS_APPNAME" -template=CustomWebAppTemplateId \
  -redirectUris=${OIDC_REDIRECT_URL} \
  -allUrlSchemesAllowed=true \
  -isOAuthClient=true -clientType=confidential \
  -allowedGrants=authorization_code

idcs app setactive -name="$IDCS_APPNAME" -active=true

echo "Update settings.sh with the following client ID and secret!"
idcs app info -name="$IDCS_APPNAME" -columns=name,clientSecret
