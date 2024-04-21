module MCPU_Alutb();

parameter CMD_SIZE=2;
parameter WORD_SIZE=8;

reg [CMD_SIZE-1:0] opcode;
reg [WORD_SIZE-1:0] r1;
reg [WORD_SIZE-1:0] r2;
wire [WORD_SIZE*2-1:0] out;
wire OVERFLOW;

MCPU_Alu #(.CMD_SIZE(CMD_SIZE), .WORD_SIZE(WORD_SIZE)) aluinst (opcode, r1, r2, out, OVERFLOW);

// Testbench code goes here
/*
AM:4630 AND AM:4835
*/
always 
begin
#3 r1 = 4; #3 r1 = 6; #3 r1 = 3; #3 r1 = 0;
end
 
always 
begin
#3 r2 = 4; #3 r2 = 6; #3 r2 = 3; #3 r2 = 0;
end

always #2 opcode[0] = $random;
always #2 opcode[1] = $random;

initial begin
  $display("@%0dns default is selected, opcode %b",$time,opcode);
end


endmodule
