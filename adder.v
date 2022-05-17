module adder(A, B, O);
    input  [9: 0] A, B;
    output [9: 0] O;

    assign O = A+B;
endmodule