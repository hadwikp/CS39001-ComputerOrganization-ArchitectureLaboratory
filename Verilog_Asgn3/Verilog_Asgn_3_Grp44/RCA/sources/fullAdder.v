
module fullAdder(sum,cout,a,b,cin);
input a,b,cin;
output sum,cout;
halfAdder h1(s1,c1,a,b);
halfAdder h2(sum,c2,s1,cin);
or g3 (cout,c2,c1);
endmodule
