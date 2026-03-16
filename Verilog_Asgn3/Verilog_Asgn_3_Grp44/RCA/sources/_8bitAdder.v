module _8bitAdder(s,cout,a,b,cin);
input [7:0]a,b;
input cin;
output [7:0]s;
output cout;

wire c1,c2,c3,c4,c5,c6,c7;

fullAdder f0(s[0],c1,a[0],b[0],cin);
fullAdder f1(s[1],c2,a[1],b[1],c1);
fullAdder f2(s[2],c3,a[2],b[2],c2);
fullAdder f3(s[3],c4,a[3],b[3],c3);
fullAdder f4(s[4],c5,a[4],b[4],c4);
fullAdder f5(s[5],c6,a[5],b[5],c5);
fullAdder f6(s[6],c7,a[6],b[6],c6);
fullAdder f7(s[7],cout,a[7],b[7],c7);

endmodule