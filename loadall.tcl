#load all b2344 vc1042 vc1043 vca0862 trajectories, nodes, and dockings as well as makes them presentable in VMD.
set prot 0
set fa 0
set node 1

foreach A { b2344 vc1042 vc1043 vca0862} {
	set $A [mol new ${A}_all.psf]
	mol addfile ${A}_all.dcd waitfor all
	mol rename top ${A}
	
	mol modselect 0 [set $A] "protein"
	mol modstyle 0 [set $A] NewCartoon
	mol modcolor 0 [set $A] "Structure"
	
	if {$prot} {
		mol modmaterial 0 [set $A] "AOChalky"	
	} else {
		mol modmaterial 0 [set $A] "Transparent"
	}
	if {$fa} {
		set colorarray {18 17 4 32 3 31 1 7 29 23}
		set array_seg {"A" "B" "C" "D" "E" "F" "G" "H" "I" "J"}
		for {set i 0} {$i < 10} {incr i} {
			set segn [lindex $array_seg $i] 
			mol selection "not hydrogen and chain ${segn}"
			mol material AOChalky
			mol representation Licorice
			mol color "ColorID" [lindex $colorarray $i]
			mol addrep top
		}
	}

	if {$node} {
		set file [open "clusters_${A}_7.txt" r]
		set colors {24 7 11 21 13 1 3 4 9 5 6}
#1 = blue
#2 = green
#3 = purple
#4 = cyan
		set col 0
		while {[gets $file line] >= 0} {			
			puts $line
			set j [subst {$line}]
			draw color [lindex $colors $col] ; incr col 		
			draw material AOChalky
			draw sphere $j radius 3	resolution 100
		}
	}
}
