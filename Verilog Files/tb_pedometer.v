`include "pedometer.v"
`timescale 1ns/1ns

module tb();

    reg  clk;
    reg  reset;
    reg  countSteps;
    reg  updateWeight;
    reg  dualUpdateWeights;
    reg  [7 :0] A, B; 
    reg  [2 :0] Addr1, Addr2;
    reg  [7 :0] Data1, Data2;

    pedometer Ped(.clk(clk), .reset(reset), .countSteps(countSteps), .updateWeight(updateWeight), .dualUpdateWeights(dualUpdateWeights), 
    .A(A), .B(B), .Addr1(Addr1), .Addr2(Addr2), .Data1(Data1), .Data2(Data2));

    initial begin
      clk = 1'b0;
      reset = 1'b0;
    end    
    
    always  #5 clk = ~clk; 

    initial begin
        $dumpfile("pedometer.vcd");
        $dumpvars();
        #200 $finish;
    end

endmodule