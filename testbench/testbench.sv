module CPU_tb;

  logic        clock      ;
  logic        resetn     ;
  logic [31:0] cpuInstAddr;
  logic [31:0] imemData   ;

  CPU myCPU(
    .i_clock   (clock      ),
    .i_resetn  (resetn     ),
    .i_instData(imemData   ),
    .o_instAddr(cpuInstAddr)
  );

  InstructionMemory imem(
    .i_addr(cpuInstAddr),
    .o_data(imemData   )
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