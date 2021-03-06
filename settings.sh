
# All values needed by run.sh, createapp.sh, and the Apache configuration is
# set in an environment variable.
#
# For simplicity I use the same environment variable names everywhere


# these are the only 3 settings you should need to twiddle

# URL to your IDCS tenancy
IDCS_SERVER_URL=https://YOURIDCSURL.identity.oraclecloud.com

# the Client ID and Secret of the OpenID Connect app in IDCS
# you can create the app manually (i.e. in the admin console)
# or
# via the IDCS CLI by running the createapp.sh script.
#
# either way you MUST copy/paste valid values in here BEFORE
# launching the container!
OIDC_CLIENT_ID=CHANGE_ME
OIDC_CLIENT_SECRET=CHANGE_ME_TOO


# you probably won't need to edit past this point

# docker image name
IMGNAME=therealcmj/oidctest

# what port should Docker listen on?
HTTP_LISTEN_PORT=8080

# the URL of this container plus the protected directory plus a little nonsense
OIDC_REDIRECT_URL=http://localhost:${HTTP_LISTEN_PORT}/protected/redirect_uri/

# generate a random passphrase for the cookies
# in a "real world" highly available deployment you wouldn't want to do this
# but for our purposes this is great because restarting the container will
# invalidate any existing cookies.
OIDC_PASSPHRASE=`echo $RANDOM | md5 | awk '{print $1}'`

# this is only used by the CLI script
IDCS_APPNAME="Docker_OIDCTest"
