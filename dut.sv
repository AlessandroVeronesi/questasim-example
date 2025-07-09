
`define BW 4

module counter
    (
        CLK,
        RST,
        OUT
    );

input logic CLK, RST;
output logic OUT;

logic [`BW-1:0] value, value_w;
logic out_w;

always_ff @( posedge CLK ) begin : reg_0
    if(RST) begin
        value <= ~(`BW'b0);
        OUT   <= 1'b0;
    end else begin
        value <= value_w;
        OUT   <= out_w;
    end
end

always_comb begin : comb_0
    if(value == 0) begin
        value_w <= ~(`BW'b0);
        out_w   <= ~OUT;
    end else begin
        value_w <= value - `BW'b1;
    end
end

endmodule