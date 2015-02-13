# Copyright (c) 2013 CoreOS, Inc.. All rights reserved.
# Distributed under the terms of the GNU General Public License v2

EAPI=5

DESCRIPTION="OEM suite for SAP Monsoon"
HOMEPAGE=""
SRC_URI=""

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64"
IUSE=""

# no source directory
S="${WORKDIR}"

DEPEND="
	app-emulation/open-vm-tools
	"
RDEPEND="${DEPEND}"

src_prepare() {
    sed -e "s\\@@OEM_VERSION_ID@@\\${PVR}\\g" \
        ${FILESDIR}/cloud-config.yml > ${T}/cloud-config.yml || die
}

src_install() {
	insinto "/usr/share/oem"
	doins ${T}/cloud-config.yml
}
