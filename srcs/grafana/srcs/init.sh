#!/bin/sh
check_service() {
	for var in "$@"; do
		if [ $(/usr/bin/pgrep $var | wc -l) == 0 ]; then
			exit 1
		fi
	done
}

/usr/sbin/grafana-server --homepath=/usr/share/grafana

sleep 5

while true; do
	check_service grafana-server
	sleep 2
done
