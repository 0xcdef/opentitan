# Copyright 2022 ETH Zurich and University of Bologna.
# Solderpad Hardware License, Version 0.51, see LICENSE for details.
# SPDX-License-Identifier: SHL-0.51

vsim testbench_preload -t 1ps -coverage -voptargs=+acc -classdebug -suppress 3999 -suppress 8360 \
    -do "set StdArithNoWarnings 1; set NumericStdNoWarnings 1; log -r /*; run -all;" \
     +SRAM=../sw/tests/opentitan/preboot_code_hello/preboot_code_hello.elf -sv_lib work-dpi/ariane_dpi