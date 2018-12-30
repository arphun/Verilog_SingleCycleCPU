module ALU_Control(funct_i, ALUOp_i, ALUCtrl_o);
    
input [31:0] funct_i;
input [1:0] ALUOp_i;
output [2:0] ALUCtrl_o;
    
reg [2:0] tmp;
assign ALUCtrl_o = tmp;
    
always@(funct_i or ALUOp_i)
begin
    if(ALUOp_i == 2'b01) // addi
        begin
            tmp = 3'b001;
        end

    if(funct_i[31:25] == 7'b0000000)
        begin
            if(funct_i[14:12] == 3'b000)//ADD
                begin
                    tmp = 3'b001;
                end
            else if(funct_i[14:12] == 3'b110) //OR
                begin
                    tmp = 3'b100;
                end
            else if(funct_i[14:12] == 3'b111) //AND
                begin
                    tmp = 3'b011;
                end
        end
    else if(funct_i[31:25] == 7'b0100000)//SUB
        begin
            tmp = 3'b010;
        end
    else if(funct_i[31:25] == 7'b0000001)//MULT
        begin
            tmp = 3'b101;
        end
end
endmodule
