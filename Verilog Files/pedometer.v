`include "ExBlock.v"
`include "controlUnit.v"
`include "instrDecode.v"
`include "instrFetch.v"
`include "regFile.v"
`include "writeBack.v"

module pedometer(
    clk, reset, countSteps, updateWeights, dualUpdateWeights, A, B, Addr1, Addr2, Data1, Data2, 
);
    input  clk;
    input  reset;
    input  countSteps;
    input  updateWeights;
    input  dualUpdateWeights;
    input  [7 :0] A, B; 
    input  [2 :0] Addr1, Addr2;
    input  [7 :0] Data1, Data2;

    
    

endmodule