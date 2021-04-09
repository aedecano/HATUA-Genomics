#!/usr/bin/perl
#Parse UG latest Epicollect AST data

#4ESBLCeph_CRO******
#5Pen_AMP******
#6FPI_R******
#7PenBla_AMC******
#    8FPR_W******
#    9Agly_CN******
#    10ESBLCeph_CAZ******
#    11AstaphBla_FOX******
#    12Q_NA******
#    13FQ_CIP******
#    14FPI_F******
#    15Tet_TET******
#    16Oxazo_LZD******
#    17Mac_E******
#    18Glyco_VA******


$file1 = $ARGV[0];
$outfile1 = $ARGV[1];


open(IN1, $file1);
open(OUT1,"> $outfile1");


while(<IN1>){
    chomp;
#    print "$_\n";
    if ($_ =~ /Patient/){
	@ast = split/\t/,$_;
	for $r (@ast){
#	    $c++; print "$c\t$r******\n";
	}
	print OUT1 "Sample_ID_Number\tGram_reaction\tSpecies\tESBL\tMDR(1)_or_SUS(0)\n";
    }
    if ($_ !~ /Patient/){
#	print "$_\n";
	@mic = split/\t/,$_;
	for $m (0..$#mic){}
	$data = "$mic[0]\t$mic[1]\t$mic[2]";
	if ($mic[3] > 0){
	     $esblceph = "0";
	}
	if ($mic[3] == 0){
	    $esblceph = "0";
	}
	if ($mic[3] eq "ND" | $mic[3] eq "."){ 
	    $esblceph = "0";
	}
	if ($mic[4] > 0){
	    $pen = "1";
	}
	if ($mic[4] == 0){
	    $pen = "0";
	}
	if ($mic[4] eq "ND" | $mic[4] eq "."){
	    $pen = "0";
	}
	if ($mic[5] > 0){
	    $fpi = "1";
	}
	if ($mic[5] == 0){
	    $fpi = "0";
	}
	if ($mic[5] eq "ND" | $mic[5] eq "."){
	    $fpi = "0";
	}
	if ($mic[6] > 0){
	    $penbla = "1";
	}
	if ($mic[6] == 0){
	    $penbla = "0";
	}
	if ($mic[6] eq "ND" | $mic[6] eq "."){
	    $penbla = "0";
	}
	if ($mic[7] > 0){
	    $fpi = "1";
#	    print "$data\t1\n";
	}
	if ($mic[7] == 0){
	    $fpi = "0";
	}
	if ($mic[7] eq "ND"| $mic[7] eq "."){
	    $fpi = "0";
	}
	if ($mic[8] > 0){
	    $agly = "0";
#	    print "$data\t1\n";
	}
	if ($mic[8] == 0){
	    $agly = "0";
	}
	if ($mic[8] eq "ND" | $mic[8] eq "."){
	    $agly = "0";
	}
	if ($mic[9] > 0){
	    $esblceph = "0";
	}
	if ($mic[9] == 0){
	    $esblceph = "0";
	}
	if ($mic[9] eq "ND" | $mic[9] eq "."){
	    $esblceph = "0";
	}
	if ($mic[10] > 0){
	    $astaph = "0";
	}
	if ($mic[10] == 0){
	    $astaph = "0";
	}
	if ($mic[10] eq "ND" | $mic[10] eq "."){
	    $astaph = "0";
	}
	if ($mic[11] > 0){
	    $q = "1";
	}
	if ($mic[11] == 0){
	    $q = "0";
	}
	if ($mic[11] eq "ND" | $mic[11] eq "."){
	    $q = "0";
	}
	if ($mic[12] > 0){
	    $fq = "1";
	}
	if ($mic[12] == 0){
	    $fq = "0";
	}
	if ($mic[12] eq "ND" | $mic[12] eq "."){
	    $fq = "0";
	}
	if ($mic[13] > 0){
	    $nit = "1";
	}
	if ($mic[13] == 0){
	    $nit = "0";
	}
	if ($mic[13] eq "ND" | $mic[13] eq "."){
	    $nit = "0";
	}
	if ($mic[14] > 0){
	    $tet = "1";
	}
	if ($mic[14] == 0){
	    $tet = "0";
	}
	if ($mic[14] eq "ND" | $mic[14] eq "."){
	    $tet = "0";
	}
	if ($mic[15] > 0){
	    $oxazo = "0";
	}
	if ($mic[15] == 0){
	    $oxazo = "0";
	}
	if ($mic[15] eq "ND" | $mic[15] eq "."){
	    $oxazo = "0";
	}
	if ($mic[16] > 0){
	    $mac = "0";
	}
	if ($mic[16] == 0){
	    $mac = "0";
	}
	if ($mic[16] eq "ND" | $mic[16] eq "."){
	    $mac = "0";
	}
	if ($mic[17] > 0){
	    $glyco = "0";
	}
	if ($mic[17] == 0){
	    $glyco = "0";
	}
	if ($mic[17] eq "ND" | $mic[17] eq "."){
	    $glyco = "0";
	}
###ESBL analysis:
        if ($mic[3] > 0){$cro = "1";} if ($mic[3] == 0){$cro = "0";} #if ($mic[5] eq "ND" | $mic[5] =~ /^ *$/){ $cro = "0";}
	if ($mic[9] > 0){$caz = "1";} if ($mic[9] == 0){$caz = "0";} #if($mic[6] eq "ND" | $mic[6] =~ /^ *$/){ $caz = "0";}
	$sumesbl = $cro+$caz;
#	print "$data\t$sumesbl\n"; 
	if ($sumesbl == 0){ $esblonly = "0";}
	if ($sumesbl == 2){$esblonly = "0.5";}
	if ($sumesbl == 4 ){$esblonly = "1";}
	$mdr = $esblceph+$pen+$fpi+$penbla+$agly+$astaph+$q+$fq+$tet+$oxazo+$mac+$glyco;
#	print "$data\t$mdr\n";
	if ($mdr > 2){
#	    print "$data\t$mdr\tMDR\n";
	    print "$data\t$esblonly\t1\n";
	}
	if ($mdr <= 2 ){
#	    print "$data\t$mdr\tSUS\n";
#	    print  "$data\t$esblonly\t0\n";
	}
    }
}




close(IN1);
close(OUT1);

exit;

#7_AMP108_AMC309_CRO3010_CAZ3011_CTX3012_FEP3013_TZP11014_MEM1015_F10016_RL2517_W518_CN1019_CIP20_TET3021_AK3022_Fox3023_E1524_VA3025_LZ1026_C3027_CC10  



