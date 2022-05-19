`include "ExBlock.v"
`include "controlUnit.v"
`include "instrDecode.v"
`include "instrFetch.v"
`include "regFile.v"
`include "writeBack.v"

module pedometer(
    clk, reset, countSteps, updateWeight, dualUpdateWeights, A, B, Addr1, Addr2, Data1, Data2, 
);
    input  clk;
    input  reset;
    input  countSteps;
    input  updateWeight;
    input  dualUpdateWeights;
    input  [7 :0] A, B; 
    input  [2 :0] Addr1, Addr2;
    input  [7 :0] Data1, Data2;

    wire step;
    wire reset;
    wire countSteps;
    wire updateWeight;
    wire updatedSteps;
    wire updateTotalSteps;
    wire dualUpdateWeights;
    wire [ 3:0] opcode;
    wire [31:0] instruction;
    wire [ 2:0] Addr1, Addr2;
    wire [ 7:0] A, B, Data1, Data2, totalSteps, updatedTotalSteps;
    wire [ 7:0] theta1, theta2, beta1, beta2, alpha1, alpha2;

    instrFetch IF(.clk(clk), .reset(reset), .countSteps(countSteps), .updateWeights(updateWeights), .dualUpdateWeights(dualUpdateWeights), .Addr1(Addr1), .Data1(Data1), .Addr2(Addr2), .Data2(Data2), .A(A), .B(B), .instruction(instruction));

    instrDecode ID(.instruction(instruction), .A(A), .B(B), .Addr1(Addr1), .Data1(Data1), .Addr2(Addr2), .Data2(Data2), .opcode(opcode));

    controlUnit CU(.opcode(opcode), .updateWeight(updateWeight), .updateTotalSteps(updateTotalSteps), .reset(reset));

    regFile rFile(.clk(clk), .reset(reset), .updateWeight(updateWeight), .updateTotalSteps(updateTotalSteps), .totalSteps(totalSteps), .Addr1(Addr1), .Data1(Data1), .Addr2(Addr2), .Data2(Data2), 
    .theta1(theta1), .theta2(theta2), .beta1(beta1), .beta2(beta2), .alpha1(alpha1), .alpha2(alpha2));

    ExBlock EX(.clk(clk), .A(A), .B(B), .step(step), .theta1(theta1), .theta2(theta2), .beta1(beta1), .beta2(beta2), .alpha1(alpha1), .alpha2(alpha2));

    writeBack WB(.step(step), .writeTotalSteps(writeTotalSteps), .totalSteps(totalSteps), .updatedTotalSteps(updatedTotalSteps));
endmodule