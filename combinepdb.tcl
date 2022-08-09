#combines docked fatty acids and proteins into one pdb 50 times for 50 trajectories.
if {1} {
	foreach A {b2344 vc1042 vc1043 vca0862} {
		mol new ../../../alphafold/REU/I-TASSER/$A.psf
		mol addfile ../../../alphafold/REU/I-TASSER/$A.dcd last 0
		set sel [atomselect top protein]
		$sel set segname P
		$sel writepsf ${A}.psf
		mol delete top
	}
}

package require psfgen
resetpsf

for {set A 1} {$A <= 50} {incr A} {
	foreach B {b2344 vc1042 vc1043 vca0862} {
		mol new ../docking/${A}/${B}.psf
		mol addfile ../docking/${A}/${B}.pdb		
		set sel [atomselect top all]
		$sel set segname P
		$sel writepdb tempFadL.pdb
		mol delete top

		readpsf ${B}.psf
		coordpdb tempFadL.pdb
		
		foreach C {16-1 18-2 18-3a 18-3y 20-3 20-4 20-5 22-6 LDA C8E} {
			for {set D 1} {$D <= 10} {incr D} {
				readpsf temp/${A}/${B}-${C}-${D}.psf
				coordpdb temp/${A}/${B}-${C}-${D}.pdb
			}
		}
		guesscoord
		writepsf PDB/${B}/${B}_${A}.psf
		writepdb PDB/${B}/${B}_${A}.pdb
		resetpsf
	}	
}
