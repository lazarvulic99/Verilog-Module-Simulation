module stavka_b;

    reg [6:0] dut_data_in;
    reg dut_control;
    wire [7:0] dut_data_out;

    integer index;

    stavka_a dut(.data_in(dut_data_in), .control(dut_control), .data_out(dut_data_out));

    initial begin
        for (index = 0; index < 2 ** 8; index = index + 1) begin
            {dut_data_in, dut_control} = index;
            #5;
        end
        $finish;
    end

    always @(dut_data_out) begin
        $display("Time = %4d, dut_data_in = %b, dut_control = %b, dut_data_out = %b", $time, dut_data_in, dut_control, dut_data_out);
    end

endmodule