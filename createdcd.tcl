#the commented sections are for fitting the trajectories to one another. 
foreach A {b2344 vc1042 vc1043 vca0862} {
#	set C [mol new ../../../alphafold/REU/PDB/${A}.psf]
#	mol addfile ../../../alphafold/REU/PDB/${A}.pdb
#	set to [atomselect $C protein]
	mol new PDB/${A}/${A}_1.psf
	mol addfile PDB/${A}/${A}_1.pdb
#	set from [atomselect top protein]
#	set all [atomselect top all]
#	set M [measure fit $from $to]	
#	$all move $M

#	set to [atomselect top protein frame 0]
	
	for {set B 2} {$B <= 50} {incr B} {
		#set C [expr $B - 1]
		mol addfile PDB/${A}/${A}_${B}.pdb
		#set from [atomselect top "protein" frame $C]
		#set all [atomselect top all frame $C]
		#set M [measure fit $from $to]
		#$all move $M
	}
	set sel [atomselect top all]
	$sel writepsf ${A}_all.psf
	animate write dcd ${A}_all.dcd beg 0 end 49 waitfor all sel $sel top
}
