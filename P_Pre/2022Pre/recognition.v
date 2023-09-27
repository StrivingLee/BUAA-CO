`define S0 2'b00 //reset
`define S1 2'b01 //1
`define S2 2'b10 //10
`define S3 2'b11 //101
module recognition(
    input clk,
    input reset,
    input in,
    output out 
);
    reg [1:0]state;
    reg [1:0]next;
    initial begin //初始化
        state=`S0;
        next=`S0;
    end
    always@(*)begin //状态转移
        case(state)
        `S0:
            if(in==1)
                next=`S1;
            else
                next=`S2;
        `S1://1
            if(in==1)
                next=`S1;
            else
                next=`S2;
        `S2://10
            if(in==1)
                next=`S3;
            else
                next=`S0;
        `S3://101
            if(in==1)
                next=`S1;
            else
                next=`S2;

        endcase
    end
  always @(posedge clk) begin //状态存储
        state=next;
  end
    assign out=((state==`S2)&&(in==1))?1:0;//输出和当前状态以及输入有关
endmodule