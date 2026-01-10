`timescale 1ns / 1ps
`include "CPU.svh"

module CPU (
  input  logic i_clock,
  input  logic i_resetn,

  input  logic [31:0] i_imemData,
  output logic [31:0] o_imemAddr
);

  logic [31:0] w_PC     ;
  logic [ 4:0] w_rs1Addr;
  logic [31:0] w_rs1Data;
  logic [ 4:0] w_rdAddr ;
  logic [31:0] w_imm    ;

  ProgramCounter ProgramCounter (
    .i_clock  (i_clock ),
    .i_resetn (i_resetn),
    .o_PC     (w_PC    )
  );

  assign o_imemAddr = w_PC;

  Decoder Decoder (
    .i_instr  (i_imemData),
    .o_rs1Addr(w_rs1Addr ),
    .o_rdAddr (w_rdAddr  ),
    .o_imm    (w_imm     )
  );

  GPRegister GPRegister (
    .i_resetn (i_resetn  ),
    .i_rs1Addr(w_rs1Addr ),
    .o_rs1Data(w_rs1Data )
  );

`ifdef LOG_IMEM
  always @(o_imemAddr) begin
    $strobe("At time %t, addr = 0x%8h, data = 0x%8h", $time, o_imemAddr, i_imemData);
  end
`endif

endmodule