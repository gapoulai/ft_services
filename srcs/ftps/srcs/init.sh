#!/bin/sh
check_service() {
	for var in "$@"; do
		if [ $(/usr/bin/pgrep $var | wc -l) == 0 ]; then
			exit 1
		fi
	done
}

rc-service vsftpd start

sleep 5

while true; do
	check_service vsftpd
	sleep 2
done
