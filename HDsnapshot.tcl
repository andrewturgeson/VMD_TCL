#takes HD snapshots of preset configurations for presentation.
source proclabel.tcl

#for {set pic 6} {$pic <= 10} {incr pic} { 
for {set pic 1} {$pic <= 6} {incr pic} {

color Display Background white 
display projection orthographic
axes location off

display resize 800 800

mol off $1t16
mol off $ecoli
mol off $ecoli_lps
mol off $NP230687
mol off $NP230688
mol off $NP233248

 if {$pic == 1} {
	mol on $1t16
	for {set i 4} {$i <= 13} {incr i} {
		mol showrep $1t16 $i off
	}
	mol selection "not hydrogen and resid 104 366 362 56 54 74 3 390 105 5 2 52 103 410"
	mol material AOChalky
	mol representation Licorice
	mol color "Type"
	mol addrep $1t16
	mol top $1t16

	display resetview
	scale 1 0.12	
	rotate x by -90
	rotate y by -135
	translate 1 -0.7 -0.5 0
	set textSize 1.5


	draw delete all
	draw color black
	line_res 104 3.5 4.5 -1.7 $textSize
	line_res 366 6 7.5 1.1 $textSize
	label_res 362 5 5 1.9 $textSize
	label_res 56 3 6 0 $textSize
	line_res 74 1 1 -2 $textSize 
	label_res 3 12 8 -1.4 $textSize
	label_res 390 6 6 -1.5 $textSize
	#label_res 315 6 6 -1.2 $textSize
	line_res 105 -0.5 0.5 -1 $textSize
	label_res 5 1.9 -1.3 -1.1 $textSize
	label_res 54 -1.8 1.8 0 $textSize
	line_res 2 4 6 0.4 $textSize
	line_res 52 5 5.5 -2.5 $textSize
	line_res 103 3 6 -1.3 $textSize
	line_res 410 5 7 0.4 $textSize
 	
	set outName ../pics_HD/1t16-residues-S3.bmp
	render Tachyon $outName "/usr/local/lib/vmd/tachyon_LINUXAMD64" -aasamples 12 %s -format TARGA -o %s.tga -res 4000 4000


	#315 255 253 2 52 103 157 254 317 410
	#2 52 103 410

	mol showrep $1t16 14 off
	

	mol selection "not hydrogen and resid 157 253 254 255 315 317"
	mol material AOChalky
	mol representation Licorice
	mol color "Type"
	mol addrep $1t16
	mol top $1t16

	display resetview
	scale 1 0.10	
	rotate x by -90
	rotate y by 110
	translate 1 0 -2.25 -0.25
	display cuedensity 0.21
	display nearclip set 0.01
	set textSize 1.5


	draw delete all
	draw color black
	label_res 157 -18 13 0 $textSize
	line_res 253 -1 -1 -1.5 $textSize
	line_res 254 -1 -1 2 $textSize
	label_res 255 0 3.7 -1.75 $textSize 
	line_res 315 -18 6 -1 $textSize
	line_res 317 2.7 -1.6 -1.9 $textSize

	set outName ../pics_HD/1t16-residues-lowaffinity.bmp
	render Tachyon $outName "/usr/local/lib/vmd/tachyon_LINUXAMD64" -aasamples 12 %s -format TARGA -o %s.tga -res 4000 4000
	
 } elseif {$pic == 2} {
	mol on $ecoli_lps
	for {set i 4} {$i <= 13} {incr i} {
		mol showrep $ecoli_lps $i off
	}
	#set sel [atomselect top "resid 2 5 52 54 56 74 75 77 103 104 105 253 254 255 315 316 361 362 363 366"] 	
	mol selection "not hydrogen and resid 2 5 52 54 56 74 75 77 103 104 105 361 362 363 366"
	mol material AOChalky
	mol representation Licorice
	mol color "Type"
	mol addrep $ecoli_lps
	mol top $ecoli_lps

	display resetview
	scale 1 0.12	
	rotate x by -90
	rotate y by -135
	translate 1 -0.7 -0.5 0
	rotate x by 15
	set textSize 1


	draw delete all
	draw color black
	label_res 2 5 5.5 0.45 $textSize
	label_res 5 5 5 0.5 $textSize
	line_res 52 5 6 -0.5 $textSize
	label_res 54 3 6 1.5 $textSize
	label_res 56 6 5 0.5 $textSize
	line_res 74 4 5.5 1.5 $textSize
	line_res 75 0 2 -1.0 $textSize
	label_res 77 4 0 1.5 $textSize
	label_res 103 5 5 1.5 $textSize
	label_res 104 7.5 3 1.25 $textSize
	line_res 105 6 4 0.5 $textSize
	label_res 361 8 5 3.5 $textSize
	line_res 362 5 7 3.5 $textSize
	label_res 363 12 8 0.95 $textSize
	label_res 366 16 9 5.25 $textSize
 	
	#set outName ../pics_HD/ecoli_lps-residues-S3.bmp
#	render Tachyon $outName "/usr/local/lib/vmd/tachyon_LINUXAMD64" -aasamples 12 %s -format TARGA -o %s.tga -res 4000 4000
	#315 255 253 2 52 103 157 254 317 410
	#2 52 103 410

	mol showrep $ecoli_lps 14 off
	

	mol selection "not hydrogen and resid 253 254 255 315 316"
	mol material AOChalky
	mol representation Licorice
	mol color "Type"
	mol addrep $ecoli_lps
	mol top $ecoli_lps

	display resetview
	scale 1 0.10	
	rotate x by -90
	
	translate 1 0 -2.25 -0.25
	display cuedensity 0.21
	display nearclip set 0.01
	rotate y by -45
	set textSize 1

	draw delete all
	draw color black
	label_res 253 4 -3 0 $textSize
	label_res 254 5 -3.5 0 $textSize
	label_res 255 4 -3.25 0 $textSize
	label_res 315 4.5 -3 0 $textSize
	label_res 316 3 -3 -1.25 $textSize
	
	set outName ../pics_HD/ecoli_lps-residues-lowaffinity.bmp
	render Tachyon $outName "/usr/local/lib/vmd/tachyon_LINUXAMD64" -aasamples 12 %s -format TARGA -o %s.tga -res 4000 4000

 } elseif {$pic == 3} {
	
	mol on $ecoli
	animate goto 38
	for {set i 4} {$i <= 13} {incr i} {
		mol showrep $ecoli $i off
	}
	mol selection "not hydrogen and resid 104 366 362 74 390 315 105 5 54 52 77 7"
	mol material AOChalky
	mol representation Licorice
	mol color "Type"
	mol addrep $ecoli
	mol top $ecoli

	display resetview
	scale 1 0.12	
	rotate x by -90
	rotate y by -135
	translate 1 -0.7 -0.5 0
	set textSize 1

	draw delete all
	draw color black
	line_res 104 6 5 2.6 $textSize
	label_res 366 8 3 2.5 $textSize
	line_res 362 5 5.5 1 $textSize
	line_res 74 5 5.5 0 $textSize
	label_res 390 3 6 -1.2 $textSize
	line_res 105 5 6 -0.6 $textSize
	line_res 5 5 6 -0.5 $textSize
	line_res 54 6 5 1 $textSize
	line_res 52 6 5.5 -1.2 $textSize
	line_res 77 3 1 1.3 $textSize
	line_res 7 5 6 -0.5 $textSize
	
	#316 318 165

	set outName ../pics_HD/ecoli-residues-S3.bmp
	render Tachyon $outName "/usr/local/lib/vmd/tachyon_LINUXAMD64" -aasamples 12 %s -format TARGA -o %s.tga -res 4000 4000

	mol showrep $ecoli 14 off
	

	mol selection "not hydrogen and resid 157 253 254 255 315 317 316 318 165"
	mol material AOChalky
	mol representation Licorice
	mol color "Type"
	mol addrep $ecoli
	mol top $ecoli

	display resetview
	scale 1 0.10	
	rotate x by -90
	rotate y by 190
	translate 1 0 -2.25 -0.25
	display cuedensity 0.21
	display nearclip set 0.01
	set textSize 1

	draw delete all
	draw color black
	line_res 157 0 5 0 $textSize
	label_res 253 -2 0 -0.5 $textSize
	label_res 254 2 1 1.1 $textSize
	label_res 255 5 5 0 $textSize
	line_res 315 0.4 9 -2 $textSize
 	line_res 316 0.4 9 3 $textSize
	line_res 317 1 8 0 $textSize
	label_res 318 0 8 0 $textSize
	set outName ../pics_HD/ecoli-residues-lowaffinity.bmp
	render Tachyon $outName "/usr/local/lib/vmd/tachyon_LINUXAMD64" -aasamples 12 %s -format TARGA -o %s.tga -res 4000 4000

 } elseif {$pic == 4} {	
	mol on $NP230687
	animate goto 38
	for {set i 4} {$i <= 13} {incr i} {
		mol showrep $NP230687 $i off
	}
	mol selection "protein and not hydrogen and resid 3 4 5 108 339 77 54 52 396 335 56 331 272 243 244 336 1 79 334 241"
	#3 4 5 108 339 77 54 52 396 335 56 331 272 243 244 336 1 79 334 241
	#4 3 5 272 1 108 244 243 339 336
	mol material AOChalky
	mol representation Licorice
	mol color "Type"
	mol addrep $NP230687
	mol top $NP230687

	display resetview
	scale 1 0.07	
	rotate x by -90
	rotate y by -135
	rotate x by -20
	translate 1 0 -0.5 0
	set textSize 1
	
	draw delete all
	draw color black
	line_res 1 16 16 -10 $textSize
	label_res 3 17 13 -8.5 $textSize
	label_res 4 17 15 -7 $textSize
	label_res 5 14 10 -10 $textSize
 	line_res 108 10 9 0 $textSize
	line_res 339 9 11 -6 $textSize
	label_res 396 10 14 -6 $textSize
 	label_res 77 10 15 -5 $textSize
	label_res 54 8 12 -5 $textSize
	line_res 52 12.3 10 -4.5 $textSize
	line_res 56 10 14 -6 $textSize
	label_res 334 10 13 -6 $textSize	
	line_res 335 10.5 9 -3.3 $textSize	
	line_res 336 10 8 -3 $textSize
	line_res 331 10 10 -3 $textSize
	label_res 79 0 0 -0.8 $textSize
	

	line_res 241 10 12 -5 $textSize
	line_res 243 10 11.5 -5 $textSize
	line_res 244 10 11.5 -5 $textSize
	line_res 272 10 11 -7 $textSize
	
	set outName ../pics_HD/NP230687-residues.bmp
	render Tachyon $outName "/usr/local/lib/vmd/tachyon_LINUXAMD64" -aasamples 12 %s -format TARGA -o %s.tga -res 4000 4000

	draw delete all
	mol selection "not protein and not hydrogen"
	mol material AOChalky
	mol representation QuickSurf 0.6 2.7 0.5
	mol color "ColorID" 31
	mol addrep $NP230687
	mol top $NP230687
	
	set outName ../pics_HD/NP230687-residues_tunnel.bmp
	render Tachyon $outName "/usr/local/lib/vmd/tachyon_LINUXAMD64" -aasamples 12 %s -format TARGA -o %s.tga -res 4000 4000

 } elseif {$pic == 5} {
	mol on $NP230688
	animate goto 38
	for {set i 4} {$i <= 13} {incr i} {
		mol showrep $NP230688 $i off
	}
	mol selection "protein and not hydrogen and resid 108 3 300 298 4 238 268 163 161 274 241 129 339 296 276 266 240 127 338 330"
	mol material AOChalky
	mol representation Licorice
	mol color "Type"
	mol addrep $NP230688
	mol top $NP230688

	display resetview
	scale 1 0.09	
	rotate x by -90
	rotate y by -135
	translate 1 0 -0.5 0
	set textSize 1
	
	draw delete all
	draw color black
	line_res 108 10 11 -2 $textSize
	line_res 3 10 12 0.5 $textSize
	label_res 300 17 10 1.3 $textSize
	line_res 298 8 10 1 $textSize
	label_res 4 10 11.5 -3.5 $textSize
	label_res 238 14 8.4 0 $textSize
	label_res 268 17 13 2 $textSize
	label_res 163 11 10 2.6 $textSize
	line_res 161 10 11 1.2 $textSize
	label_res 274 12 8 -0.7 $textSize
	label_res 241 14 10 -2.3 $textSize
	line_res 129 10 10.5 1.2 $textSize
	label_res 339 10 11 -.7 $textSize
	label_res 296 14 10 -2.5 $textSize
	line_res 276 11 10 1.7 $textSize
	label_res 266 17.5 12 -0.8 $textSize
	line_res 240 12 10 1.7 $textSize
	line_res 127 8 15 0.5 $textSize
	line_res 338 10 11 1 $textSize
	line_res 330 10 15 1.5 $textSize

	set outName ../pics_HD/NP230688-residues.bmp
	render Tachyon $outName "/usr/local/lib/vmd/tachyon_LINUXAMD64" -aasamples 12 %s -format TARGA -o %s.tga -res 4000 4000

	draw delete all

	display resetview
	scale 1 0.09	
	rotate x by -90
	rotate y by -135
	translate 1 0 -0.5 0
	rotate x by 90

	set outName ../pics_HD/NP230688-residues_top.bmp
	render Tachyon $outName "/usr/local/lib/vmd/tachyon_LINUXAMD64" -aasamples 12 %s -format TARGA -o %s.tga -res 4000 4000

	display resetview
	scale 1 0.09	
	rotate x by -90
	rotate y by -135
	translate 1 0 -0.5 0
	
	mol selection "not protein and not hydrogen"
	mol material AOChalky
	mol representation QuickSurf 0.6 4.1 0.5
	mol color "ColorID" 31
	mol addrep $NP230688
	mol top $NP230688
	
	set outName ../pics_HD/NP230688-residues_lowaffinity.bmp
	render Tachyon $outName "/usr/local/lib/vmd/tachyon_LINUXAMD64" -aasamples 12 %s -format TARGA -o %s.tga -res 4000 4000	

} elseif {$pic == 6} {
	mol on $NP233248
	animate goto 38
	for {set i 4} {$i <= 13} {incr i} {
		mol showrep $NP233248 $i off
	}
	mol selection "protein and not hydrogen and resid 102 74 72 119 151 5 101 52 76 54 121 71 327 75 330 100 2 103 117 379"
	mol material AOChalky
	mol representation Licorice
	mol color "Type"
	mol addrep $NP233248
	mol top $NP233248

	display resetview
	scale 1 0.1
	rotate x by -90
	rotate y by -115
	translate 1 -0.45 -0.25 0
	set textSize 1

	draw delete all
	draw color black
	
	line_res 102 10 6 1 $textSize
	label_res 74 1 0 1 $textSize
	label_res 72 0 1.5 -1 $textSize
	label_res 119 7 -2.5 0 $textSize
	line_res 151 0 0 1 $textSize
	label_res 5 5 -2 -2 $textSize
	label_res 101 10 0 1.2 $textSize
	line_res 52 10 6 -3 $textSize
	label_res 76 10 5 -2.7 $textSize
	label_res 54 10 7 0 $textSize
	label_res 121 10 -1.7 0 $textSize
	label_res 71 10 1.25 -1 $textSize
	line_res 327 10 6 .75 $textSize
	line_res 75 10 6.5 -5 $textSize
	label_res 330 10 0 0 $textSize
	label_res 100 10 2 -1.6 $textSize
	line_res 2 0 0.2 0.6 $textSize
	line_res 103 10 7 1 $textSize
	label_res 117 10 0 0.5 $textSize
	line_res 379 10 7 0.5 $textSize

	set outName ../pics_HD/NP233248-residues.bmp
	render Tachyon $outName "/usr/local/lib/vmd/tachyon_LINUXAMD64" -aasamples 12 %s -format TARGA -o %s.tga -res 4000 4000

	draw delete all
	mol selection "not protein and not hydrogen and within 5 of (protein and not hydrogen and resid 102 74 72 119 151 5 101 52 76 54 121 71 327 75 330 100 2 103 117 379)"
	mol material AOChalky
	mol representation QuickSurf 0.6 4.1 0.5
	mol color "ColorID" 31
	mol addrep $NP233248
	mol top $NP233248
	
	set outName ../pics_HD/NP233248-residues_S3.bmp
	render Tachyon $outName "/usr/local/lib/vmd/tachyon_LINUXAMD64" -aasamples 12 %s -format TARGA -o %s.tga -res 4000 4000
	
	rotate x by 90
	set outName ../pics_HD/NP233248-residues_S3_top.bmp
	render Tachyon $outName "/usr/local/lib/vmd/tachyon_LINUXAMD64" -aasamples 12 %s -format TARGA -o %s.tga -res 4000 4000
	
	
} elseif {$pic == 7} {
	mol on $1t16
	animate goto 11
	for {set i 4} {$i <= 13} {incr i} {
		mol showrep $1t16 $i off
	}
	mol selection "not hydrogen and not protein"
	mol material AOChalky
	mol representation Licorice
	mol color "ColorID" 21
	mol addrep $1t16
	
	mol selection "not hydrogen and not protein"
	mol material Transparent
	mol representation Quicksurf 0.5 0.5 0.5 4
	mol color "ColorID" 21
	mol addrep $1t16
	mol top $1t16

	display resetview
	scale 1 0.05
	rotate x by -90
	rotate y by -135
	translate 1 0 -0.5 0
	
	set outName ../pics_HD/1t16-channel.bmp
	render Tachyon $outName "/usr/local/lib/vmd/tachyon_LINUXAMD64" -aasamples 12 %s -format TARGA -o %s.tga -res 4000 4000

} elseif {$pic == 8} {
	animate goto 47
	mol on $ecoli
	for {set i 4} {$i <= 13} {incr i} {
		mol showrep $ecoli $i off
	}
	mol selection "not hydrogen and not protein"
	mol material AOChalky
	mol representation Licorice
	mol color "ColorID" 21
	mol addrep $ecoli
	
	mol selection "not hydrogen and not protein"
	mol material Transparent
	mol representation Quicksurf 0.5 0.5 0.5 4
	mol color "ColorID" 21
	mol addrep $ecoli
	mol top $ecoli

	display resetview
	scale 1 0.05
	rotate x by -90
	rotate y by -135
	translate 1 0 -0.5 0

	set outName ../pics_HD/ecoli-channel.bmp
	render Tachyon $outName "/usr/local/lib/vmd/tachyon_LINUXAMD64" -aasamples 12 %s -format TARGA -o %s.tga -res 4000 4000

 } elseif {$pic == 9} {
	animate goto 18
	mol on $NP230687
	for {set i 4} {$i <= 13} {incr i} {
		mol showrep $NP230687 $i off
	}
	mol selection "not hydrogen and not protein"
	mol material AOChalky
	mol representation Licorice
	mol color "ColorID" 21
	mol addrep $NP230687
	
	mol selection "not hydrogen and not protein"
	mol material Transparent
	mol representation Quicksurf 0.5 0.5 0.5 4
	mol color "ColorID" 21
	mol addrep $NP230687
	mol top $NP230687

	display resetview
	scale 1 0.05
	rotate x by -90
	rotate y by -105
	translate 1 0 -0.5 0

	set outName ../pics_HD/NP230687-channel.bmp
	render Tachyon $outName "/usr/local/lib/vmd/tachyon_LINUXAMD64" -aasamples 12 %s -format TARGA -o %s.tga -res 4000 4000

 } elseif {$pic == 10} {
	animate goto 49
	mol on $NP230688
	for {set i 4} {$i <= 13} {incr i} {
		mol showrep $NP230688 $i off
	}
	mol selection "not hydrogen and not protein"
	mol material AOChalky
	mol representation Licorice
	mol color "ColorID" 21
	mol addrep $NP230688
	
	mol selection "not hydrogen and not protein"
	mol material Transparent
	mol representation Quicksurf 0.5 0.5 0.5 4
	mol color "ColorID" 21
	mol addrep $NP230688
	mol top $NP230688

	display resetview
	scale 1 0.05
	rotate x by -90
	rotate y by +185
	translate 1 0 -0.5 0

	set outName ../pics_HD/NP230688-channel.bmp
	render Tachyon $outName "/usr/local/lib/vmd/tachyon_LINUXAMD64" -aasamples 12 %s -format TARGA -o %s.tga -res 4000 4000

 } elseif {$pic == 11} {
	animate goto 43
	mol on $NP233248
	for {set i 4} {$i <= 13} {incr i} {
		mol showrep $NP233248 $i off
	}
	mol selection "not hydrogen and not protein"
	mol material AOChalky
	mol representation Licorice
	mol color "ColorID" 21
	mol addrep $NP233248
	
	mol selection "not hydrogen and not protein"
	mol material Transparent
	mol representation Quicksurf 0.5 0.5 0.5 4
	mol color "ColorID" 21
	mol addrep $NP233248
	mol top $NP233248

	display resetview
	scale 1 0.05
	rotate x by -90
	rotate y by +160
	translate 1 0 -0.5 0
	set textSize 1

	set outName ../pics_HD/NP233248-channel.bmp
	render Tachyon $outName "/usr/local/lib/vmd/tachyon_LINUXAMD64" -aasamples 12 %s -format TARGA -o %s.tga -res 4000 4000
 }
}
