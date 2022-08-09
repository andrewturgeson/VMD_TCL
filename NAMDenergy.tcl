#runs NAMDenergy function for VMD and writes the results for docked ligands. There are problems with memory leaks due to atomselect commands.

foreach A { vc1042 vca0862 } {
	package require namdenergy
	cd ~/namd/fadl_new/alphafold/REU
	#cd ~/namd/fadl_new/0ssh/alphafold/PDB
	set original [mol new ${A}_all.psf]
	mol addfile ${A}_all.dcd waitfor all	

	set prefix "/home/andy/namd/fadl_new/Excel/toppar/"
	set j 1

	foreach i {par_all36_carb.prm par_all36_cgenff.prm par_all36_lipid.prm par_all36_na.prm par_all36m_prot.prm par_interface.prm toppar_all36_carb_glycolipid.str toppar_all36_carb_glycopeptide.str toppar_all36_carb_imlab.str toppar_all36_label_fluorophore.str toppar_all36_label_spin.str toppar_all36_lipid_archaeal.str toppar_all36_lipid_bacterial.str toppar_all36_lipid_cardiolipin.str toppar_all36_lipid_cholesterol.str toppar_all36_lipid_dag.str toppar_all36_lipid_detergent.str toppar_all36_lipid_ether.str toppar_all36_lipid_hmmm.str toppar_all36_lipid_inositol.str toppar_all36_lipid_lnp.str toppar_all36_lipid_lps.str toppar_all36_lipid_miscellaneous.str toppar_all36_lipid_model.str toppar_all36_lipid_mycobacterial.str toppar_all36_lipid_prot.str toppar_all36_lipid_sphingo.str toppar_all36_lipid_tag.str toppar_all36_lipid_yeast.str toppar_all36_na_nad_ppi.str toppar_all36_na_rna_modified.str toppar_all36_nano_lig.str toppar_all36_nanolig_patch.str toppar_all36_polymer_solvent.str toppar_all36_prot_arg0.str toppar_all36_prot_c36m_d_aminoacids.str toppar_all36_prot_fluoro_alkanes.str toppar_all36_prot_heme.str toppar_all36_prot_modify_res.str toppar_all36_prot_na_combined.str toppar_all36_prot_retinol.str toppar_all36_synthetic_polymer.str toppar_all36_synthetic_polymer_patch.str toppar_dum_noble_gases.str toppar_ions_won.str toppar_water_ions.str } {
		set P${j} "{${prefix}${i}}"
		incr j
	}

	foreach B { F G H I J } {
		for {set C 1} {$C <= 10} {incr C} { 

			set fnum [molinfo $original get numframes]

			set temp [atomselect $original "protein or segname ${B}${C}" frame 0]
			$temp writepsf temp_afg.psf
			$temp writepdb temp_afg.pdb
			set new [mol new temp_afg.psf]
			mol addfile temp_afg.pdb
			for {set i 1} {$i < $fnum} {incr i} {
				set temp [atomselect $original "protein or segname ${B}${C}" frame $i]
				$temp writepdb temp_afg.pdb
				mol addfile temp_afg.pdb molid $original
			}

			set sel [atomselect $new "protein and not hydrogen"]
			set sel2 [atomselect $new "segname ${B}${C} and not hydrogen"]
			set out "/home/andy/namd/fadl_new/Excel/${A}_AFG/${B}${C}.csv"
			#set out "/home/andy/namd/fadl_new/Excel/${A}_AFAD/${B}${C}.csv"

			namdenergy -nonb -sel $sel $sel2 -par $P1 -par $P2 -par $P3 -par $P4 -par $P5 -par $P6 -par $P7 -par $P8 -par $P9 -par $P10 -par $P11 -par $P12 -par $P13 -par $P14 -par $P15 -par $P16 -par $P17 -par $P18 -par $P19 -par $P20 -par $P21 -par $P22 -par $P23 -par $P24 -par $P25 -par $P26 -par $P27 -par $P28 -par $P29 -par $P30 -par $P31 -par $P32 -par $P33 -par $P34 -par $P35 -par $P36 -par $P37 -par $P38 -par $P39 -par $P40 -par $P41 -par $P42 -par $P43 -par $P44 -par $P45 -par $P46 -ofile ${out} -T 310 -cutoff 12 -switch 10 -timemult 5000

			mol delete $new
			#exec sed -i "s/ \+/,/g" $out
			
		}
	}	
}
cd /home/andy/namd/fadl_new/
