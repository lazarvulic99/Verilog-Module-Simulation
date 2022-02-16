module stavka_d;

    reg dut_rst_n;
    reg dut_clk;
    reg [3:0] dut_data_in;
    reg [2:0] dut_control;
    wire [3:0] dut_data_out;

    stavka_c dut(.rst_n(dut_rst_n), .clk(dut_clk), .data_in(dut_data_in), .control(dut_control), .data_out(dut_data_out));

    initial begin
        dut_rst_n = 1'b0;
        dut_clk = 1'b0;
    end

    initial begin
        dut_data_in = 4'h0;
        dut_control = 3'b000;
        #5 dut_rst_n = 1'b1;
        repeat (100) begin
            #12;
            dut_data_in = {$random} % 16;
            dut_control = {$random} % 8;
        end
        $finish;
    end

    initial begin
        $monitor("Time = %3d, dut_data_in = %b, dut_control = %b, dut_data_out = %b", $time, dut_data_in, dut_control, dut_data_out);
    end

    always #3 dut_clk = ~dut_clk;

endmodule
