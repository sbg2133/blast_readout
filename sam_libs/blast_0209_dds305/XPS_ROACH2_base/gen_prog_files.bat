copy implementation\system.bit ..\bit_files\blast_0209_dds305_2017_Mar_10_1128.bit
mkbof.exe -o implementation\system.bof -s core_info.tab -t 3 implementation\system.bin
copy implementation\system.bof ..\bit_files\blast_0209_dds305_2017_Mar_10_1128.bof
copy design_info.tab ..\bit_files\blast_0209_dds305_2017_Mar_10_1128.info
