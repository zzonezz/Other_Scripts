#!/usr/bin/perl
    use strict;
    use warnings;

my $dir = "./[YOUR FOLDER PATH]";
open OUT, ">allinsert.txt";
my %seq; my $name;
my @dir; my @dir2;
opendir (DIR, $dir) or die "can't open the directory!";
@dir = readdir DIR;
closedir DIR;
foreach (@dir) {
  if (/(.*).seq/){
    push (@dir2, $_)};};

foreach my $a(@dir2){
      open IN,"./$dir/$a" or die "can't open the $a!";
      while(<IN>){
        chomp;
        if (/>/){ $name=$_; }
          else{$seq{$name} .=$_;};}}

 foreach my $keys(keys %seq){ #for NEB SR barcode
    if($seq{$keys}=~/CCGACGATC(.*)AGATCGGAAG/){print OUT"$keys"."_NEB_SR_RM\n$1\n";}
    elsif($seq{$keys}=~/CTTCCGATCT(.*)GATCGTCGG/){print OUT"$keys"."_NEB_SR_RM\n$1\n";}
    #else {print OUT"$keys"."does not contain barcode\n$seq{$keys}\n";}
        }
foreach my $keys(keys %seq){ #for TOPO  barcode
    if($seq{$keys}=~/AATTCGCCCTT(.*)AAGGGCG/){print OUT"$keys"."_TOPO_RM\n$1\n";}
    #else {print OUT"$keys"."does not contain barcode\n$seq{$keys}\n";}
               }
