module half_adder (a,b,c,s);
input  a,b;
output c,s;
assign c = a&b;
assign s = a^b;
endmodule