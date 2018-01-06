module SE_core(clk,code);

input clk;
output code;
code_paser code_paser_i1(.clk(clk), .code(code));

endmodule
