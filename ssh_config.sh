#!/bin/bash
set -eu

function usage {
    cat <<EOF
ssh_config.sh adds VM hosts to SSH config.

Usage:
    ssh_config.sh

Options:
    --help, -h        print this
EOF
}

while [ $# -gt 0 ];
do
    case ${1} in

        --help|-h)
            usage
            exit 1
        ;;
    esac
    shift
done

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
