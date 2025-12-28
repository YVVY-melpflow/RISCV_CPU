`timescale 1ns / 1ps

module InstructionMemory (
  input  logic [31:0] i_addr,
  output logic [31:0] o_data
);

  // 4byte x 256 = 1KB
  logic [31:0] mem [0:255];

  initial begin
    $readmemh("../mem/imem.txt", mem);
  end

  assign o_data = (i_addr[31:10] == 22'h0) ? mem[i_addr[9:2]]
                                           : 32'h0000_0000;

endmodule