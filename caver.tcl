#### probe radius ####
#generates the predicted pathways for V. cholerae FadL

set num 30
set probe 1.0
set psqu [expr $probe*$probe]
set add 0.1
set move [expr $probe + $add]
set probeA 5
set pAsqu [expr $probeA*$probeA]


set w 7
set r 1
set range $probe

draw delete all
mol off all
######################
### start b2344 ####
######################

set res {}
mol top $ecoli_lps
mol on $ecoli_lps
animate goto 14

set file [open "ecoli_lps_clusters.txt" r]
gets $file line
puts $line
set A [subst {$line}]
gets $file line
puts $line
set B [subst {$line}]
gets $file line
puts $line
set C [subst {$line}]
close $file
set D {9 10 16.3}
foreach {xA yA zA} $A {break}
foreach {xB yB zB} $B {break}
foreach {xC yC zC} $C {break}
foreach {xD yD zD} $D {break}
#foreach {xE yE zE} $E {break}

mol modmaterial 0 top Transparent

mol modselect 1 top "protein and resid 103 104 105 106 121 122 123 124 153 155 157 2 253 254 255 269 3 301 304 315 316 317 360 361 5 52 75 76 77 78
"
mol modstyle 1 top lines 2
mol modcolor 1 top ColorID 16

set array {}
#################### 
set nodefrom A
set nodeto B
draw color blue
####################
foreach {xA yA zA} [set $nodefrom] {break}
draw sphere [set $nodefrom] radius $r

for {set i 0} {$i <= $num} {incr i} {

	set selres [atomselect top "protein and ((x-$xA)*(x-$xA) + (y-$yA)*(y-$yA) + (z-$zA)*(z-$zA)) < $pAsqu" ]
	set list [$selres get resid]
	set slist [lsort -unique $list] 
	puts $slist
	foreach j $slist {
		lappend res $j
	}

	set sel [atomselect top "not protein and ((x-$xA)*(x-$xA) + (y-$yA)*(y-$yA) + (z-$zA)*(z-$zA)) < $psqu" ]
	set selnum [$sel num]
	if {$selnum == 0} {
		set vector [subst {$xA $yA $zA}]
		lappend array $vector
	} else {
		set cen [measure center $sel]
		foreach {xA yA zA} $cen {break}
		set vector [subst {$xA $yA $zA}]	
		lappend array $vector
	}
	set xrh [expr [set x$nodeto] + $range]
 	set xrl [expr [set x$nodeto] - $range]
	set yrh [expr [set y$nodeto] + $range]
 	set yrl [expr [set y$nodeto] - $range]
	set zrh [expr [set z$nodeto] + $range]
 	set zrl [expr [set z$nodeto] - $range]
	
	if { $xA < $xrh && $xA > $xrl && $yA < $yrh && $yA > $yrl && $zA < $zrh && $zA > $zrl} 	{break}   

	set vectorN [vecnorm [vecsub [set $nodeto] $vector]]
	set vector [vecscale $vectorN $move]
	set xA [expr $xA + [lindex $vector 0]]
	set yA [expr $yA + [lindex $vector 1]]
	set zA [expr $zA + [lindex $vector 2]]
}


set len [expr [llength $array] - 1]
for {set i 0} {$i < $len} {incr i} {
	set p1 [lindex $array $i]
	set next [expr $i + 1]
	set p2 [lindex $array $next]
	draw line $p1 $p2 width $w style dashed
}

set array {}
#################### 
set nodefrom B
set nodeto C
draw color green
####################
foreach {xA yA zA} [set $nodefrom] {break}
draw sphere [set $nodefrom] radius $r

for {set i 0} {$i <= $num} {incr i} {

	set selres [atomselect top "protein and ((x-$xA)*(x-$xA) + (y-$yA)*(y-$yA) + (z-$zA)*(z-$zA)) < $pAsqu" ]
	set list [$selres get resid]
	set slist [lsort -unique $list] 
	foreach j $slist {
		lappend res $j
	}

	set sel [atomselect top "not protein and ((x-$xA)*(x-$xA) + (y-$yA)*(y-$yA) + (z-$zA)*(z-$zA)) < $psqu" ]
	set selnum [$sel num]
	if {$selnum == 0} {
		set vector [subst {$xA $yA $zA}]
		lappend array $vector
	} else {
		set cen [measure center $sel]
		foreach {xA yA zA} $cen {break}
		set vector [subst {$xA $yA $zA}]	
		lappend array $vector
	}
	set xrh [expr [set x$nodeto] + $range]
 	set xrl [expr [set x$nodeto] - $range]
	set yrh [expr [set y$nodeto] + $range]
 	set yrl [expr [set y$nodeto] - $range]
	set zrh [expr [set z$nodeto] + $range]
 	set zrl [expr [set z$nodeto] - $range]
	
	if { $xA < $xrh && $xA > $xrl && $yA < $yrh && $yA > $yrl && $zA < $zrh && $zA > $zrl} 	{break}   

	set vectorN [vecnorm [vecsub [set $nodeto] $vector]]
	set vector [vecscale $vectorN $move]
	set xA [expr $xA + [lindex $vector 0]]
	set yA [expr $yA + [lindex $vector 1]]
	set zA [expr $zA + [lindex $vector 2]]
}

set len [expr [llength $array] - 1]
for {set i 0} {$i < $len} {incr i} {
	set p1 [lindex $array $i]
	set next [expr $i + 1]
	set p2 [lindex $array $next]
	draw line $p1 $p2 width $w style dashed
}

set array {}
#################### 
set nodefrom C
set nodeto D
draw color blue
####################
foreach {xA yA zA} [set $nodefrom] {break}
draw sphere [set $nodefrom] radius $r

for {set i 0} {$i <= $num} {incr i} {

	set selres [atomselect top "protein and ((x-$xA)*(x-$xA) + (y-$yA)*(y-$yA) + (z-$zA)*(z-$zA)) < $pAsqu" ]
	set list [$selres get resid]
	set slist [lsort -unique $list] 
	foreach j $slist {
		lappend res $j
	}

	set sel [atomselect top "not protein and ((x-$xA)*(x-$xA) + (y-$yA)*(y-$yA) + (z-$zA)*(z-$zA)) < $psqu" ]
	set selnum [$sel num]
	if {$selnum == 0} {
		set vector [subst {$xA $yA $zA}]
		lappend array $vector
	} else {
		set cen [measure center $sel]
		foreach {xA yA zA} $cen {break}
		set vector [subst {$xA $yA $zA}]	
		lappend array $vector
	}
	set xrh [expr [set x$nodeto] + $range]
 	set xrl [expr [set x$nodeto] - $range]
	set yrh [expr [set y$nodeto] + $range]
 	set yrl [expr [set y$nodeto] - $range]
	set zrh [expr [set z$nodeto] + $range]
 	set zrl [expr [set z$nodeto] - $range]
	
	if { $xA < $xrh && $xA > $xrl && $yA < $yrh && $yA > $yrl && $zA < $zrh && $zA > $zrl} 	{break}   

	set vectorN [vecnorm [vecsub [set $nodeto] $vector]]
	set vector [vecscale $vectorN $move]
	set xA [expr $xA + [lindex $vector 0]]
	set yA [expr $yA + [lindex $vector 1]]
	set zA [expr $zA + [lindex $vector 2]]
}

set len [expr [llength $array] - 1]
for {set i 0} {$i < $len} {incr i} {
	set p1 [lindex $array $i]
	set next [expr $i + 1]
	set p2 [lindex $array $next]
	draw line $p1 $p2 width $w style dashed
}

draw sphere [set $nodeto]
 
set ecoli_lps_res [lsort -unique $res]

