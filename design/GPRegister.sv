`timescale 1ns / 1ps

module GPRegister (
  input  logic        i_clock  ,
  input  logic        i_resetn ,
  input  logic [ 4:0] i_rs1Addr,
  output logic [31:0] o_rs1Data,
  input  logic [ 4:0] i_rdAddr ,
  input  logic [31:0] i_rdData
);

  logic [31:0] GPRegister [0:31];

  integer i;
  always_ff @(posedge i_clock or negedge i_resetn) begin
    if (i_resetn == 1'b0) begin
      for (i = 0; i < 32; i = i + 1) begin
        GPRegister[i] <= 32'h0000_0000;
      end
    end else begin
      if (i_rdAddr != 5'h0) begin
        GPRegister[i_rdAddr] <= i_rdData;
      end
    end
  end

  assign o_rs1Data = (i_rs1Addr == 5'h0) ? 32'h0000_0000
                                         : GPRegister[i_rs1Addr];

endmodule