module instrDecode(instruction, A, B, Addr1, Addr2, Data1, Data2, opcode);
    input  [31:0] instruction;
    output [7 :0] A, B;
    output [2 :0] Addr1, Addr2;
    output [7 :0] Data1, Data2;
    output [3 :0] opcode;

    assign A      = instruction[11: 4];
    assign B      = instruction[19:12];
    assign Addr1  = instruction[ 6: 4];
    assign Data1  = instruction[14: 7];
    assign Addr2  = instruction[17:15];
    assign Data2  = instruction[25:18];
    assign opcode = instruction[ 3: 0];
endmodule