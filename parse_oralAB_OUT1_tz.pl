#!/usr/bin/perl
#Parse UG latest Epicollect AST data
#7_AMP108_AMC309_CRO3010_CAZ3011_CTX3012_FEP3013_TZP11014_MEM1015_F10016_RL2517_W518_CN1019_CIP20_TET3021_AK3022_Fox3023_E1524_VA3025_LZ1026_C3027_CC10
$file1 = $ARGV[0];
$outfile1 = $ARGV[1];


open(IN1, $file1);
open(OUT1,"> $outfile1");


while(<IN1>){
    chomp;
#    print "$_\n";
    if ($_ =~ /Sample/){
	@ast = split/\t/,$_;
	for $r (@ast){
#	    $c++; print "$c\t$r******\n";
	}
	print OUT1 "Sample_ID_Number\tGram_reaction\tSpecies\tESBL\tMDR(1)_or_SUS(0)\n";
    }
    if ($_ !~ /Sample/){
#	print "$_\n";
	@mic = split/\t/,$_;
	for $m (0..$#mic){}
	$data = "$mic[0]\t$mic[1]\t$mic[2]";
	if ($mic[3] > 0){
#	    print "$mic[0] is Pen positive!!+++\n";
#	    print "$data\t1\n";
	    $pen = "1";
	}
	if ($mic[3] == 0){
#	    print "$data\t0\n"; 
	    $pen = "0";
	}
	if ($mic[3] eq "ND" | $mic[3] =~ /^ *$/){
	    $pen = "0";
	}
#	print "$data\t$pen\n";
	if ($mic[4] > 0){
	    $penbla = "1";
#	    print "$data\t1\n";
	}
	if ($mic[4] == 0){
	    $penbla = "0";
	}
	if ($mic[4] eq "ND" | $mic[4] =~ /^ *$/){
	    $penbla = "0";
	}
	if ($mic[5]|$mic[6]|$mic[7]|$mic[8] > 0){
	    $esblceph = "0";
	}
	if ($mic[5]|$mic[6]|$mic[7]|$mic[8] == 0){
	    $esblceph = "0";
	}
	if ($mic[5]|$mic[6]|$mic[7]|$mic[8] eq "ND"){
	    $esblceph = "0";
	}
	if ($mic[5]|$mic[6]|$mic[7]|$mic[8] =~ /^ *$/){
	    $esblceph = "0";
	}
	if ($mic[9] > 0){
	    $apspen = "0";
	}
	if ($mic[9] == 0){
	    $apspen = "0";
	}
	if ($mic[9] eq "ND" | $mic[9] =~ /^ *$/){
	    $apspen = "0";
	}
	if ($mic[10] > 0){
	    $carba = "0";
#	    print "$data\t1\n";
	}
	if ($mic[10] == 0){
	    $carba = "0";
	}
	if ($mic[10] eq "ND"| $mic[10] =~ /^ *$/){
	    $carba = "0";
	}
	if ($mic[11] > 0){
	    $nit = "1";
#	    print "$data\t1\n";
	}
	if ($mic[11] == 0){
	    $nit = "0";
	}
	if ($mic[11] eq "ND" | $mic[11] =~ /^ *$/){
	    $nit = "0";
	}
	if ($mic[12|$mic[13] > 0]){
	    $fpi = "1";
	}
	if ($mic[12]| $mic[13] == 0){
	    $fpi = "0";
	}
	if ($mic[12]|$mic[13] eq "ND"){
	    $fpi = "0";
	}
	if ($mic[12]|$mic[13] =~ /^ *$/){
	    $fpi = "0";
	}
	if ($mic[14] | $mic[17] > 0){
	    $agly = "0";
	}
	if ($mic[14]|$mic[17] == 0){
	    $agly = "0";
	}
	if ($mic[14]|$mic[17] eq "ND"){
	    $agly = "0";
	}
	if ($mic[14]|$mic[17] =~ /^ *$/){
	    $agly = "0"
	}
	if ($mic[15] > 0){
	    $fq = "1";
	}
	if ($mic[15] == 0){
	    $fq = "0";
	}
	if ($mic[15] eq "ND"){
	    $fq = "0";
	}
	if ($mic[15] =~ /^ *$/){
	    $fq = "0";
	}
	if ($mic[16] > 0){
	    $tet = "1";
	}
	if ($mic[16] == 0){
	    $tet = "0";
	}
	if ($mic[16] eq "ND" | $mic[16] =~ /^ *$/){
	    $tet = "0";
	}
	if ($mic[18] > 0){
	    $astaphbla = "0";
	}
	if ($mic[18] == 0){
	    $astaphbla = "0";
	}
	if ($mic[18] eq "ND" | $mic[18] =~ /^ *$/){
	    $astaphbla = "0";
	}
	if ($mic[19] > 0){
	    $mac = "0";
	}
	if ($mic[19] == 0){
	    $mac = "0";
	}
	if ($mic[19] eq "ND" | $mic[19] =~ /^ *$/){
	    $mac = "0";
	}
	if ($mic[20] > 0){
	    $glyco = "0";
	}
	if ($mic[20] == 0){
	    $glyco = "0";
	}
	if ($mic[20] eq "ND" | $mic[20] =~ /^ *$/){
	    $glyco = "0";
	}
	if ($mic[21] > 0){
	    $oxazo = "0";
	}
	if ($mic[21] == 0){
	    $oxazo = "0";
	}
	if ($mic[21] eq "ND" | $mic[21] =~ /^ *$/){
	    $oxazo = "0";
	}
	if ($mic[22] > 0){
	    $phen = "0";
	}
	if ($mic[22] == 0){
	    $phen = "0";
	}
	if ($mic[22] eq "ND" | $mic[22] =~ /^ *$/){
	    $phen = "0";
	}
	if ($mic[23] > 0){
	    $lin = "0";
	}
	if ($mic[23] == 0){
	    $lin = "0";
	}
	if ($mic[23] eq "ND" | $mic[23] =~ /^ *$/){
	    $lin = "0";
	}
###ESBL analysis:
        if ($mic[5] > 0){$cro = "1";} if ($mic[5] == 0){$cro = "0";} #if ($mic[5] eq "ND" | $mic[5] =~ /^ *$/){ $cro = "0";}
	if ($mic[6] > 0){$caz = "1";} if ($mic[6] == 0){$caz = "0";} #if($mic[6] eq "ND" | $mic[6] =~ /^ *$/){ $caz = "0";}
	if ($mic[7] > 0){$ctx = "1";} if ($mic[7] == 0){$ctx = "0";} #if($mic[7] eq "ND" | $mic[7] =~ /^ *$/){ $ctx = "0";}
	if ($mic[8] > 0){$fep = "1";} if ($mic[8] == 0){$fep = "0";} #if($mic[8] eq "ND" | $mic[8] =~ /^ *$/){ $fep = "0";}
#	print "$data\t$caz\n";
	$sumesbl = $cro+$caz+$ctx+$fep;
#	print "$data\t$sumesbl\n"; 
	if ($sumesbl == 0){ $esblonly = "0";}
	if ($sumesbl == 2){$esblonly = "0.5";}
	if ($sumesbl == 4 ){$esblonly = "1";}
	$profile = "$data\t$pen+$penbla\t$esblceph\t$apspen\t$carba\t$nit\t$fpi\t$agly\t$fq\t$tet\t$astaphbla\t$mac\t$glyco\t$oxazo\t$phen\t$lin\n";
#	print "$profile";
	$mdr = $pen+$penbla+$esblceph+$apspen+$carba+$nit+$sulfo+$agly+$fq+$tet+$astaphbla+$mac+$glyco+$oxazo+$phen+$lin;
#	print "$data\t$mdr\n";
	if ($mdr > 2){
#	    print "$data\t$mdr\tMDR\n";
	    print OUT1 "$data\t$esblonly\t1\n";
	}
	if ($mdr <= 2 ){
#	    print "$data\t$mdr\tSUS\n";
	    print OUT1 "$data\t$esblonly\t0\n";
	}
    }
}




close(IN1);
close(OUT1);

exit;

#7_AMP108_AMC309_CRO3010_CAZ3011_CTX3012_FEP3013_TZP11014_MEM1015_F10016_RL2517_W518_CN1019_CIP20_TET3021_AK3022_Fox3023_E1524_VA3025_LZ1026_C3027_CC10  



