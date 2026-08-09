module ProgramCounter (
  input  logic        clock ,
  input  logic        resetn,
  output logic [31:0] out
);

  always_ff @(posedge clock or negedge resetn) begin
    if (resetn == 1'b0) begin
      out <= 32'h0;
    end else begin
      out <= out + 32'h4;
    end
  end

endmodule // ProgramCounter