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

    wire reset;
    wire countSteps;
    wire updatedSteps;
    wire dualUpdateWeights;
    wire [31:0] instruction;
    wire [ 3:0] opcode;
    wire [ 7:0] A, B, Data1, Data2;
    wire [ 2:0] Addr1, Addr2;

    instrFetch IF(.clk(clk), .reset(reset), .countSteps(countSteps), .updateWeights(updateWeights), .dualUpdateWeights(dualUpdateWeights), .Addr1(Addr1), .Data1(Data1), .Addr2(Addr2), .Data2(Data2), .A(A), .B(B), .instruction(instruction));

    instrDecode ID(.instruction(instruction), .A(A), .B(B), .Addr1(Addr1), .Data1(Data1), .Addr2(Addr2), .Data2(Data2), .opcode(opcode));

    regFile rFile(.clk(clk), .reset(reset), .updateWeight(updateWeight), .());
    

endmodule