#!/bin/bash
set -e

/usr/sbin/sshd -D &
su jenkins
exec "$@"
