#!/bin/bash
set -e
/usr/sbin/init
systemctl enable docker
systemctl start docker

