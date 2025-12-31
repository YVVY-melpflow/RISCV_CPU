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

`ifdef LOG_DECODER
  logic signed [31:0] simm;
  assign simm = signed'(o_imm);
  
  always @(i_instr) begin
    if (i_instr[6:0] == 7'b0010011 && i_instr[14:12] == 3'b000) begin
      $strobe("At time %t, ADDI x%0h, x%0h, %0d", $time, o_rdAddr, o_rs1Addr, simm);
    end else begin
      $strobe("At time %t, Unknown Instruction", $time);
    end
  end
`endif

endmodule