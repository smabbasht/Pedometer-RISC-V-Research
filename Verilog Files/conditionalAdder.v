module condAdder(step, A, totalSteps);
    input  step;
    input  [7:0] A;
    output [7:0] totalSteps;

    assign totalSteps = (step == 1'b1) ? (A+8'b1) : (A+8'b0);
endmodule