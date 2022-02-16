module stavka_c (
    input rst_n,
    input clk,
    input [3:0] data_in,
    input [2:0] control,
    output [3:0] data_out
);

    reg [3:0] data_out_next, data_out_reg;
    assign data_out = data_out_reg;

    reg [3:0] opr;

    always @(posedge clk, negedge rst_n) begin
        if (!rst_n)
            data_out_reg <= 4'h0;
        else
            data_out_reg <= data_out_next;
    end

    always @(*) begin
        opr = 4'h0;
        data_out_next = data_out_reg;
        if (control[0]) begin
            if (!control[1])
                opr = data_in;
            else if(control[1])
                opr = 2*data_in;
            if (!control[2])
                data_out_next = opr;
            else if(control[2])
                data_out_next = data_out_reg + 1;
        end
    end
    
endmodule
