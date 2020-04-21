#!/bin/bash

ACTION=$1
BASH_PROFILE=~/.bash_profile

# Functions
show_menu() {
  clear
  echo "--------------------"
  echo "BAOBAB SCRIPT MENU"
  echo "--------------------"
  echo "
  Use one of the following command
  1) create_db    - Create database
  2) delete_db    - Delete database
  3) back_db      - Backup database
  4) restore_db   - Restore backed up database
  5) create_user  - Create user
  3) delete_user  - Delete user
  3) env_setup  - Setup environment
    "
}

delete_db() {
  echo "Deleting database"
  dropdb -U ${BAOBAB_USER} -i -e ${BAOBAB_DATABASE}
}

create_user() {
  echo "Creating user"
  createuser --interactive --pwprompt
}

delete_user() {
  echo "Deleting user..."
  dropuser ${BAOBAB_USER}
}

create_db() {
  echo "Creating database..."
  createdb -O ${BAOBAB_USER} ${BAOBAB_DATABASE}
}

back_db() {
  echo "Dumping database"
  pg_dump ${BAOBAB_DATABASE}  > baobabdb_backup.sql
}

restore_db() {
  echo "Restoring database..."
  psql --set ON_ERROR_STOP=on ${BAOBAB_DATABASE} < baobabdb_backup.sql
}

env_setup() {
  echo "Setup environment..."
  cp .baobab_profile ~

  if !  grep -q 'source ~/.baobab_profile' ~/.bash_profile ; then
    echo "Adding .baobab_profile to .bash_profile"
    echo 'source ~/.baobab_profile' >> ~/.bash_profile
  fi
  source  ~/.bash_profile
}

case $ACTION in
    "create_db") create_db ;;
    "delete_db") delete_db ;;
    "create_user") create_user ;;
    "delete_user") delete_user ;;
    "back_db") back_db ;;
    "restore_db") restore_db ;;
    "env_setup") env_setup ;;
    *) show_menu ;;
esac
