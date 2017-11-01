# docker-pidwatch
A simple daemon that helps you monitor docker containers by maintaining PID
files for them.

## Installation
Run `./install.sh` as root.

## Usage
```
check process my_container with path /var/run/docker-pidwatch/my_container.pid
	if 5 restarts with 5 cycles then timeout
```
