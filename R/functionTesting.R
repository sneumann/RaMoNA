library(stringr)
library(OrgMassSpecR)

#get results from MoNA for exact mass of Tryptophan
searchResults <- searchByPrecursor(205.097154)

#interate through all results
for(i in 1:length(searchResults)) {

  #just some testing stuff
  entry <- searchResults[[i]]
  print(getBasicEntryData(entry))
  testSpec <- SpectrumSimilarity(getMassSpectrum(entry), getMassSpectrum(entry))
}


