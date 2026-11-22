module instMem (
  input  logic [31:0] i_addr,
  output logic [31:0] o_data
);

  logic [31:0] imem [8];

  initial begin
    $readmemh("../memory/InstMemData.txt", imem);
  end

  assign o_data = (i_addr[31:5] == 0) ? imem[i_addr[4:2]] : '0; 

endmodule