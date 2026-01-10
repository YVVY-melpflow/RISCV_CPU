`timescale 1ns / 1ps

module GPRegister (
  input  logic        i_resetn ,
  input  logic [ 4:0] i_rs1Addr,
  output logic [31:0] o_rs1Data
);

  logic [31:0] GPRegister [0:31];

  integer i;
  always_ff @(negedge i_resetn) begin
    if (i_resetn == 1'b0) begin
      for (i = 0; i < 32; i = i + 1) begin
        GPRegister[i] <= 32'h0000_0000;
      end
    end
  end

  assign o_rs1Data = (i_rs1Addr == 5'h0) ? 32'h0000_0000
                                         : GPRegister[i_rs1Addr];

`ifdef LOG_GPR
  always @(i_rs1Addr) begin
    $strobe("At time %t, rs1(Addr) = %0d, rs1(Data) = 0x%8h", $time, i_rs1Addr, o_rs1Data);
  end
`endif

endmodule