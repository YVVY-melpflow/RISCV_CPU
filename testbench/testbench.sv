module CPU_tb;

  logic        clock ;
  logic        resetn;
  logic [31:0] cpuInstAddr;
  logic [31:0] imemData;

  CPU myCPU(
    .clock (clock ),
    .resetn(resetn),
    .instAddr(cpuInstAddr),
    .instData(imemData)
  );

  InstructionMemory imem(
    .addr(cpuInstAddr),
    .data(imemData)
  );


  initial begin
    $dumpfile("CPU_tb.vcd");
    $dumpvars;
  end

  initial begin
        clock = 1'b0; resetn = 1'b1;
    #15 clock = 1'b0; resetn = 1'b0;
    #15 clock = 1'b0; resetn = 1'b1;
    #20 clock = 1'b1; resetn = 1'b1;
    forever begin
      #5 clock = ~clock;
    end
  end

  initial begin
    #1000
    $finish();
  end

endmodule // CPU_testbench