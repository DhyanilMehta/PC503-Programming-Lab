#!/bin/perl

open($file, '<', 'lab2q4input.txt') or die $!;
%word_count = ();

while(<$file>) {
    chomp;
    @words = split(' ');

    foreach $word (@words) {
        if( exists($word_count{$word}) ) {
            $word_count{$word} += 1;
        }
        else {
            $word_count{$word} = 1;
        }
    }
}

while( ($key, $value) = each %word_count ) {
    print "$key => $value\n";
}

close($file);