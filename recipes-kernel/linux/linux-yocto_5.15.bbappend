SRCREV_machine:armefi64 = "5a4667da1ebc1750b1ddaaf93a1f3f98634360e3"
LINUX_VERSION = "5.15.162"

ARMFILESPATHS := "${THISDIR}/${PN}-5.15:"
FILESEXTRAPATHS:prepend:armefi64 = "${ARMFILESPATHS}"
FILESEXTRAPATHS:prepend := "${THISDIR}/files:"

# Patches against the generic 5.15 kernel
SRC_URI:append:armefi64 = " \
    file://defconfig \
    file://01_dpaa2_fix_sfp_lock_issue.patch \
    file://02_dpaa2_add_more_10G_modes.patch \
    file://03_rk3568-pcie-phy-backports.patch \
    "
SRC_URI:append = "file://0001-add-support-for-port-triggering.patch \
                  file://port_triggering.patch"

RDKBFILESPATHS := "${THISDIR}/rdkb:"
FILESEXTRAPATHS:prepend:broadband = "${RDKBFILESPATHS}"

# RDK-B specific Patches
SRC_URI:append:broadband = " \
    file://rdkb.cfg \
    file://netfilter.cfg \
    file://proc-event.cfg \
"

# Patches required to allow backported mt76 driver
SRC_URI:append:armefi64 = " file://04_mtk-backports-for-5-15.patch \
                            file://05_net-allow-PAGE_POOL-to-be-user-selected.patch \
"
