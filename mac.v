`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////

module mac#(
    parameter DATA_WIDTH = 2,
              OUT_WIDTH = 4
)(  
        input clk,
        input [DATA_WIDTH  - 1: 0] a,
        input [DATA_WIDTH  - 1: 0] b,
        input [DATA_WIDTH  - 1: 0] c,
        output reg [OUT_WIDTH-1: 0] out,
        input reset
    );
    
    always @(posedge clk) begin
    if(reset==0)
        begin
            out <= a * b + c;
        end
    end
    
endmodule
