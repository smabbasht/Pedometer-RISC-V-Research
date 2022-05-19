`include "conditionalAdder.v"

module writeBack(step, writeTotalSteps, totalSteps, updTotalSteps);
    input  step;
    input  writeTotalSteps;
    input  [7:0] totalSteps;
    output [7:0] updTotalSteps;

    wire ANDout;

    assign ANDout = step & writeTotalSteps;
    condAdder cAdd1(.step(ANDout), .A(totalSteps), .totalSteps(updTotalSteps));

endmodule