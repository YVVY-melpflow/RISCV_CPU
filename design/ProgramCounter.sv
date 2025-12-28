`timescale 1ns / 1ps

module ProgramCounter (
  input  logic        i_clock,
  input  logic        i_resetn,
  output logic [31:0] o_PC
);

  always_ff @(posedge i_clock or negedge i_resetn) begin
    if (i_resetn == 1'b0) begin
      o_PC <= 32'h0000_0000;
    end else begin
      o_PC <= o_PC + 32'h4;
    end
  end

`ifdef LOG_PC
  always @(posedge i_clock) begin
    $write ("At time %t, PC = 0x%8h -> ", $time, o_PC);
    $strobe("0x%8h", o_PC);
  end
`endif

endmodule