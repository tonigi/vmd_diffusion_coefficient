# This script tests the diffusion coefficient tools command line.
#
# It relies on membrane simulation data provided as supporting
# information of: Guixà-González R, Rodriguez-Espigares I,
# Ramírez-Anguita JM, Carrió-Gaspar P, Martinez-Seara H, Giorgino T,
# et al. MEMBPLUGIN: studying membrane complexity in
# VMD. Bioinformatics. 2014 May
# 15;30(10):1478–80. doi:10.1093/bioinformatics/btu037
#
# The data is downloaded from the internet the first time the script
# is run.
# 


exec wget -c https://master.dl.sourceforge.net/project/membplugin/Case%20Study/CaseStudy_files.zip
exec unzip CaseStudy_files.zip

# The topology
mol new case_study_systems/1_1.psf

# The data file: 200 frames, 20 ns, i.e. 100 ps per frame
mol addfile case_study_systems/1_1_20ns.dcd waitfor all

# Helper to pretty print on file in tall format
proc printout {l2 fn} {
    set f [open $fn w]
    foreach tau [lindex $l2 0] msd [lindex $l2 1] {
	puts $f [format "%.2f %.2f" $tau $msd]
    }
    close $f
}



package require diffusion_coefficient

# Lateral diffusion of POPC lipids
set popc_msd_xy [ diffusion_coefficient -dt 0.1 -alongx 1 -alongy 1 -alongz 0 -msd range -selection "resname POPC and name P" ]
printout $popc_msd_xy popc_msd_xy.dat

# Lateral diffusion of cholesterol
set chl_msd_xy [ diffusion_coefficient -dt 0.1 -alongx 1 -alongy 1 -alongz 0 -msd range -selection "resname CHL1 and name C1" ]
printout $chl_msd_xy popc_chl_xy.dat


# Diff
exec diff popc_msd_xy.dat popc_msd_xy.reference
exec diff chl_msd_xy.dat chl_msd_xy.reference
