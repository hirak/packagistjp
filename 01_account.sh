#!/bin/sh
adduser hiraku
mkdir -m 700 ~hiraku/.ssh
wget -O ~hiraku/.ssh/authorized_keys https://github.com/hirak.keys
chown hiraku:hiraku ~hiraku/.ssh
chown hiraku:hiraku ~hiraku/.ssh/authorized_keys
chmod 600 ~hiraku/.ssh/authorized_keys

echo 'next: $ visudo'
echo 'next: $ passwd hiraku'

