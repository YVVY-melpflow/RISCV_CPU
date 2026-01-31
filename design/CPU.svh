`ifndef _CPU_SVH_
`define _CPU_SVH_

// シミュレーション設定
`define LOG_OUT

`ifdef LOG_OUT
  `define LOG_PC
  `define LOG_IMEM
  `define LOG_DECODER
  `define LOG_GPR
  `define LOG_ALU
`endif

`endif // _CPU_SVH_