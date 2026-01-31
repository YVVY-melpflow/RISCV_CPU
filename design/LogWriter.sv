`timescale 1ns / 1ps
`include "CPU.svh"

module LogWriter (
  input  logic        i_clock   ,
  input  logic        i_resetn  ,
  input  logic [31:0] i_PC      ,
  input  logic [31:0] i_imemAddr,
  input  logic [31:0] i_imemData,
  input  logic [31:0] i_instr   ,
  input  logic [ 4:0] i_rs1Addr ,
  input  logic [31:0] i_rs1Data ,
  input  logic [31:0] i_inA     ,
  input  logic [31:0] i_inB     ,
  input  logic [31:0] i_result
);

  integer cycle_count;

  always @(posedge i_clock or negedge i_resetn) begin
    if (!i_resetn) begin
      cycle_count <= 0;
    end else begin
      $write("At time %04d ns : ", $time);
      cycle_count <= cycle_count + 1;
    end
  end
  
  always @(posedge i_resetn) begin
    $write("At time %04d ns : ", $time);
    write_log(
      cycle_count,
      i_PC       ,
      i_imemAddr ,
      i_imemData ,
      i_instr    ,
      i_rs1Addr  ,
      i_rs1Data  ,
      i_inA      ,
      i_inB      ,
      i_result
    );
  end

  always @(negedge i_clock) begin
    write_log(
      cycle_count,
      i_PC       ,
      i_imemAddr ,
      i_imemData ,
      i_instr    ,
      i_rs1Addr  ,
      i_rs1Data  ,
      i_inA      ,
      i_inB      ,
      i_result
    );
  end

  task write_log (
    int          cycle_count,
    logic [31:0] i_PC       ,
    logic [31:0] i_imemAddr ,
    logic [31:0] i_imemData ,
    logic [31:0] i_instr    ,
    logic [ 4:0] i_rs1Addr  ,
    logic [31:0] i_rs1Data  ,
    logic [31:0] i_inA      ,
    logic [31:0] i_inB      ,
    logic [31:0] i_result
  );
    $display("Cycle %0d :", cycle_count);
`ifdef LOG_PC
    $display("    PC = 0x%08h", i_PC);
`endif
`ifdef LOG_IMEM
    $display("    IMEM[0x%08h] = 0x%08h", i_imemAddr, i_imemData);
`endif
`ifdef LOG_DECODER
    write_decode_log(i_instr);
`endif
`ifdef LOG_GPR
    $display("    GPR :");
    $display("        rs1 : GPR[x%0d] = 0x%08h", i_rs1Addr, i_rs1Data);
`endif
`ifdef LOG_ALU
    $display("    ALU :");
    $display("        inA : 0x%08h", i_inA);
    $display("        inB : 0x%08h", i_inB);
    $display("        result = inA + inB = 0x%08h", i_result);
`endif
  endtask

  task write_decode_log (logic [31:0] i_instr);
    logic        [ 4:0] rs1Addr;
    logic        [ 4:0] rdAddr;
    logic signed [31:0] simm;

    assign rs1Addr = i_instr[19:15];
    assign rdAddr  = i_instr[11: 7];
    assign simm    = signed'(i_instr[31:20]);

    if (i_instr[6:0] == 7'b0010011 && i_instr[14:12] == 3'b000) begin
      $display("    Instruction : ADDI x%0h, x%0h, %0d", rdAddr, rs1Addr, simm);
    end 
    else begin
      $display("    Instruction : Unknown Instruction");
    end
  endtask
endmodule