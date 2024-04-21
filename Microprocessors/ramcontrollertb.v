
module ramcontrollertb;

  // Parameters
  parameter WORD_SIZE = 16;// Change the size 4835 > 8bit 
  parameter ADDR_WIDTH = 8;
  parameter RAM_SIZE = 1 << ADDR_WIDTH;

  // Signals
  reg we, re;
  reg [WORD_SIZE-1:0] datawr;
  reg [ADDR_WIDTH-1:0] addr, instraddr;
  wire [WORD_SIZE-1:0] datard, instrrd;
  reg [7:0] temp_value;
  reg [7:0] temp_value_insrtaddr;
  reg [WORD_SIZE-1:0] mem_copy[RAM_SIZE-1:0];
  integer i,j;
  // Instantiate the RAM controller
  MCPU_RAMController uut (
    .we(we),
    .datawr(datawr),
    .re(re),
    .addr(addr),
    .datard(datard),
    .instraddr(instraddr),
    .instrrd(instrrd)
  );
  initial begin 
    
    // 1. Test for Write//

    for (i=0;i<256;i=i+1)begin
      instraddr = 8'bx; //See the change in Simulation//
      #1;
      we=1;
      addr = i;
      datawr = $random;
      #1;
      we = 0;
      mem_copy[addr] = datawr;
    
    end
    we = 0;  
  end

    
    initial begin 
      #550; // Stop for 550ps in order to write all addresses and do then take from the memory 

      for (j=0;j<256;j=j+1)begin
      instraddr = 8'bx;
      re=0;
      #2;
      we=0; //Stop Writing in Ram//    
      re = 1;
      addr =j;
      temp_value = addr;
      #3;
      re=0;
      #3;
      instraddr = temp_value;
      #10;
      #1;
      if (datard !== mem_copy[j]) begin
      $display("Error at time %0t reading from memory %0d. Expected: %h, Actual: %h", $time, j, mem_copy[j], datard);
      end
    end 
  end

  /*
  // Initial block: initialize signals
  initial begin
    // Initialize signals
    for (i = 0;i<256;i = i+1) begin 
      #1
      we =1;
      addr = i;
      datawr = 4835;
      #1
      we=0;
    end

    for (j = 0;j<256;j = j+1) begin 
      #1
      re =1;
      addr = j;
      datawr = 4835;
      #1
      re=0;
    end
  end
  */
endmodule

  


