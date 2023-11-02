#! /bin/bash
if ! grep "GENTOO_MIRRORSs" /etc/portage/make.conf; then
	echo "GENTOO_MIRRORS not found in /etc/portage/make.conf"
	exit 1
fi
