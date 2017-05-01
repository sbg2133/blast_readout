#
# Created by System Generator     Fri Mar 10 11:27:28 2017
#
# Note: This file is produced automatically, and will be overwritten the next
# time you press "Generate" in System Generator.
#

namespace eval ::xilinx::dsptool::iseproject::param {
    set SynthStrategyName {XST Defaults*}
    set ImplStrategyName {ISE Defaults*}
    set Compilation {NGC Netlist}
    set Project {blast_0209_dds305_cw}
    set DSPFamily {Virtex6}
    set DSPDevice {xc6vsx475t}
    set DSPPackage {ff1759}
    set DSPSpeed {-1}
    set HDLLanguage {vhdl}
    set SynthesisTool {XST}
    set Simulator {Modelsim-SE}
    set ReadCores {False}
    set MapEffortLevel {High}
    set ParEffortLevel {High}
    set Frequency {256.003276841944}
    set CreateInterfaceDocument {off}
    set NewXSTParser {1}
	if { [ string equal $Compilation {IP Packager} ] == 1 } {
		set PostProjectCreationProc {dsp_package_for_vivado_ip_integrator}
		set IP_Library_Text {SysGen}
		set IP_Vendor_Text {Xilinx}
		set IP_Version_Text {1.0}
		set IP_Categories_Text {System Generator for DSP}
		set IP_Common_Repos {0}
		set IP_Dir {}
		set IP_LifeCycle_Menu {1}
		set IP_Description    {}
		
	}
    set ProjectFiles {
        {{blast_0209_dds305_cw.vhd} -view All}
        {{blast_0209_dds305.vhd} -view All}
        {{blast_0209_dds305_cw.ucf}}
        {{blast_0209_dds305_cw.xdc}}
        {{bmg_72_648cfb7b6fc9d60b.mif}}
        {{bmg_72_51c8ac5d548aeae7.mif}}
        {{bmg_72_408f0cc582283812.mif}}
        {{bmg_72_8d0b8b9df2750ee8.mif}}
        {{bmg_72_60732526a32585a3.mif}}
        {{bmg_72_b355163dcc98d152.mif}}
        {{bmg_72_a9cd3afac42c99fd.mif}}
        {{bmg_72_cc15fa2ec33bfbe5.mif}}
        {{bmg_72_d030b0e92b1569b0.mif}}
        {{bmg_72_4d9bcbdf9d0508f0.mif}}
        {{bmg_72_0ab69a8bd13b8f15.mif}}
        {{bmg_72_916677c90b373a35.mif}}
        {{bmg_72_7c09cebf9f55b760.mif}}
        {{bmg_72_f17ff8bc64ca31f6.mif}}
        {{bmg_72_0201af75eef6e019.mif}}
        {{bmg_72_110ef86ad32adb7b.mif}}
        {{bmg_72_eaf53c5f13361cdc.mif}}
        {{bmg_72_5e0d5e3feae7c146.mif}}
        {{bmg_72_3323983e8a5ee1ac.mif}}
        {{bmg_72_ae0ddec0927f04a0.mif}}
        {{bmg_72_cc6309531d66aa85.mif}}
        {{bmg_72_4517334a65f39fdf.mif}}
        {{bmg_72_328d7e82706216a4.mif}}
        {{bmg_72_5aa6ffbd97b0a029.mif}}
        {{bmg_72_1e69bed9c31dfa5e.mif}}
        {{dmg_72_469cac73f6852527.mif}}
        {{bmg_72_c4f5525aae3b7cc2.mif}}
        {{bmg_72_80b41e07f1b9f9e7.mif}}
        {{bmg_72_34dec6b258cac0f2.mif}}
        {{bmg_72_52bfb73575709bd7.mif}}
        {{dmg_72_3e09d2589ef3d23d.mif}}
        {{bmg_72_7a7fa6a8949d8574.mif}}
        {{bmg_72_799be638bda88734.mif}}
        {{bmg_72_a900d79ebfb489b6.mif}}
        {{bmg_72_9054aea18ca2eda6.mif}}
        {{bmg_72_be7f7464ba730ea5.mif}}
        {{bmg_72_3171752a0f4cf103.mif}}
        {{bmg_72_60b34418964c6fd5.mif}}
        {{bmg_72_71a5af829a75ed2e.mif}}
        {{bmg_72_e4dfaca742cb7129.mif}}
        {{bmg_72_59ac5a13d6d08875.mif}}
        {{dmg_72_97b1384ea233b22e.mif}}
        {{bmg_72_ebbcdb89d25d5e19.mif}}
        {{bmg_72_71ee2287586fd244.mif}}
        {{/home/muchacho/workspace/skasa/matt3/blast_0209_dds305.slx}}
    }
    set TopLevelModule {blast_0209_dds305_cw}
    set SynthesisConstraintsFile {blast_0209_dds305_cw.xcf}
    set ImplementationStopView {Structural}
    set ProjectGenerator {SysgenDSP}
}
    source SgIseProject.tcl
    ::xilinx::dsptool::iseproject::create
