#!/bin/bash

echo '
Host mipsle
  HostName localhost
  User root
  Port 2222

Host mipsbe
  HostName localhost
  User root
  Port 2223

Host armle
  HostName localhost
  User root
  Port 2224

Host aarch64
  HostName localhost
  User root
  Port 2225
' >> ~/.ssh/config

echo 'Add VM host to SSH config'
