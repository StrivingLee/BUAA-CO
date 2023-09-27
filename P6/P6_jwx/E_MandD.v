module E_MandD (
    input clk,
    input reset,
    input [31: 0] NUM1,
    input [31: 0] NUM2,
    input [3: 0] mdop,
    input start,

    output reg busy,
    output [31: 0] MDhi,
    output [31: 0] MDlo
);

    reg [31: 0] HI, LO;

    reg [3: 0] cnt;
    reg [63: 0] temp;
    reg [31: 0] tempHI, tempLO;

    assign MDhi = HI;
    assign MDlo = LO;

    always @(*) begin
        if (cnt == 0) begin
            case (mdop)
                4'd1: begin
                    temp = ($signed(NUM1) * $signed(NUM2));
                    tempHI = temp[63: 32];
                    tempLO = temp[31: 0];
                    busy = 1;
                end
                4'd2: begin
                    tempHI = ($signed(NUM1) % $signed(NUM2));
                    tempLO = ($signed(NUM1) / $signed(NUM2));
                    busy = 1;
                end
                4'd3: begin
                    temp = NUM1 * NUM2;
                    tempHI = temp[63: 32];
                    tempLO = temp[31: 0];
                    busy = 1;
                end
                4'd4: begin
                    tempHI = NUM1 % NUM2;
                    tempLO = NUM1 / NUM2;
                    busy = 1;
                end
            endcase
        end
    end

    always @(posedge clk) begin
        if (reset) begin
            busy <= 0;
            HI <= 0;
            LO <= 0;
            cnt <= 0;
            temp <= 0;
            tempHI <= 0;
            tempLO <= 0;
        end else begin
            case (cnt)
                4'd0: begin
                    if (mdop == 1 || mdop == 3) begin
                        cnt = 5;
                        busy <= 1;
                    end else if (mdop == 2 || mdop == 4) begin
                        cnt = 10;
                        busy <= 1;
                    end else if (mdop == 7) begin
                        HI <= NUM1;
                    end else if (mdop == 8) begin
                        LO <= NUM1;
                    end
                end
                4'd1: begin
                    cnt = cnt - 1;
                    busy <= 0;
                    HI <= tempHI;
                    LO <= tempLO;
                end 
                default: begin
                    cnt = cnt - 1;
                end
            endcase
        end
    end
    
endmodule