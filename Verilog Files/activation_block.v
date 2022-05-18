module act_Block(value, S);
    input  [7:0] value;
    output S; // Final Boolean Output of Step;

    assign S = (value >= 8'd100) ? 1'b1 : 1'b0; // Any particular condition; we will overwrite it once we get a clearer view of outputs
endmodule