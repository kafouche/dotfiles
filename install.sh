#!/bin/bash

set -o errexit
set -o pipefail
set -o nounset

WORKDIR="$(dirname "${BASH_SOURCE[0]}")"

if [ "$EUID" -ne 0 ]; then
    printf 'This script must be run as root.\n' >&2
    exit 1
fi

# Profile
mkdir --parents /etc/profile.d
install -mode=644 --owner=root "$WORKDIR"/profile.d/*.sh /etc/profile/

# Vim
mkdir --parents /etc/vim
install -mode=644 --owner=root "$WORKDIR"/vim/vimrc.local /etc/vim/

exit 0