#!/usr/bin/perl

#Parse UG latest Epicollect AST data
#7_AMP108_AMC309_CRO3010_CAZ3011_CTX3012_FEP3013_TZP11014_MEM1015_F10016_RL2517_W518_CN1019_CIP20_TET3021_AK3022_Fox3023_E1524_VA3025_LZ1026_C3027_CC10

$file = $ARGV[0]; #Epicollect CSV form
$outfile = $ARGV[1]; #Parsed CSV with only AST data

open(IN, $file);

open(OUT, "> $outfile");

while(<IN>){
    chomp;
    if ($_ =~ /People/){
	@header = split",",$_;
	for $d (@header){
	    $count++;
	    print "$count\t$d*******\n"; #check index number
	}
	for $h (0..$#header){}
	$colheads = "Patient_ID\tGram_reaction\tMost_probable_species\tESBLCeph_CRO\tPen_AMP\tFPI_R\tPenBla_AMC\tFPR_W\tAgly_CN\tESBLCeph_CAZ\tAstaphBla_FOX\tQ_NA\tFQ_CIP\tFPI_F\tTet_TET\tOxazo_LZD\tMac_E\tGlyco_VA\n";
	print OUT "$colheads";
    }
    if ($_ !~ /People/){
	@info = split",", $_;
	for $i(0..$#info){}
#	print "$info[2]\n";
	if ($info[2] =~ /netobacter/){
	    $amp = 0; $amc = 0; $cro = 13; $caz = 14; $ctx = 14; $fep = 14; $tzp = 17; $mem = 14; $f = 0; $rl = 15; $w = 0; $cn = 12; $cip = 15; $tet = 11; $ak = 14; $fox = 0; $e = 0; $va = 0; $lz = 0; $c = 0; $cc = 0;
    &RS;
	}
	if ($info[2] =~ /oli/){
	    $amp = 13; $amc = 13; $cro = 19; $caz = 17; $ctx = 22; $fep = 18; $tzp = 17; $mem = 19; $f = 14; $rl = 12; $w = 10; $cn = 12; $cip = 15; $tet = 11; $ak = 14; $fox = 14; $e = 0; $va = 0; $lz = 0; $c = 12; $cc = 0;
	    &RS;
	}
	if ($info[2] =~ /Enterobacter|aero/){
	    $amp = 13; $amc = 13; $cro = 19; $caz = 17; $ctx = 22; $fep = 18; $tzp = 17; $mem = 19; $f = 14; $rl = 12; $w = 10; $cn = 12; $cip = 15; $tet = 11; $ak = 14; $fox = 14; $e = 0; $va = 0; $lz = 0; $c = 12; $cc = 0;
	    &RS;
	}
	if ($info[2] =~ /Enterococcus|cium|calis/){
	    $amp = 13; $amc = 13; $cro = 19; $caz = 17; $ctx = 22; $fep = 18; $tzp = 17; $mem = 19; $f = 14; $rl = 12; $w = 10; $cn = 12; $cip = 15; $tet = 11; $ak = 14; $fox = 14; $e = 0; $va = 0; $lz = 0; $c = 12; $cc = 0;
	    &RS;
	}
	if ($info[2] =~ /Klebs/){
	    $amp = 13; $amc = 13; $cro = 19; $caz = 17; $ctx = 22; $fep = 18; $tzp = 17; $mem = 19; $f = 14; $rl = 12; $w = 10; $cn = 12; $cip = 15; $tet = 11; $ak = 14; $fox = 14; $e = 0; $va = 0; $lz = 0; $c = 12; $cc = 0;
	    &RS;
	}
	if ($info[2] =~ /Proteus/){
	    $amp = 13; $amc = 13; $cro = 19; $caz = 17; $ctx = 22; $fep = 18; $tzp = 17; $mem = 19; $f = 14; $rl = 12; $w = 10; $cn = 12; $cip = 15; $tet = 11; $ak = 14; $fox = 14; $e = 0; $va = 0; $lz = 0; $c = 12; $cc = 0;
	    &RS;
	}
	if ($info[2] =~ /aph/){
	    $amp = 0; $amc = 0; $cro = 0; $caz = 0; $ctx = 0; $fep = 0; $tzp = 0; $mem = 0; $f = 14; $rl = 12; $w = 10; $cn = 12; $cip = 15; $tet = 14; $ak = 14; $fox = 21; $e = 13; $va = 0; $lz = 20; $c = 0; $cc = 14;   
	    &RS;
	}
	if ($info[2] =~ /deter|neg/){ #undetermined or non-fermentative Gram negative strain
	    $amp = 13; $amc = 13; $cro = 19; $caz = 17; $ctx = 22; $fep = 18; $tzp = 17; $mem = 19; $f = 14; $rl = 12; $w = 10; $cn = 12; $cip = 15; $tet = 11; $ak = 14; $fox = 14; $e = 0; $va = 0; $lz = 0; $c = 12; $cc = 0;
	    &RS;
	}
	if ($info[2] =~ /ositive/){ #unindentified Gram-positive strain
	    $amp = 0; $amc = 0; $cro = 0; $caz = 0; $ctx = 0; $fep = 0; $tzp = 0; $mem = 0; $f = 14; $rl = 12; $w = 10; $cn = 12; $cip = 15; $tet = 14; $ak = 14; $fox = 21; $e = 13; $va = 0; $lz = 20; $c = 0; $cc = 14;
	    &RS;
	}
	if ($info[2] =~ /^\s*$/ | $info[2] =~ "."){
	    #$amp = 11; $amc = ; $cro = ; $caz = ; $ctx = ; $fep = ; $tzp = ; $mem = ; $f = ; $rl = ; $w = ; $cn = ; $cip = ; $tet = ; $ak = ; $fox = ; $e = ; $va = ; $lz = ; $c = ; $cc = ; 
	    $amp = 13; $amc = 13; $cro = 19; $caz = 17; $ctx = 22; $fep = 18; $tzp = 17; $mem = 19; $f = 14; $rl = 12; $w = 10; $cn = 12; $cip = 15; $tet = 11; $ak = 14; $fox = 14; $e = 0; $va = 0; $lz = 0; $c = 12; $cc = 0;
	    &RS;
	}
	print OUT "$ast";
    }
}



sub ast {
    $ast = "$info[0]\t$info[1]\t$info[2]\t$info[3]\t$info[4]\t$info[5]\t$info[6]\t$info[7]\t$info[8]\t$info[10]\t$info[11]\t$info[12]\t$info[13]\t$info[14]\t$info[15]\t$info[16]\t$info[17]\n";
}


sub RS {
    if ($info[0] eq "."){$info[0] = "ND";} if ($info[1] eq "."){$info[1] = "ND";} if ($info[2] eq "."){$info[2] = "ND";}
    if ($info[4] == $amp && $info[4] < $amp){ $info[4] = "1"; } if ($info[4] > $amp){ $info[4] = "0"; } if ($info[4]  =~ /./){ $info[4] = "ND";}
    if ($info[6] == $amc && $info[6] < $amc){ $info[6] = "1";} if ($info[6] > $amc){ $info[6] = "0"; } if ($info[6] =~ /./){ $info[6] = "ND";}
    if ($info[9] == $caz && $info[9] < $caz){ $info[9] = "1"; } if ($info[9] > $cro){ $info[9] = "0"; } if ($info[9] =~ /./){ $info[9] = "ND";}
    if ($info[3] == $cro && $info[3] < $cro){ $info[3] = "1"; } if ($info[3] > $caz){ $info[3] = "0"; } if ($info[3] =~ /./){ $info[3] = "ND";}
    if ($info[13] == $f && $info[13] < $f){ $info[13] = "1"; } if ($info[13] > $f){ $info[13] = "0"; } if ($info[13] =~ /./){ $info[13] = "ND";}
    if ($info[5] == $rl && $info[5] < $rl){ $info[5] = "1"; } if ($info[5] > $rl){ $info[5] = "0"; } if ($info[5] =~ /./){ $info[5] = "ND";}
    if ($info[7] == $w && $info[7] < $w){ $info[7] = "1"; } if ($info[7] > $w){ $info[7] = "0"; } if ($info[7] =~ /./){ $info[7] = "ND";}
    if ($info[8] == $cn && $info[8] < $cn){ $info[8] = "1"; } if ($info[8] > $cn){ $info[8] = "0"; } if ($info[8] =~ /./){ $info[8] = "ND";}
    if ($info[12] == $cip && $info[12] < $cip){ $info[12] = "1"; } if ($info[12] > $cip){ $info[12] = "0"; } if ($info[12] =~ /./){ $info[12] = "ND";}
    if ($info[14] == $tet && $info[14] < $tet){ $info[14] = "1";} if ($info[14] > $tet){ $info[14] = "0"; } if ($info[14] =~ /./){ $info[14] = "ND";}
    if ($info[16] == $e && $info[16] < $e){ $info[16] = "1"; } if ($info[16] > $e){ $info[16] = "0"; } if ($info[16] =~ /./){ $info[16] = "ND";}
    if ($info[17] == $va && $info[17] < $va){ $info[17] = "1"; } if ($info[17] > $va){ $info[17] = "0"; } if ($info[17] =~ /./){ $info[17] = "ND";}
    if ($info[15] == $lz && $info[15] < $lz){ $info[15] = "1"; } if ($info[15] > $lz){ $info[18] = "0"; } if ($info[18] =~ /./){ $info[18] = "ND";}
    &ast;
}




close(IN);


exit;

#7_AMP108_AMC309_CRO3010_CAZ3011_CTX3012_FEP3013_TZP11014_MEM1015_F10016_RL2517_W518_CN1019_CIP20_TET3021_AK3022_Fox3023_E1524_VA3025_LZ1026_C3027_CC10  



