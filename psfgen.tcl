#Generates psf files for docked fatty acid ligands. The C8E files were generated with open babel and each atom had to be renamed individually. 
#VMD has some problems with memory leaks so be aware that this may need to be broken up into smaller sections.

package require psfgen
topology ../top/C8E4.top
topology ../top/top_all36_lipid.inp
topology ../top/top_all36_prot.rtf
topology ../top/top_all36_cgenff.rtf
topology ../top/toppar_all36_lipid_detergent.str

pdbalias residue ALI ALIN
pdbalias residue DGL DGLA
pdbalias residue ARA ARAN
pdbalias residue PAL PALO
pdbalias residue EIC LINP
pdbalias residue LNL ALINP
pdbalias residue LAX DGLAP
pdbalias residue ACD ARANP
pdbalias residue HXA DHAP
pdbalias residue PAM PALOP
pdbalias residue ECOP EPAP
pdbalias residue LDA LDAO
resetpsf

set array_mol {b2344 vc1042 vc1043 vca0862}

set array_FA { 16-1 18-2 18-3a 18-3y 20-3 20-4 20-5 22-6 LDA C8E }
for {set E 1} {$E <= 50 } {incr E} {

	foreach A $array_mol {
		foreach B $array_FA {
			if {$B == "16-1"} { set D "A" } elseif { $B == "18-2" } { set D "B" } elseif { $B == "18-3a" } { set D "C" } elseif { $B == "18-3y" } { set D "D" } elseif { $B == "20-3" } { set D "E" } elseif { $B == "20-4" } { set D "F" } elseif { $B == "20-5" } { set D "G" } elseif { $B == "22-6" } { set D "H" } elseif { $B == "C8E" } { set D "J" } elseif { $B == "LDA" } { set D "I" }
			for {set C 1} {$C <= 10} {incr C} {
				resetpsf
				segment ${D}${C} {pdb ../docking/${E}/dock/confPDB/${A}-${B}-${C}.pdb}
				coordpdb ../docking/${E}/dock/confPDB/${A}-${B}-${C}.pdb
				guesscoord
				writepdb temp/${E}/${A}-${B}-${C}.pdb
				writepsf temp/${E}/${A}-${B}-${C}.psf
			}
		}
	}
}

for {set E 1} {$E <= 50 } {incr E} {
	foreach A $array_mol {
		set B C8E
		for {set C 1} {$C <= 10} {incr C} {
			mol new temp/${E}/${A}-${B}-${C}.psf
			mol addfile temp/${E}/${A}-${B}-${C}.pdb

			set sel [atomselect top "index 0"]
			$sel set type CTL3
			$sel set name C8
			
			set sel [atomselect top "index 1"]
			$sel set type CTL2
			$sel set name C7
			
			set sel [atomselect top "index 2"]
			$sel set type CTL2
			$sel set name C6

			set sel [atomselect top "index 3"]
			$sel set type CTL2
			$sel set name C5

			set sel [atomselect top "index 4"]
			$sel set type CTL2
			$sel set name C4
			
			set sel [atomselect top "index 5"]
			$sel set type CTL2
			$sel set name C3

			set sel [atomselect top "index 6"]
			$sel set type CTL2
			$sel set name C2

			set sel [atomselect top "index 7"]
			$sel set type CTL2
			$sel set name C1

			set sel [atomselect top "index 8"]
			$sel set type OC301
			$sel set name 1O1

			set sel [atomselect top "index 9"]
			$sel set type CC321
			$sel set name 1C1

			set sel [atomselect top "index 10"]
			$sel set type CC321
			$sel set name 1C2

			set sel [atomselect top "index 11"]
			$sel set type OC301
			$sel set name 1O2

			set sel [atomselect top "index 12"]
			$sel set type CC321
			$sel set name 2C1

			set sel [atomselect top "index 13"]
			$sel set type CC321
			$sel set name 2C2

			set sel [atomselect top "index 14"]
			$sel set type OC301
			$sel set name 2O2

			set sel [atomselect top "index 15"]
			$sel set type CC321
			$sel set name 3C1

			set sel [atomselect top "index 16"]
			$sel set type CC321
			$sel set name 3C2

			set sel [atomselect top "index 17"]
			$sel set type OC301
			$sel set name 3O2

			set sel [atomselect top "index 18"]
			$sel set type CC321
			$sel set name 4C1

			set sel [atomselect top "index 19"]
			$sel set type CC321
			$sel set name 4C2
#End OH- Oxygen
			set sel [atomselect top "index 20"]
			$sel set type OC311M
			$sel set name 4O2

			set sel [atomselect top "index 21"]
			$sel set type HAL3
			$sel set name H8R
			
			set sel [atomselect top "index 22"]
			$sel set type HAL3
			$sel set name H8S

			set sel [atomselect top "index 23"]
			$sel set type HAL3
			$sel set name H8T

			set sel [atomselect top "index 24"]
			$sel set type HAL2
			$sel set name H7R
			
			set sel [atomselect top "index 25"]
			$sel set type HAL2
			$sel set name H7S

			set sel [atomselect top "index 26"]
			$sel set type HAL2
			$sel set name H6R

			set sel [atomselect top "index 27"]
			$sel set type HAL2
			$sel set name H6S

			set sel [atomselect top "index 28"]
			$sel set type HAL2
			$sel set name H5R

			set sel [atomselect top "index 29"]
			$sel set type HAL2
			$sel set name H5S

			set sel [atomselect top "index 30"]
			$sel set type HAL2
			$sel set name H4R

			set sel [atomselect top "index 31"]
			$sel set type HAL2
			$sel set name H4S

			set sel [atomselect top "index 32"]
			$sel set type HAL2
			$sel set name H3R

			set sel [atomselect top "index 33"]
			$sel set type HAL2
			$sel set name H3S

			set sel [atomselect top "index 34"]
			$sel set type HAL2
			$sel set name H2R

			set sel [atomselect top "index 35"]
			$sel set type HAL2
			$sel set name H2S

			set sel [atomselect top "index 36"]
			$sel set type HAL2
			$sel set name H1R

			set sel [atomselect top "index 37"]
			$sel set type HAL2
			$sel set name H1S

			set sel [atomselect top "index 38"]
			$sel set type HCA2
			$sel set name 1H11

			set sel [atomselect top "index 39"]
			$sel set type HCA2
			$sel set name 1H12

			set sel [atomselect top "index 40"]
			$sel set type HCA2
			$sel set name 1H21

			set sel [atomselect top "index 41"]
			$sel set type HCA2
			$sel set name 1H22

			set sel [atomselect top "index 42"]
			$sel set type HCA2
			$sel set name 2H11

			set sel [atomselect top "index 43"]
			$sel set type HCA2
			$sel set name 2H12

			set sel [atomselect top "index 44"]
			$sel set type HCA2
			$sel set name 2H21

			set sel [atomselect top "index 45"]
			$sel set type HCA2
			$sel set name 2H22

			set sel [atomselect top "index 46"]
			$sel set type HCA2
			$sel set name 3H11

			set sel [atomselect top "index 47"]
			$sel set type HCA2
			$sel set name 3H12

			set sel [atomselect top "index 48"]
			$sel set type HCA2
			$sel set name 3H21

			set sel [atomselect top "index 49"]
			$sel set type HCA2
			$sel set name 3H22

			set sel [atomselect top "index 50"]
			$sel set type HCA2
			$sel set name 4H11

			set sel [atomselect top "index 51"]
			$sel set type HCA2
			$sel set name 4H12
			
			set sel [atomselect top "index 52"]
			$sel set type HCA2
			$sel set name 4H21

			set sel [atomselect top "index 53"]
			$sel set type HCA2
			$sel set name 4H22

			set sel [atomselect top "index 54"]
			$sel set type HCP1M
			$sel set name 4HO2

			set sel [atomselect top all]
			$sel writepsf temp/${E}/${A}-${B}-${C}.psf
			$sel writepdb temp/${E}/${A}-${B}-${C}.pdb

			mol delete top
		}
	}
}
