#!/bin/bash

. settings.sh

# set -x

JWKPublic=`idcs settings show -columns=signingCertPublicAccess -showMetadata=false | awk '{print $NF}'`
if [ "True" == $JWKPublic ]; then
  echo "JWK URL is public (no change needed)"
else
  yn=""
  while [ -z $yn ]; do
    echo "JWK URL must be made public for mod_auth_openidc to operate properly."
    echo -n "Do you want me to do that? [Y/N/Q] "
    read yn
    if [ $yn == "Y" ]; then
      idcs settings modify -unprotectJWK=true
    elif [ $yn == "N" -o $yn == "Q" ]; then
      echo "WARNING: the container WILL NOT work (and run.sh will refuse to start it)"
      echo "         until you change that."
      if [ $yn == "Q" ]; then
        exit
      fi
    else
      yn=""
      echo ""
      echo "Choose one of:"
      echo " Y for Yes"
      echo " N for No"
      echo " Q to quit"
      echo ""
    fi
  done
fi
echo ""

# this cleans up the old one
echo "Deleting any existing app with the name $IDCS_APPNAME"
idcs app setactive -name="$IDCS_APPNAME" -active=false
idcs app delete -name="$IDCS_APPNAME"

echo ""

echo "Creating app named $IDCS_APPNAME"
idcs app create -name="$IDCS_APPNAME" -template=CustomWebAppTemplateId \
  -redirectUris=${OIDC_REDIRECT_URL} \
  -allUrlSchemesAllowed=true \
  -isOAuthClient=true -clientType=confidential \
  -allowedGrants=authorization_code

idcs app setactive -name="$IDCS_APPNAME" -active=true

echo ""
echo ""
echo "Update settings.sh with the following client ID and secret:"
idcs app info -name="$IDCS_APPNAME" -columns=name,clientSecret -showMetadata=false
