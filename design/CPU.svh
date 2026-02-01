`ifndef _CPU_SVH_
`define _CPU_SVH_

// シミュレーション設定
`define LOG_TEST

`ifdef LOG_TEST
`define LOG_OUT
`endif

`define LOG_PC
`define LOG_IMEM
`define LOG_DECODER
`define LOG_GPR
`define LOG_ALU

`endif // _CPU_SVH_