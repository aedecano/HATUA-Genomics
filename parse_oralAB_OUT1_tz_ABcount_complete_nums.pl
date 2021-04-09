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
###ALL ABs:
#	print OUT1 "Sample_ID_Number\tGram_reaction\tSpecies\tAB_class_count\n";
#	print OUT1 "Sample_ID_Number\tGram_reaction\tSpecies\tESBL\tMDR\tPen\tPenbla\t$ESBL_Ceph\tAPS_Pen\tCarba\tNit\tFPI\tAgly\tFQ\tTet\tAstaphBla\tMac\tGlyco\tOxazo\tPhen\tLin\n";
###Oral only
	print OUT1 "Sample_ID_Number\tGram_reaction\tSpecies\tNum_sp\tESBL\tAB_class_count\tMDR\tPen_AMC\tPenBla_AMP\tNit_F\tFPI_RL_W\tFQ_CIP\tTet_TET\n";
    }
    if ($_ !~ /Sample/){
#	print "$_\n";
	@mic = split/\t/,$_;
	for $m (0..$#mic){}
	$data = "$mic[0]\t$mic[1]\t$mic[2]\t$mic[3]";
	if ($mic[4] > 0){
#	    print "$mic[0] is Pen positive!!+++\n";
#	    print "$data\t1\n";
	    $pen = "1";
	}
	if ($mic[4] == 0){
#	    print "$data\t0\n"; 
	    $pen = "0";
	}
	if ($mic[4] eq "ND" | $mic[3] =~ /^ *$/){
	    $pen = "0";
	}
#	print "$data\t$pen\n";
	if ($mic[5] > 0){
	    $penbla = "1";
#	    print "$data\t1\n";
	}
	if ($mic[5] == 0){
	    $penbla = "0";
	}
	if ($mic[5] eq "ND" | $mic[4] =~ /^ *$/){
	    $penbla = "0";
	}
	if ($mic[6]|$mic[7]|$mic[8]|$mic[9] > 0){
	    $esblceph = "0";
	}
	if ($mic[6]|$mic[7]|$mic[8]|$mic[9] == 0){
	    $esblceph = "0";
	}
	if ($mic[6]|$mic[7]|$mic[8]|$mic[9] eq "ND"){
	    $esblceph = "0";
	}
	if ($mic[6]|$mic[7]|$mic[8]|$mic[9] =~ /^ *$/){
	    $esblceph = "0";
	}
	if ($mic[10] > 0){
	    $apspen = "0";
	}
	if ($mic[10] == 0){
	    $apspen = "0";
	}
	if ($mic[10] eq "ND" | $mic[10] =~ /^ *$/){
	    $apspen = "0";
	}
	if ($mic[11] > 0){
	    $carba = "0";
#	    print "$data\t1\n";
	}
	if ($mic[11] == 0){
	    $carba = "0";
	}
	if ($mic[11] eq "ND"| $mic[11] =~ /^ *$/){
	    $carba = "0";
	}
	if ($mic[12] > 0){
	    $nit = "1";
#	    print "$data\t1\n";
	}
	if ($mic[12] == 0){
	    $nit = "0";
	}
	if ($mic[12] eq "ND" | $mic[12] =~ /^ *$/){
	    $nit = "0";
	}
	if ($mic[13]|$mic[14] > 0){
	    $fpi = "1";
	}
	if ($mic[13]| $mic[14] == 0){
	    $fpi = "0";
	}
	if ($mic[13]|$mic[14] eq "ND"){
	    $fpi = "0";
	}
	if ($mic[14]|$mic[14] =~ /^ *$/){
	    $fpi = "0";
	}
	if ($mic[15] | $mic[18] > 0){
	    $agly = "0";
	}
	if ($mic[15]|$mic[18] == 0){
	    $agly = "0";
	}
	if ($mic[15]|$mic[18] eq "ND"){
	    $agly = "0";
	}
	if ($mic[15]|$mic[18] =~ /^ *$/){
	    $agly = "0"
	}
	if ($mic[16] > 0){
	    $fq = "1";
	}
	if ($mic[16] == 0){
	    $fq = "0";
	}
	if ($mic[16] eq "ND"){
	    $fq = "0";
	}
	if ($mic[17] =~ /^ *$/){
	    $fq = "0";
	}
	if ($mic[17] > 0){
	    $tet = "1";
	}
	if ($mic[17] == 0){
	    $tet = "0";
	}
	if ($mic[17] eq "ND" | $mic[17] =~ /^ *$/){
	    $tet = "0";
	}
	if ($mic[19] > 0){
	    $astaphbla = "0";
	}
	if ($mic[19] == 0){
	    $astaphbla = "0";
	}
	if ($mic[19] eq "ND" | $mic[19] =~ /^ *$/){
	    $astaphbla = "0";
	}
	if ($mic[20] > 0){
	    $mac = "0";
	}
	if ($mic[20] == 0){
	    $mac = "0";
	}
	if ($mic[20] eq "ND" | $mic[20] =~ /^ *$/){
	    $mac = "0";
	}
	if ($mic[21] > 0){
	    $glyco = "0";
	}
	if ($mic[21] == 0){
	    $glyco = "0";
	}
	if ($mic[21] eq "ND" | $mic[21] =~ /^ *$/){
	    $glyco = "0";
	}
	if ($mic[22] > 0){
	    $oxazo = "0";
	}
	if ($mic[22] == 0){
	    $oxazo = "0";
	}
	if ($mic[22] eq "ND" | $mic[22] =~ /^ *$/){
	    $oxazo = "0";
	}
	if ($mic[23] > 0){
	    $phen = "0";
	}
	if ($mic[23] == 0){
	    $phen = "0";
	}
	if ($mic[23] eq "ND" | $mic[23] =~ /^ *$/){
	    $phen = "0";
	}
	if ($mic[24] > 0){
	    $lin = "0";
	}
	if ($mic[24] == 0){
	    $lin = "0";
	}
	if ($mic[24] eq "ND" | $mic[24] =~ /^ *$/){
	    $lin = "0";
	}
###ESBL analysis:
        if ($mic[6] > 0){$cro = "1";} if ($mic[6] == 0){$cro = "0";} #if ($mic[5] eq "ND" | $mic[5] =~ /^ *$/){ $cro = "0";}
	if ($mic[7] > 0){$caz = "1";} if ($mic[7] == 0){$caz = "0";} #if($mic[6] eq "ND" | $mic[6] =~ /^ *$/){ $caz = "0";}
	if ($mic[8] > 0){$ctx = "1";} if ($mic[8] == 0){$ctx = "0";} #if($mic[7] eq "ND" | $mic[7] =~ /^ *$/){ $ctx = "0";}
	if ($mic[9] > 0){$fep = "1";} if ($mic[9] == 0){$fep = "0";} #if($mic[8] eq "ND" | $mic[8] =~ /^ *$/){ $fep = "0";}
#	print "$data\t$caz\n";
	$sumesbl = $cro+$caz+$ctx+$fep;
#	print "$data\t$sumesbl\n"; 
	if ($sumesbl == 0){ $esblonly = "0";}
	if ($sumesbl == 2){$esblonly = "0.5";}
	if ($sumesbl == 4 ){$esblonly = "1";}
	$profile = "$data\t$pen+$penbla\t$esblceph\t$apspen\t$carba\t$nit\t$fpi\t$agly\t$fq\t$tet\t$astaphbla\t$mac\t$glyco\t$oxazo\t$phen\t$lin\n";
#	print "$profile";
	$mdr = $pen+$penbla+$nit+$sulfo+$fq+$tet;
#	print OUT1 "$data\t$mdr\n";
###oral AB only
#	print  "$data\t$esblonly\t$mdr\t$pen\t$penbla\t$nit\t$fpi\t$fq\t$tet\n";
	if ($mdr > 2){
#	    print "$data\t$mdr\tMDR\n";
#	    print OUT1 "$data\t$esblonly\t1\n";
	    print OUT1 "$data\t$esblonly\t$mdr\t1\t$pen\t$penbla\t$nit\t$fpi\t$fq\t$tet\n";
	}
	if ($mdr <= 2 ){
#	    print "$data\t$mdr\tSUS\n";
#	    print OUT1 "$data\t$esblonly\t0\n";
	    print OUT1 "$data\t$esblonly\t$mdr\t0\t$pen\t$penbla\t$nit\t$fpi\t$fq\t$tet\n";
	}
    }
}




close(IN1);
close(OUT1);

exit;

#7_AMP108_AMC309_CRO3010_CAZ3011_CTX3012_FEP3013_TZP11014_MEM1015_F10016_RL2517_W518_CN1019_CIP20_TET3021_AK3022_Fox3023_E1524_VA3025_LZ1026_C3027_CC10  



