module MCPUtb();


reg reset, clk;


MCPU cpuinst (clk, reset);


initial begin
  reset=1;
  #10  reset=0;
end

always begin
  #5 clk=0; 
  #5 clk=1; 
end


/********OUR ASSEMBLER*****/

integer file, i;
reg[cpuinst.WORD_SIZE-1:0] memi;
parameter  [cpuinst.OPERAND_SIZE-1:0]  R0  = 0; //4'b0000
parameter  [cpuinst.OPERAND_SIZE-1:0]  R1  = 1; //4'b0001
parameter  [cpuinst.OPERAND_SIZE-1:0]  R2  = 2; //4'b0010
parameter  [cpuinst.OPERAND_SIZE-1:0]  R3  = 3; //4'b0011
parameter  [cpuinst.OPERAND_SIZE-1:0]  R4  = 4; //4'b0011
parameter  [cpuinst.OPERAND_SIZE-1:0]  R5  = 5;
parameter  [cpuinst.OPERAND_SIZE-1:0]  R6  = 6;
parameter  [cpuinst.OPERAND_SIZE-1:0]  R7  = 7;
parameter  [cpuinst.OPERAND_SIZE-1:0]  R8  = 8;
parameter  [cpuinst.OPERAND_SIZE-1:0]  R9  = 9;
parameter  [cpuinst.OPERAND_SIZE-1:0]  R10  = 10;
parameter  [cpuinst.OPERAND_SIZE-1:0]  R11  = 11;
parameter  [cpuinst.OPERAND_SIZE-1:0]  R12  = 12;
parameter  [cpuinst.OPERAND_SIZE-1:0]  R13  = 13;
parameter  [cpuinst.OPERAND_SIZE-1:0]  R14  = 14;
parameter  [cpuinst.OPERAND_SIZE-1:0]  R15  = 15;

 
initial
begin

    for(i=0;i<256;i=i+1)
    begin
      cpuinst.raminst.mem[i]=0;
    end
    cpuinst.regfileinst.R[0]=0;
    cpuinst.regfileinst.R[1]=0;
    cpuinst.regfileinst.R[2]=0;
    cpuinst.regfileinst.R[3]=0;
    cpuinst.regfileinst.R[4]=0;
    cpuinst.regfileinst.R[5]=0;
    cpuinst.regfileinst.R[6]=0;
    cpuinst.regfileinst.R[7]=0;
    cpuinst.regfileinst.R[8]=0;
    cpuinst.regfileinst.R[9]=0;
    cpuinst.regfileinst.R[10]=0;
    cpuinst.regfileinst.R[11]=0;
    cpuinst.regfileinst.R[12]=0;
    cpuinst.regfileinst.R[13]=0;
    cpuinst.regfileinst.R[14]=0;
    cpuinst.regfileinst.R[15]=0;

    


    // -------------- Keep the old code ---------------  //
    /*
                                                                               //memory address: instruction
    i=0;  cpuinst.raminst.mem[0]={cpuinst.OP_SHORT_TO_REG, R0, 8'b00000000};   //0: R0=0;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R1, 8'b00000001};   //1: R1=1;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R2, 8'b00000010};   //2: R2=2;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R4, 8'b00000001};   //3. R4=1;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R15, 8'b00000000};   //3. R15=0; 
                                                                               //do{
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_MOV, R0, R1, 4'b0000};            //  3: R1=R0;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_MOV, R1, R2, 4'b0000};            //  4: R1=R2;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R2, R0, R1};                 //  5: R2=R0+R1;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_STORE_TO_MEM, R2, 8'b00010100};   //  6:mem[20]=R2;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_LOAD_FROM_MEM, R3, 8'b00010100};  //  7:R3=mem[20];
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R0, R0, R0};                 //  8:R0=R0+R0
    
    // -------------- New tests ---------------  //                                      
    // Test 1 : Check if a the R3=mem[20] is odd or not//
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_XOR, R0, R0,8'b00000010};          //  8:R0=XOR(R0,2)=R0^2;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_AND, R10, R4, R3};                //  9:R10 = AND(R4,R3);
    // ADDITIONAL TESTS FOR BENCHMARK //
    
    if(R10 ==0) begin
      $display("Value is not odd");
      i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R15, R10, R4};                //  10:R15 = ADD(R10,R4);
      i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_STORE_TO_MEM, R15, 8'b01100100};   //  11:mem[100]=R10;
      i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_LOAD_FROM_MEM, R14, 8'b01100100};   //  12:R14=mem[100];
 
    end else begin
      $display("Value is odd");
      i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R15, R10, R3};                //  11:R15 = ADD(R10,R3);
      i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_STORE_TO_MEM, R15, 8'b01100101};   //  11:mem[101]=R10;
      i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_LOAD_FROM_MEM, R14, 8'b01100101};   //  12:R14=mem[101];
    end
    
                                                                               //}
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_BNZ, R2, 8'b00000011};
    */
    
    
    
    // ALREADY USED R1,R0,R2,R3,
    
    //--------------------------------------- Ask4.1----------------------------------------------//
    // the only way output = 1 , 
    /*
    i=0;cpuinst.raminst.mem[0]={cpuinst.OP_SHORT_TO_REG, R0, 8'b00000001};     //0: R0=1; A
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R1, 8'b00000001};   //1: R1=1; B 
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R2, 8'b00000000};   //3: R2=0; C    
    
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_AND, R3, R0, R1}; // D = R3 = AND(R0,R1)
    //i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_NOT, R4, R2};   //5.F=NOT(C)
    if(R2==0) begin
      i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R4, R2, 8'b00000001}; 
    end 
    else begin
      i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R4, R2, 8'b00000000};
    end
    // D = and(R11,R8)
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_AND, R5, R3, R4}; //D = R5 = AND(R3,R4)
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_STORE_TO_MEM, R5, 8'b01100100};   //  11:mem[100]=R5;
    */
    
    
    //--------------------------------------- Ask4.4b----------------------------------------------//    
    
    i=0;cpuinst.raminst.mem[0]={cpuinst.OP_SHORT_TO_REG, R0, 8'b00110000};     //0: 48
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_SHORT_TO_REG, R1, 8'b00100011};   //1: 35
     
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_STORE_TO_MEM, R0, 8'b01100100};   //mem[100] = 48 
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_STORE_TO_MEM, R1, 8'b01100101};   //mem[101] = 35
    
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_LOAD_FROM_MEM, R2, 8'b01100100};   //  12:R2=mem[4] = 48;
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_LOAD_FROM_MEM, R3, 8'b01100101};   //  12:R3=mem[5] =35;    
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_ADD,R4,R2,R3};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_XOR,R5,R2,R3};
    
    
    
    
    /*
    
    
    /*
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_XOR, R4, R2,R3};
    i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R5, R2, R4};
    //i=i+1;cpuinst.raminst.mem[i]={cpuinst.OP_ADD, R6, R5, R3};
    */
    file = $fopen("program.list","w");
    for(i=0;i<cpuinst.raminst.RAM_SIZE;i=i+1)
    begin
      memi=cpuinst.raminst.mem[i];
      
      $fwrite(file, "%b_%b_%b_%b\n", 
        memi[cpuinst.INSTRUCTION_SIZE-1:cpuinst.INSTRUCTION_SIZE-cpuinst.OPCODE_SIZE],
        memi[cpuinst.OPCODE_SIZE*3-1:2*cpuinst.OPCODE_SIZE],
        memi[cpuinst.OPCODE_SIZE*2-1:cpuinst.OPCODE_SIZE],
        memi[cpuinst.OPCODE_SIZE-1:0]);
    end
    $fclose(file);
    
end

endmodule
