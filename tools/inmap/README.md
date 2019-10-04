# WRF-CMAQ Preprocessor for InMAP

# Overview
These scripts prepare CMAQ concentration and WRF meteorology output to be read into the InMAP preprocessing system. 
Conversions are made to align WRF and CMAQ data spatially along the x, y, and z axes. The MCIP METCRO3D files is used to calculate altitude.
Data slicing is used to obtain and align data temporally.
The resulting netCDF file is read into a modified version of the wrfchem InMAP preprocessing module.
In the interest of leveraging existing libraries and modules this process involves two steps using two different languages.

# Requirements
- The gen_wrfcmaq.py script requires python 3.5+ with modules netCDF4 (1.2.9+) and pandas (0.20.1+).
- InMAP 1.4.1 (this method is untested with later versions)
- CMAQ, WRF, and MCIP METCRO3D daily output files that are on alignable domains (same projection and nestable) with the same 2D resolution and the same layer definition.
- The layers may be related by the included 35 to 25 layer mapping file or with some modification another mapping file.
- m3tools (only needed for date looping in csh script)

# Notes
  Many of the steps, ancillary files, and settings are specific to the 2011 test run on a 12 km CONUS domain using WRF, CMAQ, and MCIP outputs. These scripts were not designed as a universal out-of-the box solution and need configuration for each specific platform.

# CMAQ Output Preprocessing
The CMAQ output concentrations were preprocessed into lumped pollutants with a mass over volume concentration using MCIP air density. Partitioning variables were also calculated.
The calculations are defined in: spec_def_cmaq2inmap_2018feb02_2011data.txt
The base script, gen_wrfcmaq.py, assumes that the calculations and conversions have already been done.
An experimental version of the WRF-CMAQ processing script is included that makes these calculations, gen_wrfcmaq.mwconv.py. It is untested and to be used at your own risk. The calculated values must be verified to confirm that the script is functioning.


# WRF and CMAQ Output Processing
The processer, gen_wrfcmaq.py, takes WRF meteorological outputs and CMAQ concentration outputs and combines them into a single netCDF file with the same dimensions.
The daily processed netCDFs contain the variables needed to be passed to the InMAP preprocessor.

- The example driver script gen_wrfcmaq_2011.csh was used to generate 2011 InMAP preprocessor inputs. The paths will need to be modified to point to inputs on each specific system. Modifications to file names may also need to be made depending on configuration. The environment variables are set and described in the first 18 lines of this script.
- To simplify the process, verify that the files fauxioapi.py, gen_wrfcmaq.py, griddesc.txt, and vert_layers_35_to_25.csv are all in the
  same path. 
- The provided files are setup to work with a 12 km LCC CONUS domain with conversion from 35 and 25 vertical layers where needed. The script can automatically handle conversion between nested grids of the same resolution provided that the grid definitions are populated in the griddesc.txt file (see IOAPI documentation for more information). Inputs with the same vertical layering do not get layer adjustments.

Setup and running
1) Set the work path in the gen_wrfcmaq_2011.csh driver script to the location where the python files were unpackaged.
2) Update the paths to the raw WRF outputs, the daily MCIP METCRO3D files, and the CMAQ daily concentration outputs. All files must use the same grid size on nestable domains. 
3) Set the year and start date in Julian format.
4) The IOAPI utilities path is optional and is used for looping over dates. Other scripting options may be used to loop over dates.
5) Modify any of the file naming variables such as wrf, mcip, etc. to match the conventions on your platform.
6) If needed, change the name of the WRF grid domain in gen_wrfcmaq.py (wrf_grid on line 233). This name must exist in the griddesc.txt file and the definition must match the projection, origination, and dimensions of the WRF files.
7) Run the gen_wrfcmaq_2011.csh script. 

This will take over 24 hours to process the full year on an 8th generation Intel Core i7 with 32 GB available. Each daily output file is ~5 GB compressed.
The script has internal dimensional and time step checks that can cause fatal errors when mismatches occur.

# InMAP Preprocessing
The InMAP Preprocessor is part of the InMAP system. Modified go code, additional scripts, and configuration files are included under the inmap subdirectory.
The go code is a modified version of the WRFCHEM preprocessor from InMAP 1.4.1. These files may not work with more recent versions of InMAP.
The preprocessor reads the daily output from the gen_wrfcmaq.py program and outputs to a single annual file with the necessary variables.

- Two preprocessor go modules are included for the WRFCMAQ model type: wrfcmaq.go.2007 and wrfcmaq.go.nlcd2011. Each version uses a different land cover mapping that matches the land cover used in the respective WRF runs. Changes to land cover, even within the same land cover product, may require new mappings. The mappings can be found in the NLCDseinfeld and NLCDwesely variables. Modifications requires documentation of the land cover index used in a specific WRF run.
- Two configuration files are also include: inmap/inmap/WRFCmaq_2007.toml and inmap/inmap/WRFCmaq_2011.toml. The only differences are the dates. The configuration files will need to be updated if different dates, projections, or modeling domains are used.

# Setup and running
1) Select the preprocessor go module and copy to the file wrfcmaq.go in the root inmap path.
2) Copy the configuration files and the preprocessor driver script inmap_preproc.csh to the location where the preprocessor is run.
3) Backup the modules cmd.go and preproc.go under the inmaputil directory in the root inmap path. Copy the replacement modules from this package to that location.
4) Edit the selected configuration file to match the date, domain, input, and output paths for the InMAP preprocessor. 
5) Edit inmap_preproc.csh to match paths and names of the inmap executable and inputs. Set the program to use the selected configuration file. 
6) Run the inmap_preproc.sh script

