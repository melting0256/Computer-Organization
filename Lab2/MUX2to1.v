module MUX2to1(
	input      src1,
	input      src2,
	input	   select,
	output reg result
	);
/* Write your code HERE */
always @(src1,src2,select) begin
	if(select==0) begin
		result=src1;
	end
	else if(select==1) begin
		result=src2;
	end
end
endmodule
