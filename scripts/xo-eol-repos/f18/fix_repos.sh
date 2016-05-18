#!/bin/bash
#
# Author:   Justin W. Flory <me [at] justinwflory [dot] com>
# Language: Shell
# Filename: fix_repos.sh
#
# Description:
#    Automatically fixes the One Laptop per Child (OLPC)
#    XO laptops to use correct repository files for its
#    version of Fedora. For the HFOSS course at the
#    Rochester Institute of Technology, most of the XOs
#    are running Fedora 18. This script targets setting
#    up the EoL (end-of-life) repos for the sake of the
#    laptop.
#
# License:
#    This Source Code Form is subject to the terms of the Mozilla Public
#    License, v. 2.0. If a copy of the MPL was not distributed with this
#    file, You can obtain one at http://mozilla.org/MPL/2.0/.
#

# Bash configuration
set -euxo pipefail

# Environment variables
KEYSIGN_DIR="/etc/pki/rpm-gpg"
YUM_REPOS_DIR="/etc/yum.repos.d"

# Make our working space
if [ ! -d "$TMPDIR" ]; then
	echo "Working directory does not exist, making temporary directory..."
	mkdir $TMPDIR
fi
cd $TMPDIR

# Pull down obsolete keys for Fedora 18 and import
#     https://getfedora.org/keys/obsolete.html
#     https://getfedora.org/keys/faq/
curl -L -O https://getfedora.org/static/DE7F38BD.txt
curl -L -O https://getfedora.org/static/A4D647E9.txt
sudo rpm --import DE7F38BD.txt && rm DE7F38BD.txt
sudo rpm --import A4D647E9.txt && rm A4D647E9.txt

# Get the new repo files and replace the old ones
curl -L -O https://mirror.justinwflory.com/pub/linux/fedora/eol-repos/fedora.repo
curl -L -O https://mirror.justinwflory.com/pub/linux/fedora/eol-repos/fedora-updates.repo

if [ -d $YUM_REPOS_DIR/fedora.repo ]; then
	sudo rm $YUM_REPOS_DIR/fedora.repo
fi
if [ -d $YUM_REPOS_DIR/fedora-updates.repo ]; then
	sudo rm $YUM_REPOS_DIR/fedora-updates.repo
fi

sudo mv fedora.repo $YUM_REPOS_DIR
sudo mv fedora-updates.repo $YUM_REPOS_DIR

# Clean up, print out
if [ "$(ls -A $TMPDIR)" ]; then
	echo "Directory is not empty. Leaving."
else
	rmdir $TMPDIR
fi

echo "Your repos should be fixed! Try 'sudo yum install git' to try it out."
