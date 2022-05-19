module controlUnit(opcode, updateWeight, updateTotalSteps, reset);
    input   [3:0] opcode;
    output  updateWeight;
    output  updateTotalSteps;
    output  reset;

    assign reset = (~opcode[2]) & (~opcode[3])
    assign updateWeight     =  opcode[1];
    assign updateTotalSteps = ~opcode[1];

endmodule