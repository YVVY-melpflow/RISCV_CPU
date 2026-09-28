module GeneralRegister (
  input  logic        i_resetn,
  input  logic [ 4:0] i_rs1_index,
  output logic [31:0] o_rs1_data
);

  logic [31:0] gReg [32];
  always_ff @(negedge i_resetn) begin
    if (i_resetn == 1'b0) begin
      foreach(gReg[i]) gReg[i] <= 0;
    end
  end

  assign o_rs1_data = (i_rs1_index != 'h0) ? gReg[i_rs1_index] 
                                           : 'h0000_0000;

endmodule // ProgramCounter