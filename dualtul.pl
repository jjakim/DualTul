#!/usr/bin/perl -w

######################################
#
# v0.0.1 dualtul.pl
#
#read and store dual weights as text file
#
# v.0.0.2 changed drivepath for single drive implementation
#
####################################

use strict;
use warnings;

#TODO: add log4perl

my $raw0 =0;
my $raw1 =0;
my $datestr;
my $weight0;
my $weight1;
my $cpuTemp;


# read the scales

$weight0 = `sudo /media/usbstick/www/hx711/hx711-0 1`;
$weight0 = $weight0/9200;

$weight1 = `sudo /media/usbstick/www/hx711/hx711-1 1`;
$weight1 = $weight1/7300;

$cpuTemp = `vcgencmd measure_temp`;
$cpuTemp =~ m/\d+\.\d/;
$cpuTemp = $&;

# $datestr = localtime();
$datestr = time();


# write the file
# my $csvlog = '/media/usbstick/dual-091215.csv';
my $csvlog = '/media/usbstick/www/data0.csv';


open(my $fh, '>>', $csvlog );
print $fh $datestr,", ", $weight0, ", ", $weight1, ", ", $cpuTemp, "\n";
close $fh; 



