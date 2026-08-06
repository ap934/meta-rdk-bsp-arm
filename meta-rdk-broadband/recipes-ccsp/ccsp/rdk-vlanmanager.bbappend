FILESEXTRAPATHS_prepend := "${THISDIR}/rdk-vlanmanager:"
include ccsp_common_bananapi.inc
SRC_URI += "file://0001-RDKBNETWOR-98-Support-for-untagged-VLAN.patch"
