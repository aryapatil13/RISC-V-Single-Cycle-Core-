module alu(a, b, alucontrol, result, Z, N, V, C);
   input [31:0] a,b;
    input [2:0] alucontrol;

    output [31:0] result;
    output Z,N,V,C;

    wire [31:0] a_and_b;
    wire [31:0] a_or_b;
    wire [31:0] not_b;

    wire [31:0] mux_1;
    wire [31:0] sum;
    wire [31:0] mux_2;
    wire cout;
    wire [31:0] slt;
    

    assign a_and_b= a&b;

    assign a_or_b= a | b;

    assign not_b= ~b;
    assign mux_1= (alucontrol[0] == 1'b0) ? b: not_b;
    assign {cout,sum}= a+mux_1+alucontrol[0];

    assign slt={31'b0000000000000000000000000000000,sum[31]};

    assign mux_2 = (alucontrol[2:0]= 3'b000)? sum: 
                   (alucontrol[2:0]= 3'b001)? sum:
                   (alucontrol[2:0]= 3'b010)? a_and_b:
                   (alucontrol[2:0]= 3'b011)? a_or_b: 
                   (alucontrol[2:0]= 3'b101)? slt: 32'h00000000;
   
   assign result = mux_2;

   assign Z= &(~result);
   
   assign N= result[31];

   assign C= cout & (~alucontrol[1]);
    
   assign V= (~alucontrol[1]) & (a[31]^ sum) & (b[31]^a[31]^alucontrol[0]);


endmodule