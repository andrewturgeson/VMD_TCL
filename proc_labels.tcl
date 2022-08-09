#Creates the commands to create labels next to protein residues based on index selection, and lines from protein residues to the labels

proc label_atom {index label xmod ymod zmod size} {
    set sel [atomselect top "protein and index $index"]
    if {[$sel num] != 1} {
        error "label_atom: 'selection_string' must select 1 atom"
    }
    # get the coordinates of the atom
    #lassign [$sel get {x y z}] coord
    
    foreach c1 [$sel get {x y z}] {break}	
    foreach {x1 y1 z1} $c1 {break}	
    set x2 [expr $x1 + $xmod]
    set y2 [expr $y1 + $ymod]
    set z2 [expr $z1 + $zmod]
    set coord [subst {$x2 $y2 $z2}]
	
    # and draw the text
    draw text $coord $label size $size

}

proc label_res {res xmod ymod zmod size} {
    set sel [atomselect top "protein and resid $res"]
    set names [$sel get resname]
    foreach name $names {break}  
    set label "${name}${res}"
		
    set cen [measure center $sel] 	
    foreach {x1 y1 z1} $cen {break}	
    set x2 [expr $x1 + $xmod]
    set y2 [expr $y1 + $ymod]
    set z2 [expr $z1 + $zmod]
    set coord [subst {$x2 $y2 $z2}]

    # and draw the text
    draw text $coord $label size $size
} 

proc line_res {res xmod ymod zmod size} {
    set sel [atomselect top "protein and  resid $res"]
    set names [$sel get resname]
    foreach name $names {break}  
    set label "${name}${res}"
		
    set cen [measure center $sel] 	
    foreach {x1 y1 z1} $cen {break}	
    set x2 [expr $x1 + $xmod]
    set y2 [expr $y1 + $ymod]
    set z2 [expr $z1 + $zmod]
    set coord [subst {$x2 $y2 $z2}]
    
    # and draw the text
    draw text $coord $label size $size
    draw line $coord $cen
}
