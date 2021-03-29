#!/bin/perl

print "Enter a perl filename:\n";
$filename = <STDIN>;
chomp $filename;

@fileext = split /\./, $filename;

@ext = ("pl", "pm");
$pl = $fileext[-1] eq $ext[0];
$pm = $fileext[-1] eq $ext[1];

if( $pl != 1 && $pm != 1 ) {
    die "Error: unable to analyse the specified file\n";
}

die "Error: unable to analyse the specified file\n" unless -e $filename;
die "Error: unable to analyse the specified file\n" unless -r $filename;
die "Error: unable to analyse the specified file\n" if -z $filename;
print "All OK!\n";
