`timescale 1ns / 1ps

module Decoder (
  input  logic [31:0] i_instr  ,
  output logic [ 4:0] o_rs1Addr,
  output logic [ 4:0] o_rdAddr ,
  output logic [31:0] o_imm
);

  assign o_rs1Addr = i_instr[19:15];
  assign o_rdAddr  = i_instr[11: 7];
  assign o_imm     = 32'(signed'(i_instr[31:20]));

endmodule