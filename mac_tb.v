`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
 
//////////////////////////////////////////////////////////////////////////////////


module mac_tb#(
    parameter DATA_WIDTH = 2,
              OUT_WIDTH = 4
)(

    );
    
   //Signals Instantiation 
   reg clk;
   reg reset;
   reg [DATA_WIDTH  - 1: 0] a;
   reg [DATA_WIDTH  - 1: 0] b;
   reg [DATA_WIDTH  - 1: 0] c;
   wire [OUT_WIDTH-1: 0] out;
   
   
   //Module instantiation
   mac#(
            .DATA_WIDTH(DATA_WIDTH),
            .OUT_WIDTH(OUT_WIDTH)
) mac_dut(  
        .clk(clk), .a(a), .b(b), .c(c), .out(out), .reset(reset)
         );
    
   
   always #5 clk = ~clk;
   
   initial
   begin
    clk = 0;
    reset = 0;
    a = 0;
    b = 0;
    c = 0;
    
 
    
    #5
    a = 2'b11;  
    b = 2'b01; 
    c = 2'b11; //expected out = 3*1 + 3 =6
        
    #10
    a = 2'b01;  
    b = 2'b11; 
    c = 2'b00; //expected out = 1*3 + 0 = 3 
    
    #10
    a = 2'b01;  
    b = 2'b01; 
    c = 2'b01; //expected out = 1*1+1=2 (7A)
    
    #10
    a = 2'b11;  
    b = 2'b11; 
    c = 2'b11; //expected out = 3*3+3=12
    
   end
    
    
endmodule
