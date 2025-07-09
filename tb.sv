`default_nettype none

module tb;

logic clk;
logic rst;
logic out;

localparam SIMTIME = 100;

localparam CLK_PERIOD = 10;
always #(CLK_PERIOD/2) clk=~clk;

initial begin
    clk <= 1'b0;
    rst <= 1'b1;
    #(CLK_PERIOD*3) rst<=1;
    rst <= 1'b0;
    repeat(SIMTIME) @(posedge clk);
    $display("finish!!!");
    $finish(2);
end

counter dut(
    .CLK(clk),
    .RST(rst),
    .OUT(out)
);

always @(out) begin
    $display("out triggered");
end

endmodule