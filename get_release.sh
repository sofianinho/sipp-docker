#!/bin/bash
# This script will get a specific version of your sip package or download the latest by default

# Some simple argument checks
wrong_arg(){
 error "Invalid parameter $1"
 exit 1
}

INSTALL_VERSION="latest"

# Command line arguments if changes. 
while [ $# -gt 0 ]; do
 case "$1" in
  -v)
   INSTALL_VERSION="$2"
   shift 2
   ;;
  *)
   wrong_arg "$1"
   break
   ;;
 esac
done

SIPP_REPO="SIPp/sipp"

# Credits to: Mark Vincze here: https://blog.markvincze.com/download-artifacts-from-a-latest-github-release-in-sh-and-powershell/
get_latest_release() {
  URL="https://github.com/$1/releases/latest"
  VERSION=$(curl -L -s -H 'Accept: application/json' "$URL" |sed -e 's/.*"tag_name":"\([^"]*\)".*/\1/')
  echo "$VERSION"
}

LATEST_VERSION=$(get_latest_release ${SIPP_REPO})
echo "Latest version is:  ${LATEST_VERSION}"
_VERSION=${LATEST_VERSION:1}

# grab the version
if [ "$INSTALL_VERSION" == "latest" ]; then
  curl -OL https://github.com/${SIPP_REPO}/releases/download/"${LATEST_VERSION}"/sipp-"${_VERSION}".tar.gz
else
  echo "Downloading version ${INSTALL_VERSION} (latest version is: ${LATEST_VERSION})"
  curl -OL https://github.com/${SIPP_REPO}/releases/download/"${INSTALL_VERSION}"/sipp-"${INSTALL_VERSION:1}".tar.gz
fi

# Untar
tar xvfz sipp-*.tar.gz 

exit 0
