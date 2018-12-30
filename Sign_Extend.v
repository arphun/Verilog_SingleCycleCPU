module Sign_Extend(data_i, data_o);
input [31:0] data_i;
output [31:0] data_o;
wire  [31:0] tmp;
assign data_o = {{20{data_i[31]}},{data_i[31:20]}};
endmodule
