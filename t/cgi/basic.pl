#!/usr/bin/perl

use strict;
use warnings;
use 5.010;

use CGI qw(-debug);
my $cgi = CGI->new();

use CGI::Github::Webhook;

my $ghwh = CGI::Github::Webhook->new(
    trigger => $ARGV[0],
    trigger_backgrounded => 0,
    secret => $ARGV[1],
    log => $ARGV[2],
    cgi => $cgi,
    );
my $rc = $ghwh->run();

if ($rc) {
    exit 0
} else {
    exit 1
}
