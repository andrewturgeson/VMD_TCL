#finds the docked cluster centers using a meanshift algorithm and writes to file
set A vca0862
exec echo "$A"

mol new ${A}_all.psf
mol addfile ${A}_all.dcd

draw delete all
#set frame 18
set nodes ""
set clusters ""
unset nodes
for {set frame 0} {$frame < 50} {incr frame} {

set dist 7
set name "clusters_${A}_${dist}.txt"

for {set i -22} {$i <= 22 } {incr i $dist} {
for {set j -22} {$j <= 22 } {incr j $dist} {
for {set k -35} {$k <= 66 } {incr k $dist} {
	animate goto $frame	
	set check 0
	set cen 0 
	set xA $i
	set yA $j
	set zA $k
	set sizesq [expr $dist*$dist]
	
	#set sub [subst {$xA $yA $zA}]	
	#draw sphere $sub radius $dist

	for {set h 0} {$h <= 10} {incr h} {
		set selText "not protein and not hydrogen and " 
		
		if {$xA >= 0 && $yA >= 0 && $zA >= 0} {	
		set sel [atomselect top "$selText (  ((x-$xA)*(x-$xA)+(y-$yA)*(y-$yA) + (z-$zA)*(z-$zA)) < $sizesq  )"]
		} elseif {$xA <= 0 && $yA >= 0 && $zA >= 0} {	
		set xA [expr -$xA]
		set sel [atomselect top "$selText (  ((x+$xA)*(x+$xA)+(y-$yA)*(y-$yA) + (z-$zA)*(z-$zA)) < $sizesq  )"]
		} elseif {$xA <= 0 && $yA <= 0 && $zA >= 0} {	
		set xA [expr -$xA]
		set yA [expr -$yA]		
		set sel [atomselect top "$selText (  ((x+$xA)*(x+$xA)+(y+$yA)*(y+$yA) + (z-$zA)*(z-$zA)) < $sizesq  )"]
		} elseif {$xA <= 0 && $yA <= 0 && $zA <= 0} {
		set xA [expr -$xA]
		set yA [expr -$yA]
		set zA [expr -$zA]
		set sel [atomselect top "$selText (  ((x+$xA)*(x+$xA)+(y+$yA)*(y+$yA) + (z+$zA)*(z+$zA)) < $sizesq  )"]
		} elseif {$xA >= 0 && $yA <= 0 && $zA <= 0} {
		set yA [expr -$yA]
		set zA [expr -$zA]	
		set sel [atomselect top "$selText (  ((x-$xA)*(x-$xA)+(y+$yA)*(y+$yA) + (z+$zA)*(z+$zA)) < $sizesq  )"]
		} elseif {$xA >= 0 && $yA >= 0 && $zA <= 0} {	
		set zA [expr -$zA]		
		set sel [atomselect top "$selText (  ((x-$xA)*(x-$xA)+(y-$yA)*(y-$yA) + (z+$zA)*(z+$zA)) < $sizesq  )"]
		} elseif {$xA <= 0 && $yA >= 0 && $zA <= 0} {	
		set xA [expr -$xA]				
		set zA [expr -$zA]
		set sel [atomselect top "$selText (  ((x+$xA)*(x+$xA)+(y-$yA)*(y-$yA) + (z+$zA)*(z+$zA)) < $sizesq  )"]
	 	} elseif {$xA >= 0 && $yA <= 0 && $zA >= 0} {	
		set yA [expr -$yA]
		set sel [atomselect top "$selText (  ((x-$xA)*(x-$xA)+(y+$yA)*(y+$yA) + (z-$zA)*(z-$zA)) < $sizesq  )"]
		}	

		set check [$sel num]
		if {$check} {
			set cen [measure center $sel weight mass]
			set xA [lindex $cen 0]
			set yA [lindex $cen 1]
			set zA [lindex $cen 2]	
		} else {			
			break
		}
	}
	if {$cen != 0} {
		#draw sphere $cen radius 2
		#puts "Appending $cen"
		set check [$sel num]
		if { $check !=0 } {
			lappend nodes $cen
		}
	}
}}}

	} ;#frame loop

set nodes [lsort -unique $nodes]
set l [llength $nodes]
unset clusters 
lappend clusters [lindex $nodes 0]

for {set i 1} {$i < $l} {incr i} {
	set add 1	
	set v [lindex $nodes $i]
	foreach j $clusters {
		set d [vecdist $v $j]
		if {$d <= $dist} {
		set add 0
		}
	}
	if {$add} {
		lappend clusters [lindex $nodes $i]	
	}
}

lsort -index 2 $clusters
set nodenum [llength $clusters]
foreach i $clusters {draw sphere $i radius $dist}
foreach i $clusters {puts $i}
set sel [atomselect top all]
$sel set beta 0
set dist 0
set true 1



if {0} {
while {$true} {
	for {set i 0} {$i < $nodenum} {incr i} {  
		
		set selText "not protein and " 
		set sizesq [expr $dist*$dist]

		if {$xA >= 0 && $yA >= 0 && $zA >= 0} {	
		set sel [atomselect top "$selText (  ((x-$xA)*(x-$xA)+(y-$yA)*(y-$yA) + (z-$zA)*(z-$zA)) < $sizesq  )"]
		} elseif {$xA <= 0 && $yA >= 0 && $zA >= 0} {	
		set sel [atomselect top "$selText (  ((x+$xA)*(x+$xA)+(y-$yA)*(y-$yA) + (z-$zA)*(z-$zA)) < $sizesq  )"]
		} elseif {$xA <= 0 && $yA <= 0 && $zA >= 0} {	
		set sel [atomselect top "$selText (  ((x+$xA)*(x+$xA)+(y+$yA)*(y+$yA) + (z-$zA)*(z-$zA)) < $sizesq  )"]
		} elseif {$xA <= 0 && $yA <= 0 && $zA <= 0} {	
		set sel [atomselect top "$selText (  ((x+$xA)*(x+$xA)+(y+$yA)*(y+$yA) + (z+$zA)*(z+$zA)) < $sizesq  )"]
		} elseif {$xA >= 0 && $yA <= 0 && $zA <= 0} {	
		set sel [atomselect top "$selText (  ((x-$xA)*(x-$xA)+(y+$yA)*(y+$yA) + (z+$zA)*(z+$zA)) < $sizesq  )"]
		} elseif {$xA >= 0 && $yA >= 0 && $zA <= 0} {	
		set sel [atomselect top "$selText (  ((x-$xA)*(x-$xA)+(y-$yA)*(y-$yA) + (z+$zA)*(z+$zA)) < $sizesq  )"]
		} elseif {$xA <= 0 && $yA >= 0 && $zA <= 0} {	
		set sel [atomselect top "$selText (  ((x+$xA)*(x+$xA)+(y-$yA)*(y-$yA) + (z+$zA)*(z+$zA)) < $sizesq  )"]
	 	} elseif {$xA >= 0 && $yA <= 0 && $zA >= 0} {	
		set sel [atomselect top "$selText (  ((x-$xA)*(x-$xA)+(y+$yA)*(y+$yA) + (z-$zA)*(z-$zA)) < $sizesq  )"]
		}		
		$sel set beta [expr $i + 1]
		incr dist
		set sel [atomselect top "beta 0"]
		set true [$sel num]
	}
}
}

set file [open $name w] ; foreach i $clusters { puts $file $i } ; close $file

exit
