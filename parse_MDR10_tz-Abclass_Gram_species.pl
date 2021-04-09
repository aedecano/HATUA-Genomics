#!/usr/bin/perl
#Parse UG latest Epicollect AST data
#7_AMP108_AMC309_CRO3010_CAZ3011_CTX3012_FEP3013_TZP11014_MEM1015_F10016_RL2517_W518_CN1019_CIP20_TET3021_AK3022_Fox3023_E1524_VA3025_LZ1026_C3027_CC10

$file = $ARGV[0]; #Epicollect CSV form
$outfile = $ARGV[1]; #Parsed CSV with only AST data

open(IN, $file);

open(OUT, "> $outfile");

while(<IN>){
    chomp;
    if ($_ =~ /Isolate/){
	@header = split',',$_;
	for $d (@header){
	    $count++;
	    print "$count\t$d*******\n"; #check index number
	}
	for $h (0..$#header){}
	$header[8] =~ s/Name\_of\_the\_isolat/Species/g;
	$colheads = "$header[6]\t$header[9]\t$header[8]\tPen_$header[10]\tPenBla_$header[11]\tESBLCeph_$header[12]\tESBLCeph_$header[13]\tESBLCeph_$header[14]\tESBLCeph_$header[15]\tApsPenBla_$header[16]\tCarba_$header[17]\tNit_$header[18]\tSulfo_$header[19]\tFPI_$header[20]\tAGly_$header[21]\tFQ_$header[22]\tTet_$header[23]\tAGly_$header[24]\tAstaphBla_$header[25]\tMac_$header[26]\tGlyco_$header[27]\tOxazo_$header[28]\tPhen_$header[29]\tLin_$header[30]\n";
	$colheads =~ s/\d+_//g;
	$colheads =~ s/\d+//g;
	print OUT "$colheads";
    }
    if ($_ !~ /Isolate/){
	@info = split',', $_;
	for $i(0..$#info){}
	if ($info[8] =~ /netobacter/){
	    $amp = 0; $amc = 0; $cro = 13; $caz = 14; $ctx = 14; $fep = 14; $tzp = 17; $mem = 14; $f = 0; $rl = 15; $w = 0; $cn = 12; $cip = 15; $tet = 11; $ak = 14; $fox = 0; $e = 0; $va = 0; $lz = 0; $c = 0; $cc = 0;
    &RS;
	}
	if ($info[8] =~ /Candida/){
	    $amp = 0; $amc = 0; $cro = 0; $caz = 0; $ctx = 0; $fep = 0; $tzp = 0; $mem = 0; $f = 0; $rl = 0; $w = 0; $cn = 0; $cip = 0; $tet = 0; $ak = 0; $fox = 0; $e = 0; $va = 0; $lz = 0; $c = 0; $cc = 0;
	    &RS;
	}
	if ($info[8] =~ /Citrobacter|freundii/){
	    $amp = 13; $amc = 13; $cro = 19; $caz = 17; $ctx = 22; $fep = 18; $tzp = 17; $mem = 19; $f = 14; $rl = 12; $w = 10; $cn = 12; $cip = 15; $tet = 11; $ak = 14; $fox = 14; $e = 0; $va = 0; $lz = 0; $c = 12; $cc = 0;
	    &RS;
	}
	if ($info[8] =~ /oli/){
	    $amp = 13; $amc = 13; $cro = 19; $caz = 17; $ctx = 22; $fep = 18; $tzp = 17; $mem = 19; $f = 14; $rl = 12; $w = 10; $cn = 12; $cip = 15; $tet = 11; $ak = 14; $fox = 14; $e = 0; $va = 0; $lz = 0; $c = 12; $cc = 0;
	    &RS;
	}
	if ($info[8] =~ /Enterobacter|aero/){
	    $amp = 13; $amc = 13; $cro = 19; $caz = 17; $ctx = 22; $fep = 18; $tzp = 17; $mem = 19; $f = 14; $rl = 12; $w = 10; $cn = 12; $cip = 15; $tet = 11; $ak = 14; $fox = 14; $e = 0; $va = 0; $lz = 0; $c = 12; $cc = 0;
	    &RS;
	}
	if ($info[8] =~ /Enterococcus|cium|calis/){
	    $amp = 13; $amc = 13; $cro = 19; $caz = 17; $ctx = 22; $fep = 18; $tzp = 17; $mem = 19; $f = 14; $rl = 12; $w = 10; $cn = 12; $cip = 15; $tet = 11; $ak = 14; $fox = 14; $e = 0; $va = 0; $lz = 0; $c = 12; $cc = 0;
	    &RS;
	}
	if ($info[8] =~ /Klebsiella|pneumo/){
	    $amp = 13; $amc = 13; $cro = 19; $caz = 17; $ctx = 22; $fep = 18; $tzp = 17; $mem = 19; $f = 14; $rl = 12; $w = 10; $cn = 12; $cip = 15; $tet = 11; $ak = 14; $fox = 14; $e = 0; $va = 0; $lz = 0; $c = 12; $cc = 0;
	    &RS;
	}
	if ($info[8] =~ /Pseudomonas|aerugino/){
	    $amp = 0; $amc =0; $cro = 0; $caz = 14; $ctx = 0; $fep = 14; $tzp = 14; $mem = 15; $f = 0; $rl = 0; $w = 0; $cn = 12; $cip = 15; $tet = 0; $ak = 14; $fox = 0; $e = 0; $va = 0; $lz = 0; $c = 0; $cc = 0; 
	    &RS;
	}
	if ($info[8] =~ /Moraxella/){
	    $amp = 13; $amc = 13; $cro = 19; $caz = 17; $ctx = 22; $fep = 18; $tzp = 17; $mem = 19; $f = 14; $rl = 12; $w = 10; $cn = 12; $cip = 15; $tet = 11; $ak = 14; $fox = 14; $e = 0; $va = 0; $lz = 0; $c = 12; $cc = 0;
	    &RS;
	}
	if ($info[8] =~ /Morganella/){
	    $amp = 13; $amc = 13; $cro = 19; $caz = 17; $ctx = 22; $fep = 18; $tzp = 17; $mem = 19; $f = 14; $rl = 12; $w = 10; $cn = 12; $cip = 15; $tet = 11; $ak = 14; $fox = 14; $e = 0; $va = 0; $lz = 0; $c = 12; $cc = 0;
	    &RS;
	}
	if ($info[8] =~ /Proteus/){
	    $amp = 13; $amc = 13; $cro = 19; $caz = 17; $ctx = 22; $fep = 18; $tzp = 17; $mem = 19; $f = 14; $rl = 12; $w = 10; $cn = 12; $cip = 15; $tet = 11; $ak = 14; $fox = 14; $e = 0; $va = 0; $lz = 0; $c = 12; $cc = 0;
	    &RS;
	}
	if ($info[8] =~ /Providencia/){
	    $amp = 13; $amc = 13; $cro = 19; $caz = 17; $ctx = 22; $fep = 18; $tzp = 17; $mem = 19; $f = 14; $rl = 12; $w = 10; $cn = 12; $cip = 15; $tet = 11; $ak = 14; $fox = 14; $e = 0; $va = 0; $lz = 0; $c = 12; $cc = 0;
	    &RS;
	}
	if ($info[8] =~ /aph/){
	    $amp = 0; $amc = 0; $cro = 0; $caz = 0; $ctx = 0; $fep = 0; $tzp = 0; $mem = 0; $f = 14; $rl = 12; $w = 10; $cn = 12; $cip = 15; $tet = 14; $ak = 14; $fox = 21; $e = 13; $va = 0; $lz = 20; $c = 0; $cc = 14;   
	    &RS;
	}
	if ($info[8] =~ /Strepto|galac|pyo/){
	    $amp = 0; $amc = 0; $cro = 0; $caz = 0; $ctx = 0; $fep = 0; $tzp = 0; $mem = 0; $f = 14; $rl = 12; $w = 10; $cn = 12; $cip = 15; $tet = 14; $ak = 14; $fox = 21; $e = 13; $va = 0; $lz = 20; $c = 0; $cc = 14;
	    &RS;
	}
	if ($info[8] =~ /deter|neg/){ #undetermined or non-fermentative Gram negative strain
	    $amp = 13; $amc = 13; $cro = 19; $caz = 17; $ctx = 22; $fep = 18; $tzp = 17; $mem = 19; $f = 14; $rl = 12; $w = 10; $cn = 12; $cip = 15; $tet = 11; $ak = 14; $fox = 14; $e = 0; $va = 0; $lz = 0; $c = 12; $cc = 0;
	    &RS;
	}
	if ($info[8] =~ /ositive/){ #unindentified Gram-positive strain
	    $amp = 0; $amc = 0; $cro = 0; $caz = 0; $ctx = 0; $fep = 0; $tzp = 0; $mem = 0; $f = 14; $rl = 12; $w = 10; $cn = 12; $cip = 15; $tet = 14; $ak = 14; $fox = 21; $e = 13; $va = 0; $lz = 20; $c = 0; $cc = 14;
	    &RS;
	}
	if ($info[8] =~ /2013667/){ 
	    $amp = 0; $amc = 0; $cro = 0; $caz = 0; $ctx = 0; $fep = 0; $tzp = 0; $mem = 0; $f = 14; $rl = 12; $w = 10; $cn = 12; $cip = 15; $tet = 14; $ak = 14; $fox = 21; $e = 13; $va = 0; $lz = 20; $c = 0; $cc = 14;
	    &RS;
	}
	if ($info[8] =~ /^\s*$/){
	    #$amp = 11; $amc = ; $cro = ; $caz = ; $ctx = ; $fep = ; $tzp = ; $mem = ; $f = ; $rl = ; $w = ; $cn = ; $cip = ; $tet = ; $ak = ; $fox = ; $e = ; $va = ; $lz = ; $c = ; $cc = ; 
	    $amp = 13; $amc = 13; $cro = 19; $caz = 17; $ctx = 22; $fep = 18; $tzp = 17; $mem = 19; $f = 14; $rl = 12; $w = 10; $cn = 12; $cip = 15; $tet = 11; $ak = 14; $fox = 14; $e = 0; $va = 0; $lz = 0; $c = 12; $cc = 0;
	    &RS;
	}
#	print OUT "$ast";
    }
}



#sub ast {
#    $ast = "$info[6]\t$info[9]\t$info[8]\t$info[10]\t$info[11]\t$info[12]\t$info[13]\t$info[14]\t$info[15]\t$info[16]\t$info[17]\t$info[18]\t$info[19]\t$info[20]\t$info[21]\t$info[22]\t$info[23]\t$info[24]\t$info[25]\t$info[26]\t$info[27]\t$info[28]\t$info[29]\t$info[30]\n";
#}


sub RS {
    if ($info[10] == $amp && $info[10] < $amp){ $info[10] = "1"; } if ($info[10] > $amp){ $info[10] = "0"; } if ($info[10]  =~ /^ *$/){ $info[10] = "ND";}
    if ($info[11] == $amc && $info[11] < $amc){ $info[11] = "1";} if ($info[11] > $amc){ $info[11] = "0"; } if ($info[11] =~ /^ *$/){ $info[11] = "ND";}
    if ($info[12] == $caz && $info[12] < $caz){ $info[12] = "1"; } if ($info[12] > $cro){ $info[12] = "0"; } if ($info[12] =~ /^ *$/){ $info[12] = "ND";}
    if ($info[13] == $cro && $info[13] < $cro){ $info[13] = "1"; } if ($info[13] > $caz){ $info[13] = "0"; } if ($info[13] =~ /^ *$/){ $info[13] = "ND";}
    if ($info[14] == $ctx && $info[14] < $ctx){ $info[14] = "1"; } if ($info[14] > $ctx){ $info[14] = "0"; } if ($info[14] =~ /^ *$/){ $info[14] = "ND";}
    if ($info[15] == $fep && $info[15] < $fep){ $info[15] = "1"; } if ($info[15] > $fep){ $info[15] = "0"; } if ($info[15] =~ /^ *$/){ $info[15] = "ND";}
    if ($info[16] == $tzp && $info[16] < $tzp){ $info[16] = "1"; } if ($info[16] > $tzp){ $info[16] = "0"; } if ($info[16] =~ /^ *$/){ $info[16] = "ND";}
    if ($info[17] == $mem && $info[17] < $mem){ $info[17] = "1"; } if ($info[17] > $mem){ $info[17] = "0"; } if ($info[17] =~ /^ *$/){ $info[17] = "ND";}
    if ($info[18] == $f && $info[18] < $f){ $info[18] = "1"; } if ($info[18] > $f){ $info[18] = "0"; } if ($info[18] =~ /^ *$/){ $info[18] = "ND";}
    if ($info[19] == $rl && $info[19] < $rl){ $info[19] = "1"; } if ($info[19] > $rl){ $info[19] = "0"; } if ($info[19] =~ /^ *$/){ $info[19] = "ND";}
    if ($info[20] == $w && $info[20] < $w){ $info[20] = "1"; } if ($info[20] > $w){ $info[20] = "0"; } if ($info[20] =~ /^ *$/){ $info[20] = "ND";}
    if ($info[21] == $cn && $info[21] < $cn){ $info[21] = "1"; } if ($info[21] > $cn){ $info[21] = "0"; } if ($info[21] =~ /^ *$/){ $info[21] = "ND";}
    if ($info[22] == $cip && $info[22] < $cip){ $info[22] = "1"; } if ($info[22] > $cip){ $info[22] = "0"; } if ($info[22] =~ /^ *$/){ $info[22] = "ND";}
    if ($info[23] == $tet && $info[23] < $tet){ $info[23] = "1";} if ($info[23] > $tet){ $info[23] = "0"; } if ($info[23] =~ /^ *$/){ $info[23] = "ND";}
    if ($info[24] == $ak && $info[24] < $ak){ $info[24] = "1"; } if ($info[24] > $ak){ $info[24] = "0"; } if ($info[24] =~ /^ *$/){ $info[24] = "ND";}
    if ($info[25] == $fox && $info[25] < $fox){ $info[25] = "1";} if ($info[25] > $fox){ $info[25] = "0"; } if ($info[25] =~ /^ *$/){ $info[25] = "ND";}
    if ($info[26] == $e && $info[26] < $e){ $info[26] = "1"; } if ($info[26] > $e){ $info[26] = "0"; } if ($info[26] =~ /^ *$/){ $info[26] = "ND";}
    if ($info[27] == $va && $info[27] < $va){ $info[27] = "1"; } if ($info[27] > $va){ $info[27] = "0"; } if ($info[27] =~ /^ *$/){ $info[27] = "ND";}
    if ($info[28] == $lz && $info[28] < $lz){ $info[28] = "1"; } if ($info[28] > $lz){ $info[28] = "0"; } if ($info[28] =~ /^ *$/){ $info[28] = "ND";}
    if ($info[29] == $c && $info[29] < $c){ $info[29] = "1"; } if ($info[29] > $c){ $info[29] = "0"; } if ($info[29] =~ /^ *$/){ $info[28] = "ND";}
    if ($info[30] == $cc && $info[30] < $cc){ $info[30] = "1"; } if ($info[30] > $cc){ $info[30] = "0"; } if ($info[30] =~ /^ *$/){ $info[30] = "ND";}
    $ast = "$info[6]\t$info[9]\t$info[8]\t$info[10]\t$info[11]\t$info[12]\t$info[13]\t$info[14]\t$info[15]\t$info[16]\t$info[17]\t$info[18]\t$info[19]\t$info[20]\t$info[21]\t$info[22]\t$info[23]\t$info[24]\t$info[25]\t$info[26]\t$info[27]\t$info[28]\t$info[29]\t$info[30]\n"; 
    print OUT "$ast";
}




close(IN);


exit;

#7_AMP108_AMC309_CRO3010_CAZ3011_CTX3012_FEP3013_TZP11014_MEM1015_F10016_RL2517_W518_CN1019_CIP20_TET3021_AK3022_Fox3023_E1524_VA3025_LZ1026_C3027_CC10  



