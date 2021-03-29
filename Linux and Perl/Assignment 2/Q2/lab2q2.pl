#!/bin/perl

print "Enter temperature to convert in F or C: ";
$temp = <STDIN>;
chomp $temp;
$far = index($temp, "F");
$cel = index($temp, "C");
if( $far == -1 && $cel == -1) {
    die "Enter valid unit of temperature\n";
}

$temp =~ s/[^0-9]//g;

if($far != -1) {
    $celsius = int(($temp - 32)*9/5);
    print "Temperature converted to celsius: $celsius C\n";
}
else {
	$fahrenheit = int(($temp * 9 / 5) + 32);
	print "Temperature converted to fahrenheit: $fahrenheit F\n";
}
