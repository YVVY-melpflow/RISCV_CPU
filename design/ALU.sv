`timescale 1ns / 1ps

module ALU (
  input  logic [31:0] i_inA   ,
  input  logic [31:0] i_inB   ,
  output logic [31:0] o_result
);

assign o_result = i_inA + i_inB;

endmodule