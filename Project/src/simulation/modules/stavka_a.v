module stavka_a (
    input [6:0] data_in,
    input control,
    output reg [7:0] data_out
);

    integer index;
    integer brojac_nula;
    integer brojac_jedinica;
    reg info;

    always @(*) begin
        brojac_jedinica = 0;
        brojac_nula = 0;
        for (index = 0; index < 7; index = index + 1) begin
            if(data_in[index])
                brojac_jedinica = brojac_jedinica + 1;
            if(!data_in[index])
                brojac_nula = brojac_nula + 1;
        end
        if (!control) begin
            if (brojac_nula > brojac_jedinica)
                info = 1'b1;
            else if (brojac_jedinica > brojac_nula)
                info = 1'b0;
        end
        else if(control) begin
            if (brojac_nula > brojac_jedinica)
                info = 1'b0;
            else if (brojac_jedinica > brojac_nula)
                info = 1'b1;
        end
        data_out = {data_in[6:4], info, data_in[3:0]};

    end    
    
endmodule
