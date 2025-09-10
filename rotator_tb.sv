module rotator_tb;

parameter N = 4;
logic en;
logic cw;
logic clk;
logic rst;
logic [7:0] sseg;
logic [7:0] an;

rotator#(.N(N)) dut(
    .en(en),
    .cw(cw),
    .clk(clk),
    .rst(rst),
    .sseg(sseg),
    .an(an)
    );

    initial begin
        clk = 0;
        forever 
            #5 clk = ~clk;
    end
    
    initial begin
        cw = 1;
        en = 0;
        rst = 0;
        #20 en = 1;
        #20 rst = 1;
        #20 rst = 0;
        #200 cw = 0;
        #200;
        $finish;
    end




endmodule
