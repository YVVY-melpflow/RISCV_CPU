module registerFile (
  input  logic        i_clock    ,
  input  logic        i_resetn   ,
  input  logic [4:0]  i_rs1Index ,
  input  logic [4:0]  i_rdIndex  ,
  input  logic [31:0] i_writeData,
  output logic [31:0] o_rs1Data
);

  logic [31:0] regFile [32];

  always_ff @(posedge i_clock or negedge i_resetn) begin
    if (i_resetn == 1'b0) begin
      for (int i = 0; i < 32; i++) begin
        regFile[i] <= '0;
      end
    end else begin
      regFile[i_rdIndex] <= i_writeData;
    end
  end

  assign o_rs1Data = (i_rs1Index == '0) ? '0 : regFile[i_rs1Index];

endmodule