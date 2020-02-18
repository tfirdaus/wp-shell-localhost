#!/bin/bash

# shellcheck source=bin/shared.sh
# shellcheck disable=SC1091
source "$(dirname "$0")/shared.sh"

while IFS= read -r line; do
	export "$(echo -e "$line" | sed -e 's/[[:space:]]*$//' -e "s/'//g")"
done < <(grep DB_ .env)

export WP_LOCKER_START=1

"$(dirname "$0")"/up.sh

echo "😴 Waiting for MySQL service to run...";
while ! dexec_root mysqladmin ping \
	--host=${DB_HOST%:*} \
	--port=${DB_HOST#*:} \
	--user=${DB_USER} \
	--password=${DB_PASSWORD} > /dev/null 2>&1; do
  sleep 2
done

echo "😴 Checking if WordPress file is ready...";
while ! dexec cat wp-config.php > /dev/null 2>&1; do
	sleep 2
done

"$(dirname "$0")"/install.sh --wp-plugins --wp-themes "$@"

echo "👌 Done!"
