`timescale 1ns/1ps

/*module alu_1bit_bottom(
	input				src1,       //1 bit source 1  (input)
	input				src2,       //1 bit source 2  (input)
	input				less,       //1 bit less      (input)
	input 				Ainvert,    //1 bit A_invert  (input)
	input				Binvert,    //1 bit B_invert  (input)
	input 				cin,        //1 bit carry in  (input)
	input 	    [2-1:0] operation,  //2 bit operation (input)
	output reg          result,     //1 bit result    (output)
	output reg          cout,        //1 bit carry out (output)
	output reg          set
	);
wire a,b;
assign a=src1^Ainvert;
assign b=src2^Binvert;

always @(*) begin
	if(operation==2'b00) begin
		result=a&b;
		cout=1'b0;
	end
	else if(operation==2'b01) begin
		result=a|b;
		cout=1'b0;
	end
	else if(operation==2'b10) begin
		result=a^b^cin;
		cout=(a&b)|(cin&a)|(cin&b);
	end
	else if(operation==2'b11) begin
		result=less;
		set=(a&b)|(cin&a)|(cin&b);
		cout=1'b0;
	end
end

endmodule*/


module alu(
	input                   rst_n,         // negative reset            (input)
	input	     [32-1:0]	src1,          // 32 bits source 1          (input)
	input	     [32-1:0]	src2,          // 32 bits source 2          (input)
	input 	     [ 4-1:0] 	ALU_control,   // 4 bits ALU control input  (input)
	output reg   [32-1:0]	result,        // 32 bits result            (output)
	output reg              zero,          // 1 bit when the output is 0, zero must be set (output)
	output reg              cout,          // 1 bit carry out           (output)
	output reg              overflow       // 1 bit overflow            (output)
	);

/* Write your code HERE */
wire Ainvert=ALU_control[3];
wire Binvert=ALU_control[2];
wire [2-1:0] op=ALU_control[1:0];
reg constantzero=1'b0;

wire [32-1:0] out;
wire c0,c1,c2,c3,c4,c5,c6,c7,c8,c9,c10,c11,c12,c13,c14,c15,c16,c17,c18,c19,c20,c21,c22,c23,c24,c25,c26,c27,c28,c29,c30,c31;
reg first_cin;

wire f,set;
assign {f,set}=(src1[31]+(~src2[31])+c30);


alu_1bit first(src1[0],src2[0],set,Ainvert,Binvert,first_cin,op,out[0],c0);
alu_1bit one(src1[1],src2[1],constantzero,Ainvert,Binvert,c0,op,out[1],c1);
alu_1bit two(src1[2],src2[2],constantzero,Ainvert,Binvert,c1,op,out[2],c2);
alu_1bit three(src1[3],src2[3],constantzero,Ainvert,Binvert,c2,op,out[3],c3);
alu_1bit four(src1[4],src2[4],constantzero,Ainvert,Binvert,c3,op,out[4],c4);
alu_1bit five(src1[5],src2[5],constantzero,Ainvert,Binvert,c4,op,out[5],c5);
alu_1bit six(src1[6],src2[6],constantzero,Ainvert,Binvert,c5,op,out[6],c6);
alu_1bit seven(src1[7],src2[7],constantzero,Ainvert,Binvert,c6,op,out[7],c7);
alu_1bit eight(src1[8],src2[8],constantzero,Ainvert,Binvert,c7,op,out[8],c8);
alu_1bit nine(src1[9],src2[9],constantzero,Ainvert,Binvert,c8,op,out[9],c9);
alu_1bit ten(src1[10],src2[10],constantzero,Ainvert,Binvert,c9,op,out[10],c10);
alu_1bit eleven(src1[11],src2[11],constantzero,Ainvert,Binvert,c10,op,out[11],c11);
alu_1bit twelve(src1[12],src2[12],constantzero,Ainvert,Binvert,c11,op,out[12],c12);
alu_1bit thirteen(src1[13],src2[13],constantzero,Ainvert,Binvert,c12,op,out[13],c13);
alu_1bit fourteen(src1[14],src2[14],constantzero,Ainvert,Binvert,c13,op,out[14],c14);
alu_1bit fifteen(src1[15],src2[15],constantzero,Ainvert,Binvert,c14,op,out[15],c15);
alu_1bit sixteen(src1[16],src2[16],constantzero,Ainvert,Binvert,c15,op,out[16],c16);
alu_1bit seventeen(src1[17],src2[17],constantzero,Ainvert,Binvert,c16,op,out[17],c17);
alu_1bit eighteen(src1[18],src2[18],constantzero,Ainvert,Binvert,c17,op,out[18],c18);
alu_1bit nineteen(src1[19],src2[19],constantzero,Ainvert,Binvert,c18,op,out[19],c19);
alu_1bit twenty(src1[20],src2[20],constantzero,Ainvert,Binvert,c19,op,out[20],c20);
alu_1bit twnty_one(src1[21],src2[21],constantzero,Ainvert,Binvert,c20,op,out[21],c21);
alu_1bit twenty_two(src1[22],src2[22],constantzero,Ainvert,Binvert,c21,op,out[22],c22);
alu_1bit twenty_three(src1[23],src2[23],constantzero,Ainvert,Binvert,c22,op,out[23],c23);
alu_1bit twenty_four(src1[24],src2[24],constantzero,Ainvert,Binvert,c23,op,out[24],c24);
alu_1bit twenty_five(src1[25],src2[25],constantzero,Ainvert,Binvert,c24,op,out[25],c25);
alu_1bit twenty_six(src1[26],src2[26],constantzero,Ainvert,Binvert,c25,op,out[26],c26);
alu_1bit twenty_seven(src1[27],src2[27],constantzero,Ainvert,Binvert,c26,op,out[27],c27);
alu_1bit twenty_eight(src1[28],src2[28],constantzero,Ainvert,Binvert,c27,op,out[28],c28);
alu_1bit twenty_nine(src1[29],src2[29],constantzero,Ainvert,Binvert,c28,op,out[29],c29);
alu_1bit thirty(src1[30],src2[30],constantzero,Ainvert,Binvert,c29,op,out[30],c30);
alu_1bit thirty_one(src1[31],src2[31],constantzero,Ainvert,Binvert,c30,op,out[31],c31);


always @(*) begin
	if(rst_n==0)begin
		result=0;
		zero=0;
		cout=0;
		overflow=0;
	end
	else begin
		case(ALU_control)
			4'b0000: begin  //and
				first_cin=0;
				cout=0;
				result=out;
				overflow=0;
			end
			4'b0001: begin  //or
				first_cin=0;
				cout=0;
				result=out;
				overflow=0;
			end
			4'b0010: begin  //add
				first_cin=0;
				cout=c31;
				result=out;
				overflow=c30^c31;
			end
			4'b0110: begin  //sub
				first_cin=1;
				cout=c31;
				result=out;
				overflow=c30^c31;
			end
			4'b0111: begin  //slt
				first_cin=1;
				cout=0;
				result=out;
				overflow=0;
			end
			4'b1100: begin  //nor
				first_cin=0;
				cout=0;
				result=out;
				overflow=0;
			end
			4'b1101: begin  //nand
				first_cin=0;
				cout=0;
				result=out;
				overflow=0;
			end
		endcase

		zero= |result;
		zero= ~zero;
	end
end

endmodule
