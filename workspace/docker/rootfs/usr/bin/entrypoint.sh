#!/bin/bash

mkdir -p /tmp/etc/ssh/
ssh-keygen -A -f /tmp/
/usr/sbin/sshd -D
