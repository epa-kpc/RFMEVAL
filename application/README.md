# MODEL APPLICATION

For two of the reduced complexity tools (InMAP and EASIUR), run control files were constructed to clearly indicate what model options were selected so other users can reproduce the model results. 

InMAP and EASIUR have run control files that identify relevant input files (i.e., scenario specific emissions) and the location and naming convention for scenario specific output files. 

As distributed, APEEP does not include a run control file or standardized set of input or output files, only MATLAB files that users must modify to include emission scenario specific information. A list of MATLAB subroutines, and the subroutines themselves, are provided so users understand the sequence of subroutine execution. Some of the APEEP code was modified to direct the modeling system to specific emission input files with scenario specific information and to automatically generate output files with the predicted air quality surface. The code also needed to be modified to reflect scenario specific information (e.g., value of statistical life). 


