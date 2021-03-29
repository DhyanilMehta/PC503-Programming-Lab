clear;
fileID = fopen('Q2_output.txt', 'w');
fprintf(fileID, "%s\t%7s\t%12s\n", "x", "real(x)", "imaginary(x)");
x = linspace(1,10,10);
c = complex(power(x,2), x);
fprintf(fileID, "%d\t%6d\t%11d\n", [x; real(c); imag(c)]);
fclose(fileID);