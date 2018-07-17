#reading test files
testFiles <- list.files("data", pattern = ".txt$", full.names = TRUE)

libraryMs2spectra <- list()

# read each file and add to list
for(file in testFiles) {
  
  mbRecord <- readMassBankFile(file)
  
  libraryMs2spectra <- c(libraryMs2spectra, mbRecord)
  
}

plot(libraryMs2spectra[[2]], libraryMs2spectra[[3]])
compareSpectra(libraryMs2spectra[[2]], libraryMs2spectra[[3]], fun = "dotproduct", binSize = 0.005)

  
  
testResults <- searchByPrecursor(205.0972)

testResults[[1]]

createAnnotatedSpectrum2(testResults[[1]])

entry <- testResults[[1]]
