# docker-pidwatch
A simple daemon that helps you monitor docker containers by maintaining PID
files for them.

## Installation
Run `./install.sh` as root.

## Usage Example
```bash
docker run -it --rm --name my_container ubuntu bash -c "while true; do sleep 10; done"
cat << EOF > /etc/monit.d/my_container
check process my_container with path /var/run/docker-pidwatch/my_container.pid
	if 5 restarts with 5 cycles then timeout
EOF
monit reload
```
