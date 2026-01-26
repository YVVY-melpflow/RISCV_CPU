`timescale 1ns / 1ps

module ALU (
  input  logic [31:0] i_inA   ,
  input  logic [31:0] i_inB   ,
  output logic [31:0] o_result
);

assign o_result = i_inA + i_inB;

`ifdef LOG_ALU
  always @(i_inA or i_inB) begin
    $strobe("At time %t, inA = 0x%8h, inB = 0x%8h, result = 0x%8h",
      $time,
      i_inA,
      i_inB,
      o_result
    );
  end
`endif

endmodule