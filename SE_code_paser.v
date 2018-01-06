module test_delay(clk, out);

input clk;
output out;
reg out;
reg [3:0] count;

initial 
begin
	out = 0;
	count = 0;
end

always @ (posedge clk)
begin
	count = count + 1;
	if(count == 15)
	out = 1'b1;
end

endmodule
/////////////////////////////////////////////////////////////////
module code_paser
(
	clk, 
	code, 
	pc_fetch_done,
	code_paser_back_pressure
);

input clk;
input [15:0] code;
input pc_fetch_done;

output code_paser_back_pressure;

reg [15:0] fetch_code;
reg code_paser_back_pressure;

initial
begin
	code_paser_back_pressure = 1'b0;
end

always @ (posedge clk)
begin
	if (pc_fetch_done)
		fetch_code = code;
		code_paser_back_pressure = 1'b1;
		case (fetch_code)
		16'b0000000000000010 : $display("parse ok");  
		endcase
end


endmodule
