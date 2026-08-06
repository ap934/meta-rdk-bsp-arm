require ccsp_common_genericarm.inc

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://bbhm_def_cfg_ten64.xml"

do_install:append() {
    # Config files and scripts
    install -d ${D}/usr/ccsp/config
    install -m 644 ${WORKDIR}/bbhm_def_cfg_ten64.xml ${D}/usr/ccsp/config/bbhm_def_cfg.xml
    install -m 755 ${S}/scripts/bbhm_patch.sh ${D}/usr/ccsp/psm/bbhm_patch.sh
    if ${@bb.utils.contains('DISTRO_FEATURES','vlan_manager','false','true',d)}; then
        # VlanInUse is not required for default bridged approach by ethagent
        sed -i "/dmsb.wanmanager.if.1.VirtualInterface.1.VlanInUse/ s/Device.X_RDK_Ethernet.VLANTermination.1//" ${WORKDIR}/bbhm_def_cfg_nxp.xml
        sed -i "/dmsb.wanmanager.if.1.VirtualInterface.1.VlanCount/ s/>1</>0</" ${WORKDIR}/bbhm_def_cfg_nxp.xml
    fi
}

