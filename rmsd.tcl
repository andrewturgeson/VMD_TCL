#finds the RMSD between two trajectories.
foreach A { 1t16 ecoli_lps } {
	set ind 0
	set $A [mol new combined/${A}-1.psf]
	for {set dcdnum 1} {$dcdnum <= 50} {incr dcdnum} {		
		mol addfile combined/${A}-${dcdnum}.pdb
	}
}

#RMSD selection:
#2 5 54 56 74 103 104 105 362 366
set res "2 5 54 56 74 103 104 105 362 366"

for {set i 0} {$i < 50} {incr i} {
	set froma [atomselect $1t16 "not hydrogen and protein and resid ${res}" frame $i]
	set toa [atomselect $ecoli_lps "not hydrogen and protein and resid ${res}" frame $i]
	set m [measure rmsd $froma $toa]
	puts "${i}: $m"
}
