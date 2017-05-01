
-------------------------------------------------------------------
-- System Generator version 14.5 VHDL source file.
--
-- Copyright(C) 2013 by Xilinx, Inc.  All rights reserved.  This
-- text/file contains proprietary, confidential information of Xilinx,
-- Inc., is distributed under license from Xilinx, Inc., and may be used,
-- copied and/or disclosed only pursuant to the terms of a valid license
-- agreement with Xilinx, Inc.  Xilinx hereby grants you a license to use
-- this text/file solely for design, simulation, implementation and
-- creation of design files limited to Xilinx devices or technologies.
-- Use with non-Xilinx devices or technologies is expressly prohibited
-- and immediately terminates your license unless covered by a separate
-- agreement.
--
-- Xilinx is providing this design, code, or information "as is" solely
-- for use in developing programs and solutions for Xilinx devices.  By
-- providing this design, code, or information as one possible
-- implementation of this feature, application or standard, Xilinx is
-- making no representation that this implementation is free from any
-- claims of infringement.  You are responsible for obtaining any rights
-- you may require for your implementation.  Xilinx expressly disclaims
-- any warranty whatsoever with respect to the adequacy of the
-- implementation, including but not limited to warranties of
-- merchantability or fitness for a particular purpose.
--
-- Xilinx products are not intended for use in life support appliances,
-- devices, or systems.  Use in such applications is expressly prohibited.
--
-- Any modifications that are made to the source code are done at the user's
-- sole risk and will be unsupported.
--
-- This copyright and support notice must be retained as part of this
-- text at all times.  (c) Copyright 1995-2013 Xilinx, Inc.  All rights
-- reserved.
-------------------------------------------------------------------
-- The following code must appear in the VHDL architecture header:

------------- Begin Cut here for COMPONENT Declaration ------ COMP_TAG
component blast_0209_dds305_cw  port (
    blast_0209_dds305_accum_snap_bram_data_out: in std_logic_vector(127 downto 0); 
    blast_0209_dds305_accum_snap_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    blast_0209_dds305_adc_mkid_user_data_i0: in std_logic_vector(11 downto 0); 
    blast_0209_dds305_adc_mkid_user_data_i1: in std_logic_vector(11 downto 0); 
    blast_0209_dds305_adc_mkid_user_data_q0: in std_logic_vector(11 downto 0); 
    blast_0209_dds305_adc_mkid_user_data_q1: in std_logic_vector(11 downto 0); 
    blast_0209_dds305_adc_mkid_user_sync: in std_logic; 
    blast_0209_dds305_adc_snap_bram_data_out: in std_logic_vector(63 downto 0); 
    blast_0209_dds305_adc_snap_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    blast_0209_dds305_adc_snap_trig_user_data_out: in std_logic_vector(31 downto 0); 
    blast_0209_dds305_bins_user_data_out: in std_logic_vector(31 downto 0); 
    blast_0209_dds305_chan_select_user_data_out: in std_logic_vector(31 downto 0); 
    blast_0209_dds305_dac_reset_user_data_out: in std_logic_vector(31 downto 0); 
    blast_0209_dds305_dds_shift_user_data_out: in std_logic_vector(31 downto 0); 
    blast_0209_dds305_fft_shift_user_data_out: in std_logic_vector(31 downto 0); 
    blast_0209_dds305_fft_snap_bram_data_out: in std_logic_vector(63 downto 0); 
    blast_0209_dds305_fft_snap_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    blast_0209_dds305_load_bins_user_data_out: in std_logic_vector(31 downto 0); 
    blast_0209_dds305_mixerout_bram_data_out: in std_logic_vector(63 downto 0); 
    blast_0209_dds305_mixerout_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    blast_0209_dds305_one_gbe_app_dbg_data: in std_logic_vector(31 downto 0); 
    blast_0209_dds305_one_gbe_app_dbg_dvld: in std_logic; 
    blast_0209_dds305_one_gbe_app_rx_badframe: in std_logic; 
    blast_0209_dds305_one_gbe_app_rx_data: in std_logic_vector(7 downto 0); 
    blast_0209_dds305_one_gbe_app_rx_dvld: in std_logic; 
    blast_0209_dds305_one_gbe_app_rx_eof: in std_logic; 
    blast_0209_dds305_one_gbe_app_rx_overrun: in std_logic; 
    blast_0209_dds305_one_gbe_app_rx_srcip: in std_logic_vector(31 downto 0); 
    blast_0209_dds305_one_gbe_app_rx_srcport: in std_logic_vector(15 downto 0); 
    blast_0209_dds305_one_gbe_app_tx_afull: in std_logic; 
    blast_0209_dds305_one_gbe_app_tx_overflow: in std_logic; 
    blast_0209_dds305_pps_gateway: in std_logic; 
    blast_0209_dds305_pps_start_user_data_out: in std_logic_vector(31 downto 0); 
    blast_0209_dds305_qdr_lut_qdr0_ack: in std_logic; 
    blast_0209_dds305_qdr_lut_qdr0_cal_fail: in std_logic; 
    blast_0209_dds305_qdr_lut_qdr0_data_out: in std_logic_vector(71 downto 0); 
    blast_0209_dds305_qdr_lut_qdr0_data_valid: in std_logic; 
    blast_0209_dds305_qdr_lut_qdr0_phy_ready: in std_logic; 
    blast_0209_dds305_qdr_lut_qdr1_ack: in std_logic; 
    blast_0209_dds305_qdr_lut_qdr1_cal_fail: in std_logic; 
    blast_0209_dds305_qdr_lut_qdr1_data_out: in std_logic_vector(71 downto 0); 
    blast_0209_dds305_qdr_lut_qdr1_data_valid: in std_logic; 
    blast_0209_dds305_qdr_lut_qdr1_phy_ready: in std_logic; 
    blast_0209_dds305_qdr_lut_we_qdr_user_data_out: in std_logic_vector(31 downto 0); 
    blast_0209_dds305_rawfftbin_bram_data_out: in std_logic_vector(127 downto 0); 
    blast_0209_dds305_rawfftbin_ctrl_user_data_out: in std_logic_vector(31 downto 0); 
    blast_0209_dds305_rx_ack_user_data_out: in std_logic_vector(31 downto 0); 
    blast_0209_dds305_rx_rst_user_data_out: in std_logic_vector(31 downto 0); 
    blast_0209_dds305_start_dac_user_data_out: in std_logic_vector(31 downto 0); 
    blast_0209_dds305_sync_accum_len_user_data_out: in std_logic_vector(31 downto 0); 
    blast_0209_dds305_sync_accum_reset_user_data_out: in std_logic_vector(31 downto 0); 
    blast_0209_dds305_tx_destip_user_data_out: in std_logic_vector(31 downto 0); 
    blast_0209_dds305_tx_destport_user_data_out: in std_logic_vector(31 downto 0); 
    blast_0209_dds305_tx_rst_user_data_out: in std_logic_vector(31 downto 0); 
    ce: in std_logic := '1'; 
    clk: in std_logic; -- clock period = 3.9062 ns (256.00327684194355 Mhz)
    blast_0209_dds305_accum_snap_bram_addr: out std_logic_vector(8 downto 0); 
    blast_0209_dds305_accum_snap_bram_data_in: out std_logic_vector(127 downto 0); 
    blast_0209_dds305_accum_snap_bram_we: out std_logic; 
    blast_0209_dds305_accum_snap_status_user_data_in: out std_logic_vector(31 downto 0); 
    blast_0209_dds305_adc_snap_bram_addr: out std_logic_vector(9 downto 0); 
    blast_0209_dds305_adc_snap_bram_data_in: out std_logic_vector(63 downto 0); 
    blast_0209_dds305_adc_snap_bram_we: out std_logic; 
    blast_0209_dds305_adc_snap_status_user_data_in: out std_logic_vector(31 downto 0); 
    blast_0209_dds305_dac_mkid1_dac_data_i0: out std_logic_vector(15 downto 0); 
    blast_0209_dds305_dac_mkid1_dac_data_i1: out std_logic_vector(15 downto 0); 
    blast_0209_dds305_dac_mkid1_dac_data_q0: out std_logic_vector(15 downto 0); 
    blast_0209_dds305_dac_mkid1_dac_data_q1: out std_logic_vector(15 downto 0); 
    blast_0209_dds305_dac_mkid1_dac_sync_i: out std_logic; 
    blast_0209_dds305_dac_mkid1_dac_sync_q: out std_logic; 
    blast_0209_dds305_dac_mkid1_not_reset: out std_logic; 
    blast_0209_dds305_fft_snap_bram_addr: out std_logic_vector(8 downto 0); 
    blast_0209_dds305_fft_snap_bram_data_in: out std_logic_vector(63 downto 0); 
    blast_0209_dds305_fft_snap_bram_we: out std_logic; 
    blast_0209_dds305_fft_snap_status_user_data_in: out std_logic_vector(31 downto 0); 
    blast_0209_dds305_mixerout_bram_addr: out std_logic_vector(13 downto 0); 
    blast_0209_dds305_mixerout_bram_data_in: out std_logic_vector(63 downto 0); 
    blast_0209_dds305_mixerout_bram_we: out std_logic; 
    blast_0209_dds305_mixerout_status_user_data_in: out std_logic_vector(31 downto 0); 
    blast_0209_dds305_one_gbe_app_rx_ack: out std_logic; 
    blast_0209_dds305_one_gbe_app_rx_rst: out std_logic; 
    blast_0209_dds305_one_gbe_app_tx_data: out std_logic_vector(7 downto 0); 
    blast_0209_dds305_one_gbe_app_tx_destip: out std_logic_vector(31 downto 0); 
    blast_0209_dds305_one_gbe_app_tx_destport: out std_logic_vector(15 downto 0); 
    blast_0209_dds305_one_gbe_app_tx_dvld: out std_logic; 
    blast_0209_dds305_one_gbe_app_tx_eof: out std_logic; 
    blast_0209_dds305_one_gbe_app_tx_rst: out std_logic; 
    blast_0209_dds305_overflow_user_data_in: out std_logic_vector(31 downto 0); 
    blast_0209_dds305_qdr_lut_qdr0_address: out std_logic_vector(31 downto 0); 
    blast_0209_dds305_qdr_lut_qdr0_be: out std_logic_vector(7 downto 0); 
    blast_0209_dds305_qdr_lut_qdr0_data_in: out std_logic_vector(71 downto 0); 
    blast_0209_dds305_qdr_lut_qdr0_rd_en: out std_logic; 
    blast_0209_dds305_qdr_lut_qdr0_wr_en: out std_logic; 
    blast_0209_dds305_qdr_lut_qdr1_address: out std_logic_vector(31 downto 0); 
    blast_0209_dds305_qdr_lut_qdr1_be: out std_logic_vector(7 downto 0); 
    blast_0209_dds305_qdr_lut_qdr1_data_in: out std_logic_vector(71 downto 0); 
    blast_0209_dds305_qdr_lut_qdr1_rd_en: out std_logic; 
    blast_0209_dds305_qdr_lut_qdr1_wr_en: out std_logic; 
    blast_0209_dds305_rawfftbin_bram_addr: out std_logic_vector(13 downto 0); 
    blast_0209_dds305_rawfftbin_bram_data_in: out std_logic_vector(127 downto 0); 
    blast_0209_dds305_rawfftbin_bram_we: out std_logic; 
    blast_0209_dds305_rawfftbin_status_user_data_in: out std_logic_vector(31 downto 0)
  );
end component;
-- COMP_TAG_END ------ End COMPONENT Declaration ------------

-- The following code must appear in the VHDL architecture
-- body.  Substitute your own instance name and net names.

------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
your_instance_name : blast_0209_dds305_cw
  port map (
    blast_0209_dds305_accum_snap_bram_data_out => blast_0209_dds305_accum_snap_bram_data_out,
    blast_0209_dds305_accum_snap_ctrl_user_data_out => blast_0209_dds305_accum_snap_ctrl_user_data_out,
    blast_0209_dds305_adc_mkid_user_data_i0 => blast_0209_dds305_adc_mkid_user_data_i0,
    blast_0209_dds305_adc_mkid_user_data_i1 => blast_0209_dds305_adc_mkid_user_data_i1,
    blast_0209_dds305_adc_mkid_user_data_q0 => blast_0209_dds305_adc_mkid_user_data_q0,
    blast_0209_dds305_adc_mkid_user_data_q1 => blast_0209_dds305_adc_mkid_user_data_q1,
    blast_0209_dds305_adc_mkid_user_sync => blast_0209_dds305_adc_mkid_user_sync,
    blast_0209_dds305_adc_snap_bram_data_out => blast_0209_dds305_adc_snap_bram_data_out,
    blast_0209_dds305_adc_snap_ctrl_user_data_out => blast_0209_dds305_adc_snap_ctrl_user_data_out,
    blast_0209_dds305_adc_snap_trig_user_data_out => blast_0209_dds305_adc_snap_trig_user_data_out,
    blast_0209_dds305_bins_user_data_out => blast_0209_dds305_bins_user_data_out,
    blast_0209_dds305_chan_select_user_data_out => blast_0209_dds305_chan_select_user_data_out,
    blast_0209_dds305_dac_reset_user_data_out => blast_0209_dds305_dac_reset_user_data_out,
    blast_0209_dds305_dds_shift_user_data_out => blast_0209_dds305_dds_shift_user_data_out,
    blast_0209_dds305_fft_shift_user_data_out => blast_0209_dds305_fft_shift_user_data_out,
    blast_0209_dds305_fft_snap_bram_data_out => blast_0209_dds305_fft_snap_bram_data_out,
    blast_0209_dds305_fft_snap_ctrl_user_data_out => blast_0209_dds305_fft_snap_ctrl_user_data_out,
    blast_0209_dds305_load_bins_user_data_out => blast_0209_dds305_load_bins_user_data_out,
    blast_0209_dds305_mixerout_bram_data_out => blast_0209_dds305_mixerout_bram_data_out,
    blast_0209_dds305_mixerout_ctrl_user_data_out => blast_0209_dds305_mixerout_ctrl_user_data_out,
    blast_0209_dds305_one_gbe_app_dbg_data => blast_0209_dds305_one_gbe_app_dbg_data,
    blast_0209_dds305_one_gbe_app_dbg_dvld => blast_0209_dds305_one_gbe_app_dbg_dvld,
    blast_0209_dds305_one_gbe_app_rx_badframe => blast_0209_dds305_one_gbe_app_rx_badframe,
    blast_0209_dds305_one_gbe_app_rx_data => blast_0209_dds305_one_gbe_app_rx_data,
    blast_0209_dds305_one_gbe_app_rx_dvld => blast_0209_dds305_one_gbe_app_rx_dvld,
    blast_0209_dds305_one_gbe_app_rx_eof => blast_0209_dds305_one_gbe_app_rx_eof,
    blast_0209_dds305_one_gbe_app_rx_overrun => blast_0209_dds305_one_gbe_app_rx_overrun,
    blast_0209_dds305_one_gbe_app_rx_srcip => blast_0209_dds305_one_gbe_app_rx_srcip,
    blast_0209_dds305_one_gbe_app_rx_srcport => blast_0209_dds305_one_gbe_app_rx_srcport,
    blast_0209_dds305_one_gbe_app_tx_afull => blast_0209_dds305_one_gbe_app_tx_afull,
    blast_0209_dds305_one_gbe_app_tx_overflow => blast_0209_dds305_one_gbe_app_tx_overflow,
    blast_0209_dds305_pps_gateway => blast_0209_dds305_pps_gateway,
    blast_0209_dds305_pps_start_user_data_out => blast_0209_dds305_pps_start_user_data_out,
    blast_0209_dds305_qdr_lut_qdr0_ack => blast_0209_dds305_qdr_lut_qdr0_ack,
    blast_0209_dds305_qdr_lut_qdr0_cal_fail => blast_0209_dds305_qdr_lut_qdr0_cal_fail,
    blast_0209_dds305_qdr_lut_qdr0_data_out => blast_0209_dds305_qdr_lut_qdr0_data_out,
    blast_0209_dds305_qdr_lut_qdr0_data_valid => blast_0209_dds305_qdr_lut_qdr0_data_valid,
    blast_0209_dds305_qdr_lut_qdr0_phy_ready => blast_0209_dds305_qdr_lut_qdr0_phy_ready,
    blast_0209_dds305_qdr_lut_qdr1_ack => blast_0209_dds305_qdr_lut_qdr1_ack,
    blast_0209_dds305_qdr_lut_qdr1_cal_fail => blast_0209_dds305_qdr_lut_qdr1_cal_fail,
    blast_0209_dds305_qdr_lut_qdr1_data_out => blast_0209_dds305_qdr_lut_qdr1_data_out,
    blast_0209_dds305_qdr_lut_qdr1_data_valid => blast_0209_dds305_qdr_lut_qdr1_data_valid,
    blast_0209_dds305_qdr_lut_qdr1_phy_ready => blast_0209_dds305_qdr_lut_qdr1_phy_ready,
    blast_0209_dds305_qdr_lut_we_qdr_user_data_out => blast_0209_dds305_qdr_lut_we_qdr_user_data_out,
    blast_0209_dds305_rawfftbin_bram_data_out => blast_0209_dds305_rawfftbin_bram_data_out,
    blast_0209_dds305_rawfftbin_ctrl_user_data_out => blast_0209_dds305_rawfftbin_ctrl_user_data_out,
    blast_0209_dds305_rx_ack_user_data_out => blast_0209_dds305_rx_ack_user_data_out,
    blast_0209_dds305_rx_rst_user_data_out => blast_0209_dds305_rx_rst_user_data_out,
    blast_0209_dds305_start_dac_user_data_out => blast_0209_dds305_start_dac_user_data_out,
    blast_0209_dds305_sync_accum_len_user_data_out => blast_0209_dds305_sync_accum_len_user_data_out,
    blast_0209_dds305_sync_accum_reset_user_data_out => blast_0209_dds305_sync_accum_reset_user_data_out,
    blast_0209_dds305_tx_destip_user_data_out => blast_0209_dds305_tx_destip_user_data_out,
    blast_0209_dds305_tx_destport_user_data_out => blast_0209_dds305_tx_destport_user_data_out,
    blast_0209_dds305_tx_rst_user_data_out => blast_0209_dds305_tx_rst_user_data_out,
    ce => ce,
    clk => clk,
    blast_0209_dds305_accum_snap_bram_addr => blast_0209_dds305_accum_snap_bram_addr,
    blast_0209_dds305_accum_snap_bram_data_in => blast_0209_dds305_accum_snap_bram_data_in,
    blast_0209_dds305_accum_snap_bram_we => blast_0209_dds305_accum_snap_bram_we,
    blast_0209_dds305_accum_snap_status_user_data_in => blast_0209_dds305_accum_snap_status_user_data_in,
    blast_0209_dds305_adc_snap_bram_addr => blast_0209_dds305_adc_snap_bram_addr,
    blast_0209_dds305_adc_snap_bram_data_in => blast_0209_dds305_adc_snap_bram_data_in,
    blast_0209_dds305_adc_snap_bram_we => blast_0209_dds305_adc_snap_bram_we,
    blast_0209_dds305_adc_snap_status_user_data_in => blast_0209_dds305_adc_snap_status_user_data_in,
    blast_0209_dds305_dac_mkid1_dac_data_i0 => blast_0209_dds305_dac_mkid1_dac_data_i0,
    blast_0209_dds305_dac_mkid1_dac_data_i1 => blast_0209_dds305_dac_mkid1_dac_data_i1,
    blast_0209_dds305_dac_mkid1_dac_data_q0 => blast_0209_dds305_dac_mkid1_dac_data_q0,
    blast_0209_dds305_dac_mkid1_dac_data_q1 => blast_0209_dds305_dac_mkid1_dac_data_q1,
    blast_0209_dds305_dac_mkid1_dac_sync_i => blast_0209_dds305_dac_mkid1_dac_sync_i,
    blast_0209_dds305_dac_mkid1_dac_sync_q => blast_0209_dds305_dac_mkid1_dac_sync_q,
    blast_0209_dds305_dac_mkid1_not_reset => blast_0209_dds305_dac_mkid1_not_reset,
    blast_0209_dds305_fft_snap_bram_addr => blast_0209_dds305_fft_snap_bram_addr,
    blast_0209_dds305_fft_snap_bram_data_in => blast_0209_dds305_fft_snap_bram_data_in,
    blast_0209_dds305_fft_snap_bram_we => blast_0209_dds305_fft_snap_bram_we,
    blast_0209_dds305_fft_snap_status_user_data_in => blast_0209_dds305_fft_snap_status_user_data_in,
    blast_0209_dds305_mixerout_bram_addr => blast_0209_dds305_mixerout_bram_addr,
    blast_0209_dds305_mixerout_bram_data_in => blast_0209_dds305_mixerout_bram_data_in,
    blast_0209_dds305_mixerout_bram_we => blast_0209_dds305_mixerout_bram_we,
    blast_0209_dds305_mixerout_status_user_data_in => blast_0209_dds305_mixerout_status_user_data_in,
    blast_0209_dds305_one_gbe_app_rx_ack => blast_0209_dds305_one_gbe_app_rx_ack,
    blast_0209_dds305_one_gbe_app_rx_rst => blast_0209_dds305_one_gbe_app_rx_rst,
    blast_0209_dds305_one_gbe_app_tx_data => blast_0209_dds305_one_gbe_app_tx_data,
    blast_0209_dds305_one_gbe_app_tx_destip => blast_0209_dds305_one_gbe_app_tx_destip,
    blast_0209_dds305_one_gbe_app_tx_destport => blast_0209_dds305_one_gbe_app_tx_destport,
    blast_0209_dds305_one_gbe_app_tx_dvld => blast_0209_dds305_one_gbe_app_tx_dvld,
    blast_0209_dds305_one_gbe_app_tx_eof => blast_0209_dds305_one_gbe_app_tx_eof,
    blast_0209_dds305_one_gbe_app_tx_rst => blast_0209_dds305_one_gbe_app_tx_rst,
    blast_0209_dds305_overflow_user_data_in => blast_0209_dds305_overflow_user_data_in,
    blast_0209_dds305_qdr_lut_qdr0_address => blast_0209_dds305_qdr_lut_qdr0_address,
    blast_0209_dds305_qdr_lut_qdr0_be => blast_0209_dds305_qdr_lut_qdr0_be,
    blast_0209_dds305_qdr_lut_qdr0_data_in => blast_0209_dds305_qdr_lut_qdr0_data_in,
    blast_0209_dds305_qdr_lut_qdr0_rd_en => blast_0209_dds305_qdr_lut_qdr0_rd_en,
    blast_0209_dds305_qdr_lut_qdr0_wr_en => blast_0209_dds305_qdr_lut_qdr0_wr_en,
    blast_0209_dds305_qdr_lut_qdr1_address => blast_0209_dds305_qdr_lut_qdr1_address,
    blast_0209_dds305_qdr_lut_qdr1_be => blast_0209_dds305_qdr_lut_qdr1_be,
    blast_0209_dds305_qdr_lut_qdr1_data_in => blast_0209_dds305_qdr_lut_qdr1_data_in,
    blast_0209_dds305_qdr_lut_qdr1_rd_en => blast_0209_dds305_qdr_lut_qdr1_rd_en,
    blast_0209_dds305_qdr_lut_qdr1_wr_en => blast_0209_dds305_qdr_lut_qdr1_wr_en,
    blast_0209_dds305_rawfftbin_bram_addr => blast_0209_dds305_rawfftbin_bram_addr,
    blast_0209_dds305_rawfftbin_bram_data_in => blast_0209_dds305_rawfftbin_bram_data_in,
    blast_0209_dds305_rawfftbin_bram_we => blast_0209_dds305_rawfftbin_bram_we,
    blast_0209_dds305_rawfftbin_status_user_data_in => blast_0209_dds305_rawfftbin_status_user_data_in);
-- INST_TAG_END ------ End INSTANTIATION Template ------------
