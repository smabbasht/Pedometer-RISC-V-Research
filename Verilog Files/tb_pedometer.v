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
      reset = 1'b0; countSteps = 1'b1; updateWeight = 1'b0; dualUpdateWeights = 1'b0;
      A = 8'd30; B = 8'd30; Addr1 = 3'b0; Addr2 = 3'b0; Data1 = 8'b0; Data2 =8'b0;
      #5
      reset = 1'b0; countSteps = 1'b1; updateWeight = 1'b0; dualUpdateWeights = 1'b0;
      A = 8'd10; B = 8'd10; Addr1 = 3'b0; Addr2 = 3'b0; Data1 = 8'b0; Data2 =8'b0;
      #5
      reset = 1'b0; countSteps = 1'b1; updateWeight = 1'b0; dualUpdateWeights = 1'b0;
      A = 8'd0; B = 8'd0; Addr1 = 3'b0; Addr2 = 3'b0; Data1 = 8'b0; Data2 =8'b0;
      #5
      reset = 1'b1; countSteps = 1'b1; updateWeight = 1'b0; dualUpdateWeights = 1'b0; // Reset = 1
      A = 8'd30; B = 8'd30; Addr1 = 3'b0; Addr2 = 3'b0; Data1 = 8'b0; Data2 =8'b0;
      #5
      reset = 1'b0; countSteps = 1'b0; updateWeight = 1'b1; dualUpdateWeights = 1'b0; // Reset = 0; updateWeight = 1; dualUpdate = 0
      A = 8'd30; B = 8'd30; Addr1 = 3'd1; Addr2 = 3'b0; Data1 = 8'd5; Data2 =8'b0; // Addr1 = 1; Data1 = 8'd5;
      #5
      clk = 1'b0; reset = 1'b0; countSteps = 1'b1; updateWeight = 1'b0; dualUpdateWeights = 1'b0; // Reset = 0; updateWeight = 1; dualUpdate = 1
      A = 8'd30; B = 8'd30; Addr1 = 3'd1; Addr2 = 3'd2; Data1 = 8'd5; Data2 =8'd6; // Addr1 = 1; Data1 = 8'd5; Addr = 2; Data2 = 8'd6
      #5
      clk = 1'b0; reset = 1'b0; countSteps = 1'b1; updateWeight = 1'b0; dualUpdateWeights = 1'b0; // Dummy Case
      A = 8'd30; B = 8'd30; Addr1 = 3'b0; Addr2 = 3'b0; Data1 = 8'b0; Data2 =8'b0;
    end    
    
    always  #5 clk = ~clk; 

    initial begin
        $dumpfile("pedometer.vcd");
        $dumpvars();
        #200 $finish;
    end

endmodule