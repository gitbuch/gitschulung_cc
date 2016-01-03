#!/usr/bin/perl

use strict;
use warnings;

sub usage {
    print STDERR "usage: $0 -r|-l\n";
    print STDERR "       -r: replace\n";
    print STDERR "       -l: list unincluded *.wiki files\n";
    exit 1;
}

usage if @ARGV != 1;

if($ARGV[0] eq '-r') {
    while(<STDIN>) {
        if(!m/^>>>(.+)<<<$/) {
            print;
            next;
        }
        my $file = $1;
        next unless -f $file;
        open my $fd, "<$file" || die "cannot open: $file";
        print while(<$fd>);
        close $fd;
    }
} elsif($ARGV[0] eq '-l') {
    my @files = split /\n/, qx(ls *.wiki);
    my %h = ();
    $h{$_} = 1 for @files;
    while(<STDIN>) {
        next unless m/^>>>(.+)<<<$/;
        $h{$1} = 0;
    }
    print join "\n" => grep { !/^session_\d.wiki$/ } grep { $h{$_} == 1 } keys %h;
    print "\n";
} else { usage; }

__END__
