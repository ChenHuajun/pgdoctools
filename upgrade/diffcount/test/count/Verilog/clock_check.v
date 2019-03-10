// OverView
// ========
//  This is the clock_check module
//     本模块是用参考时钟对系统时钟进行检测，对高电平和低
// 电平分别计数，若计数值大于某一值，则认为系统时钟丢失或频率变低(变高也可检测)；
//     由于参考时钟也可能是100M或其它频率，所以采用参数化输入，对不同的值分别取不同的参数，
// 在端口进行输入。

//`include "xxxxx"
`timescale 1ns/100ps

module  clock_check(
        input            I_reset_n           ,  // 复位信号
        input            I_reference_clk     ,  // 参考时钟
        input [4:0]      I_clock_parameter   ,  // 检测系统时钟参数
        input            I_clock             ,  // 输入的系统时钟
        output           O_clock_lose           // 指示系统时钟丢失或频率变低

        );


reg  [2:0] R_div1         ;
reg  [4:0] R_high_counter0;
reg  [4:0] R_low_counter0 ;
reg  [4:0] R_counter      ;
wire       W_clock_lose   ;

// 时钟8分频
always @(posedge I_clock or negedge I_reset_n) begin
   if (~I_reset_n) begin
      R_div1 <=3'b0;
      end
   else begin
      R_div1 <=R_div1+1;
      end
   end

assign  W_div_clock1 = R_div1[2];

// 用参考时钟监视系统时钟的异常情况
// 判决方式：
// 当R_high_counter0,R_low_counter0每周期记数都>I_clock_parameter以上，则可能时钟频率变低；
// 当R_high_counter0,R_low_counter0每周期记数一个>I_clock_parameter以上，一个<I_clock_parameter-3则可能时钟丢失；
// 当R_high_counter0,R_low_counter0每周期记数都<I_clock_parameter-3，则可能时钟频率变高；
// 目前只需判断丢失
always @(posedge I_reference_clk or negedge I_reset_n) begin
   if (~I_reset_n) begin
      R_high_counter0 <=5'b0;
      R_low_counter0  <=5'b0;
      end
   else if (W_div_clock1) begin
      R_high_counter0 <= (&R_high_counter0) ? R_high_counter0 : (R_high_counter0+1);
      R_low_counter0  <=5'b0;
      end
   else begin
      R_low_counter0  <= (&R_low_counter0) ? R_low_counter0 : (R_low_counter0 +1);
      R_high_counter0 <=5'b0;
      end
   end

assign W_clock_lose =R_high_counter0>I_clock_parameter | R_low_counter0>I_clock_parameter;
// 此段程序用于I_reference_clk丢失而W_div_clock1不丢失时误报，当超过一门限时才上报
always @(posedge I_reference_clk or negedge I_reset_n) begin
   if (~I_reset_n) begin
      R_counter <=5'b0;
      end
   else if (W_clock_lose) begin
      R_counter <=(&R_counter) ? R_counter : (R_counter+1);
      end
   else begin
      R_counter <=5'b0;
      end
   end

assign O_clock_lose = R_counter>I_clock_parameter;

endmodule
