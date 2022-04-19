`timescale 1ns/1ps

module alu_1bit(
	input				src1,       //1 bit source 1  (input)
	input				src2,       //1 bit source 2  (input)
	input				less,       //1 bit less      (input)
	input 				Ainvert,    //1 bit A_invert  (input)
	input				Binvert,    //1 bit B_invert  (input)
	input 				cin,        //1 bit carry in  (input)
	input 	    [2-1:0] operation,  //2 bit operation (input)
	output reg          result,     //1 bit result    (output)
	output reg          cout        //1 bit carry out (output)
	);

/* Write your code HERE */

wire a,b,ans;
MUX2to1 M1(src1,~src1,Ainvert,a);
MUX2to1 M2(src2,~src2,Binvert,b);
MUX4to1 M3((a&b),(a|b),(a^b^cin),less,operation,ans);
always @(*) begin
	case(operation)
		2'b00: begin
			result=ans;
			cout=0;
		end
		2'b01: begin
			result=ans;
			cout=0;
		end
		2'b10: begin
			result=ans;
			cout=(a&b)|(a&cin)|(b&cin);
		end
		2'b11: begin
			result= ans;
			cout=(a&b)|(a&cin)|(b&cin);
		end
	endcase
end
/*assign a=src1^Ainvert;
assign b=src2^Binvert;


always @(*) begin
	case(operation)
		2'b00: begin
			result=a&b;
			cout=0;
		end
		2'b01: begin
			result=a|b;
			cout=0;
		end
		2'b10: begin
			result=a^b^cin;
			cout=(a&b)|(a&cin)|(b&cin);
		end
		2'b11: begin
			result= less;
			cout=(a&b)|(a&cin)|(b&cin);
		end
	endcase
end*/
endmodule
