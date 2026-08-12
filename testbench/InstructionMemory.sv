module InstructionMemory (
  input  logic [31:0] addr,
  output logic [31:0] data
);

  // 1KB (4byte x 256)
  logic [31:0] mem [0:255];

  initial begin
    $readmemh("../memory/imem.txt", mem);
  end

  assign data = (addr[31:10] == 22'h0) ? mem[addr[9:2]]
                                       : 32'h0000_0000;

endmodule