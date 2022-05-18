module adder(A, B, O);
    input      [7:0] A, B;
    output reg [7:0] O;

    assign O = A+B;
endmodule