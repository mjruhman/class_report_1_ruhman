`timescale 1ns / 1ps

module rotator(
    input logic en,
    input logic cw,
    input logic clk,
    input logic rst,
    output logic [7:0] sseg,
    output logic [7:0] an
    );
    
    parameter N = 28;
    logic [N-1:0] q_reg;
    logic [N-1:0] q_next;
    
    // N-Bit counter 
    // register
    always_ff @(posedge clk, posedge rst)
        if(rst)
            q_reg <= 0;
        else
            q_reg <= q_next;

    //Next state logic
    //Increment if enable pin high, if not then it is just q_reg
    //I also need to determine incrementation by either cw or ccw
    assign q_next = en ? (cw ? q_reg + 1 : q_reg - 1) : q_reg;
    
    
    always_comb
        case(q_reg[N-1:N-3])
            3'b000:
                begin
                    an = 4'b0111;
                    sseg = 8'b10011100;
                end
            3'b001:
                begin
                    an = 4'b1011;
                    sseg = 8'b10011100;
                end
            3'b010:
                begin
                    an = 4'b1101;
                    sseg = 8'b10011100;
                end
            3'b011:
                begin
                    an = 4'b1110;
                    sseg = 8'b10011100;
                end
            3'b100:
                begin
                    an = 4'b1110;
                    sseg = 8'b10100011;
                end
            3'b101:
                begin
                    an = 4'b1101;
                    sseg = 8'b10100011;
                end
            3'b110:
                begin
                    an = 4'b1011;
                    sseg = 8'b10100011;
                end
            3'b111:
                begin
                    an = 4'b0111;
                    sseg = 8'b10100011;
                end  
        endcase
    assign an[7:4] = 4'b1111;
endmodule
