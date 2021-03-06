#!/bin/bash
# Check output here to make sure the user was activated or at least already activated

export STORJ_BRIDGE=$(./scripts/get_local_bridge.sh)

BASE_DIR=$(pwd)
FULL_PATH=${BASE_DIR//-}
PROJECT_NAME=${FULL_PATH##*/}

echo "net name: $NET_NAME"

echo "Found Storj bridge at $STORJ_BRIDGE"

# Make sure we can connect to the bridge before moving along
curl $STORJ_BRIDGE > /dev/null 2>&1
if [ $? -ne 0 ]; then
  echo "Failed to connect to local bridge. Ensure that you have VPN set up and that it is connected."
  exit 1;
fi

# Changing these do nothing currently
export STORJ_BRIDGE_USERNAME='test@storj.io'
export STORJ_BRIDGE_PASSWORD='password'

echo -e "User activated.\n"
echo -e "Logging in..."

./scripts/login_user.exp

echo -e "\n"
echo "  - credentials -"
echo "User: $STORJ_BRIDGE_USERNAME"
echo "Pass: $STORJ_BRIDGE_PASSWORD"
echo ""
echo "To start using storj, run the following command:"
echo "export STORJ_BRIDGE=$(./scripts/get_local_bridge.sh)"
echo ""
echo "or"
echo ""
echo ". scripts/setbr"
