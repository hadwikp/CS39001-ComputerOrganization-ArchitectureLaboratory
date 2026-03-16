module _16bitAdder (s,cout,a,b,cin);
input [15:0]a,b;
input cin;
output [15:0] s;
output cout;
wire c1;

_8bitAdder e1(s[7:0],c1,a[7:0],b[7:0],cin);
_8bitAdder e2(s[15:8],cout,a[15:8],b[15:8],c1);

endmodule