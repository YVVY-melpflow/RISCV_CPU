module InstructionMemory (
  input  logic [31:0] i_addr,
  output logic [31:0] o_data
);

  parameter  DATA_NUM   = 8; // This value should be a power of 2.
  localparam ADDR_WIDTH = $clog2(DATA_NUM);

  logic [31:0] mem [DATA_NUM];

  initial begin
    $readmemh("../memory/imem.txt", mem);
  end

  assign o_data = (i_addr[31:(2 + ADDR_WIDTH)] == '0) ? mem[i_addr[2 +: ADDR_WIDTH]]
                                                      : 32'h0000_0000;

endmodule