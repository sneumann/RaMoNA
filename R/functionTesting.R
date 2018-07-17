library(stringr)
library(OrgMassSpecR)
library(xcms)

##############################################################################
# XCMS3 basic data processing
##############################################################################
## Use socket based parallel processing on Windows systems
if (.Platform$OS.type == "unix") {
  register(bpstart(MulticoreParam(4)))
} else {
  register(bpstart(SnowParam(4)))
}

#load data from test
mzMLfiles <- list.files("./data", pattern = ".mzML$", full.names = TRUE)
raw_data <- readMSData(mzMLfiles, mode = "onDisk", centroided = TRUE)

## Get the base peak chromatograms. This reads data from the files.
bpis <- chromatogram(raw_data, aggregationFun = "max")
plot(bpis)

## Defining the settings for the centWave peak detection.
cwp <- CentWaveParam(snthresh = 3, peakwidth = c(2,60), ppm = 10)
xod <- findChromPeaks(raw_data, param = cwp) 

## Doing the obiwarp alignment using the default settings.
xod <- adjustRtime(xod, param = ObiwarpParam())

## Define the PeakDensityParam
pdp <- PeakDensityParam(sampleGroups = xod$sample_group, maxFeatures = 300, minFraction = 0.66)
xod <- groupChromPeaks(xod, param = pdp) 

#fill missing peaks
xod <- fillChromPeaks(xod)

##############################################################################
# MS2 spectra extraction
##############################################################################
#extract all ms spectra
ms2specs <- spectra(filterMsLevel(xod, msLevel = 2))

testCluster <- ms2Clust(ms2specs[1:500])

#get results from MoNA for exact mass of Tryptophan
searchResults <- searchByPrecursor(205.097154)

#interate through all results
for(i in 1:length(searchResults)) {

  #just some testing stuff
  entry <- searchResults[[i]]
  print(getBasicEntryData(entry))
  testSpec <- SpectrumSimilarity(getMassSpectrum(entry), getMassSpectrum(entry))
}


