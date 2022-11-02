This directory includes the data and scripts used in "Fitting phenological curves with GLMMs" (Edwards and Crone 2020). Scripts were last run in R version 4.0.0, and the two key scripts are Rmarkdown files (.Rmd). For those unfamiliar with the file format, it allows the combination of R code with document formatting using the Markdown language; there are considerable resources available online to introduce you to the use of Rmarkdown. Rmarkdown files are most easily viewed and edited in the free IDE Rstudio. 

Appendix S2 (a tutorial walking through our methods) was generated from "appendix S2 - methods_demo_BCB.Rmd". Appendix S3 (the analysis and figure generation for the main text) was generated from "appedix S3 - analysis.Rmd".

Complete file structure:

README.txt - this document
gaussian_sharable_directory.Rproj - an Rproject for this directory, to ensure the here() function behaves correctly in the two key scripts.
1_raw_data/ - directory for data files
    BCBcounts v2.csv - data on the baltimore checkerspot from 2012-2019. "year" and "date" columns provide the day of observation, 
           "count" contains the number of butterflies seen on that day, and "DOY" is the day of year (redundant with year and date, 
           but the variable used in our analyses.
    daily-measures.csv - daily weather readings from NOAA for nearby weather stations. 
    pop-trends.csv - population estimates using capture-recapture methods. For our analyses, we use the "Total" column, and entries for Sex==Both.
2_data_wrangling/ - directory for intermediary data files/objects
    climate-covar.rds - R data object file of yearly Growing Degree Days on July 1, calculated from daily-measures.csv in the script 3_scripts/climate-cleaner.R
3_scripts/ - directory for scripts and compiled Rmarkdown documents.
  appendix S2 - methods_demo_BCB.Rmd - Rmarkdown script that generated Appendix S2. 
  appendix S3 - analysis.Rmd - Rmarkdown script that generated Appendix S3. 
  appendix-S2.bib - bibliography file for the two appendix .Rmd files.

  climate-cleaner.R - script for calculating Growing Degree Days (GDD) from NOAA weather file (daily-measures.csv). Saves results as 2_data_wrangling/climate-covar.rds.
4_res/ - directory for results files. Not used in this project
5_res/ - directory for plots and figures generated in "appendix S3 - analysis.Rmd". Each .jpg has an associated meta-data file in .txt format. 



