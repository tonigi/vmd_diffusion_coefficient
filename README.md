VMD Diffusion Coefficient Tool
================================

Toni Giorgino — © ISIB-CNR 2012, Universitat Pompeu Fabra 2011

The Diffusion Coefficient Tool is an analysis plugin for VMD that
computes one, two or three-dimensional MSD-based diffusion
coefficients of a chosen molecular species.

This is experimental software. If you don't know how to compute the
diffusion coefficient yourself, probably you won't be able to use this
software. NO support or warranty is available whatsoever.

Important: please check the current version of software and 
documentation at its home-page:

http://www.multiscalelab.org/utilities/DiffusionCoefficientTool



Installation
----------------------------------------

1. Download the latest release and extract it in a directory of your
   choice. 

2. Add the following instructions to your ```.vmdrc``` file 

        lappend auto_path /WHERE/YOU/EXTRACTED/THE/TOOL
        vmd_install_extension diffusion_coefficient_gui \
      	  diffusion_coefficient_gui::diffusion_coefficient_tk \
	        "Analysis/Diffusion Coefficient Tool"
        menu main on

