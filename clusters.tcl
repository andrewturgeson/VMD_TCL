#this detects if any clusters have stray ligands and removes the cluster from the file if necessary.

#source 0loadall.tcl

set k 0
set dist 7

foreach i {b2344 vc1042 vc1043 vca0862} {
	set file [open "data/clusters/0clusters_command_${i}.txt" w]; 
	puts -nonewline $file "paste "	
	close $file
}

#set i ecoli_lps


set b2344list {0 0 0 0 0 0 0 0 0}
set vc1042list {0 0 0 0 0 0 0 0 0}
set vc1043list {0 0 0 0 0 0 0 0 0}
set vca0862list {0 0 0 0 0 0 0 0 0}


for {set k 0} {$k < 50} {incr k} {
	animate goto $k
foreach i {b2344 vc1042 vc1043 vca0862} {
	
	set clusters ""
	set A [set $i]
	mol top $A
	draw delete all
	set file [open "clusters_${i}_7.txt" r]
	while {[gets $file line] >= 0} {
		puts $line
		set j [subst {$line}]
		lappend clusters $j
		draw sphere $j radius 2
	}
	close $file
	set sel [atomselect $A all]
	$sel set beta 0
	set len [llength $clusters]	
	set d 0	
	set true 1
	while {$true} {
		for {set j 0} {$j < $len} {incr j} {
				
		set selText "same residue as (beta 0 and not protein and " 
		set selText2 ")"		
		set sizesq [expr $d*$d]

		set xA [lindex [lindex $clusters $j] 0]
		set yA [lindex [lindex $clusters $j] 1]
		set zA [lindex [lindex $clusters $j] 2]
				
		if {$xA >= 0 && $yA >= 0 && $zA >= 0} {	
		set sel [atomselect top "$selText (  ((x-$xA)*(x-$xA)+(y-$yA)*(y-$yA) + (z-$zA)*(z-$zA)) < $sizesq  ) $selText2"]
	} elseif {$xA <= 0 && $yA >= 0 && $zA >= 0} {	
		set xA [expr -$xA]
		set sel [atomselect top "$selText (  ((x+$xA)*(x+$xA)+(y-$yA)*(y-$yA) + (z-$zA)*(z-$zA)) < $sizesq  ) $selText2"]
		} elseif {$xA <= 0 && $yA <= 0 && $zA >= 0} {	
		set xA [expr -$xA]
		set yA [expr -$yA]		
		set sel [atomselect top "$selText (  ((x+$xA)*(x+$xA)+(y+$yA)*(y+$yA) + (z-$zA)*(z-$zA)) < $sizesq  ) $selText2"]
		} elseif {$xA <= 0 && $yA <= 0 && $zA <= 0} {
		set xA [expr -$xA]
		set yA [expr -$yA]
		set zA [expr -$zA]
		set sel [atomselect top "$selText (  ((x+$xA)*(x+$xA)+(y+$yA)*(y+$yA) + (z+$zA)*(z+$zA)) < $sizesq  ) $selText2"]
		} elseif {$xA >= 0 && $yA <= 0 && $zA <= 0} {
		set yA [expr -$yA]
		set zA [expr -$zA]	
		set sel [atomselect top "$selText (  ((x-$xA)*(x-$xA)+(y+$yA)*(y+$yA) + (z+$zA)*(z+$zA)) < $sizesq  ) $selText2"]
		} elseif {$xA >= 0 && $yA >= 0 && $zA <= 0} {	
		set zA [expr -$zA]		
		set sel [atomselect top "$selText (  ((x-$xA)*(x-$xA)+(y-$yA)*(y-$yA) + (z+$zA)*(z+$zA)) < $sizesq  ) $selText2"]
		} elseif {$xA <= 0 && $yA >= 0 && $zA <= 0} {	
		set xA [expr -$xA]				
		set zA [expr -$zA]
		set sel [atomselect top "$selText (  ((x+$xA)*(x+$xA)+(y-$yA)*(y-$yA) + (z+$zA)*(z+$zA)) < $sizesq  ) $selText2"]
	 	} elseif {$xA >= 0 && $yA <= 0 && $zA >= 0} {	
		set yA [expr -$yA]
		set sel [atomselect top "$selText (  ((x-$xA)*(x-$xA)+(y+$yA)*(y+$yA) + (z-$zA)*(z-$zA)) < $sizesq  ) $selText2"]
		}	

		$sel set beta [expr $j + 1]
		incr d
		set sel [atomselect top "not protein and beta 0"]
		set true [$sel num]
		}
	}
	
	
	for {set a 1} {$a <= $len} { incr a } {
		set f [expr $a - 1] 		
		set b [atomselect top "beta $a and name C1"]
		set c [$b num]		
		set d [lindex [set ${i}list] $f]
		set e [expr $c + $d]
		
		#puts "$i: beta:$a num:$c total:$e"		
		set ${i}list [lreplace [set ${i}list] $f $f $e]
	}

	for {set j 1} {$j <= $len} {incr j} {
		set file [open "data/clusters/${i}-${j}-${k}.csv" w]
		puts $file ${j}-${k}
		close $file
		set file [open "data/clusters/${i}-${j}-${k}.csv" a] 
		set sel [atomselect top "not protein and name C1 and beta $j"]
		foreach l [$sel get segname] {
			puts $file $l
		}
		close $file

		set $file [ open "data/clusters/0clusters_command_${i}.txt" a]
		puts -nonewline $file "${i}-${j}-${k}.csv "
		close $file

		#exec paste data/clusters/${i}.csv data/clusters/${i}-${j}.csv > data/clusters/temp.csv
		#exec mv data/clusters/temp.csv data/clusters/${i}.csv  
	}
};#foreach i 1t16 ecoli...
};#k 1..50


foreach i {b2344 vc1042 vc1043 vca0862} {
	set file [open "data/clusters/0clusters_command_${i}.txt" a]; 
	puts -nonewline $file " > 0${i}.csv "	
	close $file
}


puts $b2344list
puts $vc1042list
puts $vc1043list
puts $vca0862list

foreach i {b2344 vc1042 vc1043 vca0862} {
	set clusters ""
	set A [set $i]
	mol top $A
	draw delete all
	set file [open "clusters_${i}_7.txt" r]
	while {[gets $file line] >= 0} {
		puts $line
		set j [subst {$line}]
		lappend clusters $j
		draw sphere $j radius 2
	}
	close $file

	set len [llength $clusters]	
	for {set j 0} {$j < $len} {incr j} {
		set F [ lindex [set ${i}list] $j]
		if {$F < 150} {
			set G [lindex $clusters $j]
			puts "$i - $G"
			if {0} {			
				if {$G != "-5.241238594055176 -5.4114484786987305 32.07015609741211"} {				
					exec sed -i "/$G/d" clusters_${i}_7.txt  
				}
			}		
		}		
	}
}
