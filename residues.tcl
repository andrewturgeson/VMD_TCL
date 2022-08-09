#This determines what residues are found near what docked fatty acid ligands and combines them into .csv files. 

set prefix {"A" "B" "C" "D" "E" "F" "G" "H" "I" "J"}
#set array {"1t16" "ecoli" "NP230687" "NP230688" "NP233248"}
set array {b2344 vc1042 vc1043 vca0862}

for {set E 46} {$E <= 50} {incr E} {
	foreach A $array {
		set var [set $A]
		foreach B $prefix {
			for {set C 1} {$C <= 10} {incr C} {		
				set file [open "data/cat/residues_${A}-${B}-${C}.csv" w]
				close $file
				set file [open "data/cat/residues_${A}-${B}-${C}.csv" a] 
				puts $file "$A-$B-$C-$E"	
				set sel [atomselect $var "segname P and within 3 of segname ${B}${C}" frame $E]
				set holder ""				
				foreach D [$sel get index] {
					set res [atomselect $var "index $D" frame $E]
					set restest [$res get resid]
					if {$restest == $holder} { 							
									
					} else {
						set holder $restest
						puts -nonewline $file "[$res get resname][$res get resid], "
						if {[$res get basic]} {puts $file "Pos"	
						} elseif {[$res get basic]} {puts $file "Neg"
						} elseif {[$res get polar]} {puts $file "PN" 
						} elseif {[$res get hydrophobic]} {puts $file "HP"}
					}
				}
			close $file
			}
		}
	}


	#paste
	foreach A $array {
		set var [set $A]
		foreach B $prefix {
			exec paste data/cat/residues_${A}-${B}-1.csv data/cat/residues_${A}-${B}-2.csv data/cat/residues_${A}-${B}-3.csv data/cat/residues_${A}-${B}-4.csv data/cat/residues_${A}-${B}-5.csv data/cat/residues_${A}-${B}-6.csv data/cat/residues_${A}-${B}-7.csv data/cat/residues_${A}-${B}-8.csv data/cat/residues_${A}-${B}-9.csv data/cat/residues_${A}-${B}-10.csv > data/cat/residues_${A}-${E}-${B}.csv
		}
	}
#erase
	if {1} {
		foreach A $array {
			set var [set $A]
			foreach B $prefix {
				for {set C 1} {$C <= 10} {incr C} {	
					exec rm data/cat/residues_${A}-${B}-${C}.csv	
				}
			}
		}	
	}	
}
