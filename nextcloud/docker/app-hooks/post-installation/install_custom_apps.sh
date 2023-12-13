#!/bin/bash

# Function from the Nextcloud's original entrypoint
run_as() {
    if [ "$(id -u)" = 0 ]; then
        su -p www-data -s /bin/sh -c "$1"
    else
        sh -c "$1"
    fi
}

if [[ $ENABLE_OIDC_LOGIN = "true" ]] ; then
    run_as "php occ app:install user_oidc"

    run_as "php occ user_oidc:provider oidc_provider --clientid='$OIDC_LOGIN_CLIENT_ID' --clientsecret='$OIDC_LOGIN_CLIENT_SECRET' --discoveryuri='$OIDC_LOGIN_PROVIDER_URL'"
fi


