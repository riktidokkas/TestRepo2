# General setup:

#target: list of dependencies (script1.R script2.R etc)
	#command with arguments  ## space-- means "this is an argument, not a file, don't run me, perform the command"
	#(command file 1
	#command --argument 2)
	
# What we really say: 2nd row: perform this from the dependecies listed in row one, but only in at least one
# of the dependecies are newer than your target
	
# Our project
# My phonytargets
## Phoney target (all) to build files (.png) I want (in this case plots)
all: results/sp_500_returns.png \
     results/sp_500_year_close.png 

## Phony target (clean) to remove files (.png, .csv) I want to remove to force make to rerun everything
# from the rawdata (in case it has changed), or if I want to clean out intermediate files (in this case .csv)
# before I send the project documentation to the reviewer
# DO NOT RUN THIS, THIS IS FOR YOUR INFORMATION ON HOW TO USE 
# MAKE GENERALLY (FROM MARTIN)
clean: 
# do not depend on anything so do not state dependencies
	$(RM) data/*.csv # i.e. remove all files that end with .csv
	$(RM) results/*.png # i.e. remove all files that end with .png

data/sp_500_yearend_raw.csv: scripts/download.R
	Rscript scripts/download.R
	
data/sp_500_yearend.csv: data/sp_500_yearend_raw.csv \
												 scripts/cleanup.R
	Rscript scripts/cleanup.R

data/sp_500_returns.csv: data/sp_500_yearend.csv \
												 scripts/calc_returns.R
	Rscript scripts/calc_returns.R

results/sp_500_returns.png: data/sp_500_returns.csv \
														scripts/Plot_returns.R
	Rscript scripts/Plot_returns.R

# General rule: whenever you can, choose to use as unrefined data as possible;
# hence use sp_500_yearend.csv
results/sp_500_year_close.png: data/sp_500_yearend.csv \
															 scripts/plot_yr_close.R 
	Rscript scripts/plot_yr_close.R
	

# Wild card commands needed to plot all wanted plots, otherwise you need to state the individual 
# name for all the plots you want to have as a target, which will be very messy if you have 400
# plots you want. 
	

	
