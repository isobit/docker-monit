#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

if [[ "$(whoami)" != "root" ]]; then
	echo "ERROR: Must be root to install"
	exit 1
fi

if [[ -d /usr/local/bin ]]; then
	echo "Installing /usr/local/bin/docker-pidwatch"
	cp docker-pidwatch /usr/local/bin/
else
	echo "ERROR: Directory /usr/local/bin does not exist"
	exit 1
fi

if [[ -d /etc/systemd/system ]]; then
	echo "Installing systemd service"
	cp docker-pidwatch.service /etc/systemd/system/
	systemctl daemon-reload
	systemctl enable docker-pidwatch
	systemctl start docker-pidwatch
else
	echo "WARNING: Directory /etc/systemd/system does not exist, service will not be installed"
fi

if [[ -d /etc/monit.d ]]; then
	echo "Installing /etc/monit.d/docker-pidwatch.monitrc"
	cp docker-pidwatch.monitrc /etc/monit.d/
	monit reload
else
	echo "WARNING: Directory /etc/monit.d does not exist, monitoring will not be installed"
fi
