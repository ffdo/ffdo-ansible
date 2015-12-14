#!/bin/bash
set +e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
ROOT_DIR=$(cd "$DIR/../../" && pwd)
PLAYBOOK_DIR="$ROOT_DIR/playbooks"

COLOR_END='\e[0m'
COLOR_RED='\e[0;31m' # Red
COLOR_YEL='\e[0;33m' # Yellow
COLOR_GREEN='\e[0;32m' # Green

msg_fail() {
  printf "$COLOR_RED$@$COLOR_END"
  printf "\n"
}

msg_ok() {
  printf "$COLOR_GREEN$@$COLOR_END"
  printf "\n"
}
execute_test() {
  playbook=$1
  msg_ok "Testing playbook $playbook"
  ansible-playbook --syntax-check --list-tasks -i "localhost," $PLAYBOOK_DIR/$playbook
}

EXIT_RC=0
FAILED_PLAYBOOKS=()
cd $ROOT_DIR
for playbook in $(ls $PLAYBOOK_DIR)
do
  if [ "${playbook##*.}" = "yml" ]; then
    execute_test $playbook
    RC=$?
    if [ "$RC" != "0" ]; then
      FAILED_PLAYBOOKS+=("$playbook")
      EXIT_RC=$RC
    fi
  fi
done

if [ "$EXIT_RC" != "0" ]; then
  for playbook in ${FAILED_PLAYBOOKS[@]}
  do
    msg_fail "Playbook $playbook failed"
  done
else
  msg_ok "Everything checks out just fine"
fi

exit $EXIT_RC