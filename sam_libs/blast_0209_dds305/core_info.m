% blast_0209_dds305/XSG_core_config
blast_0209_dds305_XSG_core_config_type         = 'xps_xsg';
blast_0209_dds305_XSG_core_config_param        = '';

% blast_0209_dds305/QDR_LUT/qdr0
blast_0209_dds305_QDR_LUT_qdr0_type         = 'xps_qdr';
blast_0209_dds305_QDR_LUT_qdr0_param        = '';
blast_0209_dds305_QDR_LUT_qdr0_addr_start   = hex2dec('0200_0000');
blast_0209_dds305_QDR_LUT_qdr0_addr_end     = hex2dec('027F_FFFF');

% blast_0209_dds305/QDR_LUT/qdr1
blast_0209_dds305_QDR_LUT_qdr1_type         = 'xps_qdr';
blast_0209_dds305_QDR_LUT_qdr1_param        = '';
blast_0209_dds305_QDR_LUT_qdr1_addr_start   = hex2dec('0280_0000');
blast_0209_dds305_QDR_LUT_qdr1_addr_end     = hex2dec('02FF_FFFF');

% blast_0209_dds305/QDR_LUT/we_qdr
blast_0209_dds305_QDR_LUT_we_qdr_type         = 'xps_sw_reg';
blast_0209_dds305_QDR_LUT_we_qdr_param        = 'in';
blast_0209_dds305_QDR_LUT_we_qdr_ip_name      = 'opb_register_ppc2simulink';
blast_0209_dds305_QDR_LUT_we_qdr_addr_start   = hex2dec('01000000');
blast_0209_dds305_QDR_LUT_we_qdr_addr_end     = hex2dec('010000FF');

% blast_0209_dds305/accum_snap/bram
blast_0209_dds305_accum_snap_bram_type         = 'xps_bram';
blast_0209_dds305_accum_snap_bram_param        = '2048';
blast_0209_dds305_accum_snap_bram_ip_name      = 'bram_if';
blast_0209_dds305_accum_snap_bram_addr_start   = hex2dec('01002000');
blast_0209_dds305_accum_snap_bram_addr_end     = hex2dec('01003FFF');

% blast_0209_dds305/accum_snap/ctrl
blast_0209_dds305_accum_snap_ctrl_type         = 'xps_sw_reg';
blast_0209_dds305_accum_snap_ctrl_param        = 'in';
blast_0209_dds305_accum_snap_ctrl_ip_name      = 'opb_register_ppc2simulink';
blast_0209_dds305_accum_snap_ctrl_addr_start   = hex2dec('01004000');
blast_0209_dds305_accum_snap_ctrl_addr_end     = hex2dec('010040FF');

% blast_0209_dds305/accum_snap/status
blast_0209_dds305_accum_snap_status_type         = 'xps_sw_reg';
blast_0209_dds305_accum_snap_status_param        = 'out';
blast_0209_dds305_accum_snap_status_ip_name      = 'opb_register_simulink2ppc';
blast_0209_dds305_accum_snap_status_addr_start   = hex2dec('01004100');
blast_0209_dds305_accum_snap_status_addr_end     = hex2dec('010041FF');

% blast_0209_dds305/adc_mkid
blast_0209_dds305_adc_mkid_type         = 'xps_adc_mkid';
blast_0209_dds305_adc_mkid_param        = '';
blast_0209_dds305_adc_mkid_ip_name      = 'adc_mkid_interface';

% blast_0209_dds305/adc_snap/bram
blast_0209_dds305_adc_snap_bram_type         = 'xps_bram';
blast_0209_dds305_adc_snap_bram_param        = '2048';
blast_0209_dds305_adc_snap_bram_ip_name      = 'bram_if';
blast_0209_dds305_adc_snap_bram_addr_start   = hex2dec('01006000');
blast_0209_dds305_adc_snap_bram_addr_end     = hex2dec('01007FFF');

% blast_0209_dds305/adc_snap/ctrl
blast_0209_dds305_adc_snap_ctrl_type         = 'xps_sw_reg';
blast_0209_dds305_adc_snap_ctrl_param        = 'in';
blast_0209_dds305_adc_snap_ctrl_ip_name      = 'opb_register_ppc2simulink';
blast_0209_dds305_adc_snap_ctrl_addr_start   = hex2dec('01008000');
blast_0209_dds305_adc_snap_ctrl_addr_end     = hex2dec('010080FF');

% blast_0209_dds305/adc_snap/status
blast_0209_dds305_adc_snap_status_type         = 'xps_sw_reg';
blast_0209_dds305_adc_snap_status_param        = 'out';
blast_0209_dds305_adc_snap_status_ip_name      = 'opb_register_simulink2ppc';
blast_0209_dds305_adc_snap_status_addr_start   = hex2dec('01008100');
blast_0209_dds305_adc_snap_status_addr_end     = hex2dec('010081FF');

% blast_0209_dds305/adc_snap_trig
blast_0209_dds305_adc_snap_trig_type         = 'xps_sw_reg';
blast_0209_dds305_adc_snap_trig_param        = 'in';
blast_0209_dds305_adc_snap_trig_ip_name      = 'opb_register_ppc2simulink';
blast_0209_dds305_adc_snap_trig_addr_start   = hex2dec('01008200');
blast_0209_dds305_adc_snap_trig_addr_end     = hex2dec('010082FF');

% blast_0209_dds305/bins
blast_0209_dds305_bins_type         = 'xps_sw_reg';
blast_0209_dds305_bins_param        = 'in';
blast_0209_dds305_bins_ip_name      = 'opb_register_ppc2simulink';
blast_0209_dds305_bins_addr_start   = hex2dec('01008300');
blast_0209_dds305_bins_addr_end     = hex2dec('010083FF');

% blast_0209_dds305/chan_select
blast_0209_dds305_chan_select_type         = 'xps_sw_reg';
blast_0209_dds305_chan_select_param        = 'in';
blast_0209_dds305_chan_select_ip_name      = 'opb_register_ppc2simulink';
blast_0209_dds305_chan_select_addr_start   = hex2dec('01008400');
blast_0209_dds305_chan_select_addr_end     = hex2dec('010084FF');

% blast_0209_dds305/dac_mkid1
blast_0209_dds305_dac_mkid1_type         = 'xps_dac_mkid';
blast_0209_dds305_dac_mkid1_param        = '';
blast_0209_dds305_dac_mkid1_ip_name      = 'dac_mkid_interface';

% blast_0209_dds305/dac_reset
blast_0209_dds305_dac_reset_type         = 'xps_sw_reg';
blast_0209_dds305_dac_reset_param        = 'in';
blast_0209_dds305_dac_reset_ip_name      = 'opb_register_ppc2simulink';
blast_0209_dds305_dac_reset_addr_start   = hex2dec('01008500');
blast_0209_dds305_dac_reset_addr_end     = hex2dec('010085FF');

% blast_0209_dds305/dds_shift
blast_0209_dds305_dds_shift_type         = 'xps_sw_reg';
blast_0209_dds305_dds_shift_param        = 'in';
blast_0209_dds305_dds_shift_ip_name      = 'opb_register_ppc2simulink';
blast_0209_dds305_dds_shift_addr_start   = hex2dec('01008600');
blast_0209_dds305_dds_shift_addr_end     = hex2dec('010086FF');

% blast_0209_dds305/fft_shift
blast_0209_dds305_fft_shift_type         = 'xps_sw_reg';
blast_0209_dds305_fft_shift_param        = 'in';
blast_0209_dds305_fft_shift_ip_name      = 'opb_register_ppc2simulink';
blast_0209_dds305_fft_shift_addr_start   = hex2dec('01008700');
blast_0209_dds305_fft_shift_addr_end     = hex2dec('010087FF');

% blast_0209_dds305/fft_snap/bram
blast_0209_dds305_fft_snap_bram_type         = 'xps_bram';
blast_0209_dds305_fft_snap_bram_param        = '1024';
blast_0209_dds305_fft_snap_bram_ip_name      = 'bram_if';
blast_0209_dds305_fft_snap_bram_addr_start   = hex2dec('01009000');
blast_0209_dds305_fft_snap_bram_addr_end     = hex2dec('01009FFF');

% blast_0209_dds305/fft_snap/ctrl
blast_0209_dds305_fft_snap_ctrl_type         = 'xps_sw_reg';
blast_0209_dds305_fft_snap_ctrl_param        = 'in';
blast_0209_dds305_fft_snap_ctrl_ip_name      = 'opb_register_ppc2simulink';
blast_0209_dds305_fft_snap_ctrl_addr_start   = hex2dec('0100A000');
blast_0209_dds305_fft_snap_ctrl_addr_end     = hex2dec('0100A0FF');

% blast_0209_dds305/fft_snap/status
blast_0209_dds305_fft_snap_status_type         = 'xps_sw_reg';
blast_0209_dds305_fft_snap_status_param        = 'out';
blast_0209_dds305_fft_snap_status_ip_name      = 'opb_register_simulink2ppc';
blast_0209_dds305_fft_snap_status_addr_start   = hex2dec('0100A100');
blast_0209_dds305_fft_snap_status_addr_end     = hex2dec('0100A1FF');

% blast_0209_dds305/load_bins
blast_0209_dds305_load_bins_type         = 'xps_sw_reg';
blast_0209_dds305_load_bins_param        = 'in';
blast_0209_dds305_load_bins_ip_name      = 'opb_register_ppc2simulink';
blast_0209_dds305_load_bins_addr_start   = hex2dec('0100A200');
blast_0209_dds305_load_bins_addr_end     = hex2dec('0100A2FF');

% blast_0209_dds305/mixerout/bram
blast_0209_dds305_mixerout_bram_type         = 'xps_bram';
blast_0209_dds305_mixerout_bram_param        = '32768';
blast_0209_dds305_mixerout_bram_ip_name      = 'bram_if';
blast_0209_dds305_mixerout_bram_addr_start   = hex2dec('01020000');
blast_0209_dds305_mixerout_bram_addr_end     = hex2dec('0103FFFF');

% blast_0209_dds305/mixerout/ctrl
blast_0209_dds305_mixerout_ctrl_type         = 'xps_sw_reg';
blast_0209_dds305_mixerout_ctrl_param        = 'in';
blast_0209_dds305_mixerout_ctrl_ip_name      = 'opb_register_ppc2simulink';
blast_0209_dds305_mixerout_ctrl_addr_start   = hex2dec('01040000');
blast_0209_dds305_mixerout_ctrl_addr_end     = hex2dec('010400FF');

% blast_0209_dds305/mixerout/status
blast_0209_dds305_mixerout_status_type         = 'xps_sw_reg';
blast_0209_dds305_mixerout_status_param        = 'out';
blast_0209_dds305_mixerout_status_ip_name      = 'opb_register_simulink2ppc';
blast_0209_dds305_mixerout_status_addr_start   = hex2dec('01040100');
blast_0209_dds305_mixerout_status_addr_end     = hex2dec('010401FF');

% blast_0209_dds305/one_GbE
blast_0209_dds305_one_GbE_type         = 'xps_onegbe';
blast_0209_dds305_one_GbE_param        = '';
blast_0209_dds305_one_GbE_ip_name      = 'gbe_udp';
blast_0209_dds305_one_GbE_addr_start   = hex2dec('01044000');
blast_0209_dds305_one_GbE_addr_end     = hex2dec('01047FFF');

% blast_0209_dds305/overflow
blast_0209_dds305_overflow_type         = 'xps_sw_reg';
blast_0209_dds305_overflow_param        = 'out';
blast_0209_dds305_overflow_ip_name      = 'opb_register_simulink2ppc';
blast_0209_dds305_overflow_addr_start   = hex2dec('01048000');
blast_0209_dds305_overflow_addr_end     = hex2dec('010480FF');

% blast_0209_dds305/pps
blast_0209_dds305_pps_type         = 'xps_gpio';
blast_0209_dds305_pps_param        = '';
blast_0209_dds305_pps_ip_name      = 'diffgpio_ext2simulink';

% blast_0209_dds305/pps_start
blast_0209_dds305_pps_start_type         = 'xps_sw_reg';
blast_0209_dds305_pps_start_param        = 'in';
blast_0209_dds305_pps_start_ip_name      = 'opb_register_ppc2simulink';
blast_0209_dds305_pps_start_addr_start   = hex2dec('01048100');
blast_0209_dds305_pps_start_addr_end     = hex2dec('010481FF');

% blast_0209_dds305/rawfftbin/bram
blast_0209_dds305_rawfftbin_bram_type         = 'xps_bram';
blast_0209_dds305_rawfftbin_bram_param        = '65536';
blast_0209_dds305_rawfftbin_bram_ip_name      = 'bram_if';
blast_0209_dds305_rawfftbin_bram_addr_start   = hex2dec('01080000');
blast_0209_dds305_rawfftbin_bram_addr_end     = hex2dec('010BFFFF');

% blast_0209_dds305/rawfftbin/ctrl
blast_0209_dds305_rawfftbin_ctrl_type         = 'xps_sw_reg';
blast_0209_dds305_rawfftbin_ctrl_param        = 'in';
blast_0209_dds305_rawfftbin_ctrl_ip_name      = 'opb_register_ppc2simulink';
blast_0209_dds305_rawfftbin_ctrl_addr_start   = hex2dec('010C0000');
blast_0209_dds305_rawfftbin_ctrl_addr_end     = hex2dec('010C00FF');

% blast_0209_dds305/rawfftbin/status
blast_0209_dds305_rawfftbin_status_type         = 'xps_sw_reg';
blast_0209_dds305_rawfftbin_status_param        = 'out';
blast_0209_dds305_rawfftbin_status_ip_name      = 'opb_register_simulink2ppc';
blast_0209_dds305_rawfftbin_status_addr_start   = hex2dec('010C0100');
blast_0209_dds305_rawfftbin_status_addr_end     = hex2dec('010C01FF');

% blast_0209_dds305/rx_ack
blast_0209_dds305_rx_ack_type         = 'xps_sw_reg';
blast_0209_dds305_rx_ack_param        = 'in';
blast_0209_dds305_rx_ack_ip_name      = 'opb_register_ppc2simulink';
blast_0209_dds305_rx_ack_addr_start   = hex2dec('010C0200');
blast_0209_dds305_rx_ack_addr_end     = hex2dec('010C02FF');

% blast_0209_dds305/rx_rst
blast_0209_dds305_rx_rst_type         = 'xps_sw_reg';
blast_0209_dds305_rx_rst_param        = 'in';
blast_0209_dds305_rx_rst_ip_name      = 'opb_register_ppc2simulink';
blast_0209_dds305_rx_rst_addr_start   = hex2dec('010C0300');
blast_0209_dds305_rx_rst_addr_end     = hex2dec('010C03FF');

% blast_0209_dds305/start_dac
blast_0209_dds305_start_dac_type         = 'xps_sw_reg';
blast_0209_dds305_start_dac_param        = 'in';
blast_0209_dds305_start_dac_ip_name      = 'opb_register_ppc2simulink';
blast_0209_dds305_start_dac_addr_start   = hex2dec('010C0400');
blast_0209_dds305_start_dac_addr_end     = hex2dec('010C04FF');

% blast_0209_dds305/sync/accum_len
blast_0209_dds305_sync_accum_len_type         = 'xps_sw_reg';
blast_0209_dds305_sync_accum_len_param        = 'in';
blast_0209_dds305_sync_accum_len_ip_name      = 'opb_register_ppc2simulink';
blast_0209_dds305_sync_accum_len_addr_start   = hex2dec('010C0500');
blast_0209_dds305_sync_accum_len_addr_end     = hex2dec('010C05FF');

% blast_0209_dds305/sync/accum_reset
blast_0209_dds305_sync_accum_reset_type         = 'xps_sw_reg';
blast_0209_dds305_sync_accum_reset_param        = 'in';
blast_0209_dds305_sync_accum_reset_ip_name      = 'opb_register_ppc2simulink';
blast_0209_dds305_sync_accum_reset_addr_start   = hex2dec('010C0600');
blast_0209_dds305_sync_accum_reset_addr_end     = hex2dec('010C06FF');

% blast_0209_dds305/tx_destip
blast_0209_dds305_tx_destip_type         = 'xps_sw_reg';
blast_0209_dds305_tx_destip_param        = 'in';
blast_0209_dds305_tx_destip_ip_name      = 'opb_register_ppc2simulink';
blast_0209_dds305_tx_destip_addr_start   = hex2dec('010C0700');
blast_0209_dds305_tx_destip_addr_end     = hex2dec('010C07FF');

% blast_0209_dds305/tx_destport
blast_0209_dds305_tx_destport_type         = 'xps_sw_reg';
blast_0209_dds305_tx_destport_param        = 'in';
blast_0209_dds305_tx_destport_ip_name      = 'opb_register_ppc2simulink';
blast_0209_dds305_tx_destport_addr_start   = hex2dec('010C0800');
blast_0209_dds305_tx_destport_addr_end     = hex2dec('010C08FF');

% blast_0209_dds305/tx_rst
blast_0209_dds305_tx_rst_type         = 'xps_sw_reg';
blast_0209_dds305_tx_rst_param        = 'in';
blast_0209_dds305_tx_rst_ip_name      = 'opb_register_ppc2simulink';
blast_0209_dds305_tx_rst_addr_start   = hex2dec('010C0900');
blast_0209_dds305_tx_rst_addr_end     = hex2dec('010C09FF');

% OPB to OPB bridge added at 0x1080000
OPB_to_OPB_bridge_added_at_0x1080000_type         = 'xps_opb2opb';
OPB_to_OPB_bridge_added_at_0x1080000_param        = '';

