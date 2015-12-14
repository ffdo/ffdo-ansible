#!/bin/bash
set +e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
ROOT_DIR=$(cd "$DIR/../../" && pwd)
ROLE_DIR="$ROOT_DIR/roles/internal"

export CI=true

execute_test() {
  role=$1
  echo "Testing role $role"
  cd $ROLE_DIR/$role
  env KITCHEN_YAML=.kitchen.travis.yml kitchen test
}

EXIT_RC=0
FAILED_ROLES=()
cd $ROOT_DIR
for role in $(ls $ROLE_DIR)
do
  if [ -d "$ROLE_DIR/$role/test" ]; then
    execute_test $role
    RC=$?
    cd $ROOT_DIR
    if [ "$RC" != "0" ]; then
      FAILED_ROLES+=("$role")
      EXIT_RC=$RC
    fi
    sleep 5
  fi
done

if [ "$EXIT_RC" != "0" ]; then
  for role in ${FAILED_ROLES[@]}
  do
    echo "Role $role failed"
  done
fi

exit $EXIT_RC
