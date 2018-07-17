#low level parsing functions to access data without knowing the complete route
getMassSpectrum <- function(entry) {
  
  #isolate spectrum and split into different lines
  spectrum <- as.data.frame(t(as.data.frame(stringr::str_split(stringr::str_split(entry$spectrum, " ")[[1]], ":"))))
  
  #remove naming and label correct
  rownames(spectrum) <- NULL
  colnames(spectrum) <- c("mz", "intensity")
  
  #convert to numbers
  spectrum$mz <- as.numeric(as.character(spectrum$mz))
  spectrum$intensity <- as.numeric(as.character(spectrum$intensity))

  #return spectrum
  return(spectrum)
  
}


getBasicEntryData <- function(entry) {
  
  #get accession, name, formula, exactMass, inchi, inchiKey, smiles
  #generate list with return values
  resultList <- list(accession = entry$id,
                     name = entry$compound[[1]]$names[[1]]$name,
                     formula = entry$compound[[1]]$metaData[[5]]$value,
                     exactMass = entry$compound[[1]]$metaData[[6]]$value,
                     inchi = entry$compound[[1]]$inchi,
                     inchiKey = entry$compound[[1]]$metaData[[8]]$value,
                     smiles = entry$compound[[1]]$metaData[[7]]$value) #,
                     #precIonType = entry$metaData[[27]]$value)
  
  #return list
  return(resultList)
}


createAnnotatedSpectrum2 <- function(entry) {
  
  # get contenct of spectrum entry
  spectrum <- getMassSpectrum(entry)
  basicData <- getBasicEntryData(entry)
  
  print(spectrum)
  
  print(basicData[["smiles"]])
  
  #create new annotated Spectrum2
  mbRecord <- new("AnnotatedSpectrum2",
                  merged = 0,
                  precScanNum = as.integer(1),
                  precursorMz = 100,
                  precursorIntensity = 100,
                  precursorCharge = as.integer(1),
                  mz = unlist(spectrum$mz),
                  intensity = unlist(spectrum$intensity),
                  centroided = TRUE,
                  collisionEnergy = 20,
                  name = basicData[["name"]],
                  formula = basicData[["formula"]],
                  exactMass = as.numeric(basicData[["exactMass"]]),
                  inchi = basicData[["inchi"]],
                  smiles = as.character(basicData[["smiles"]]),
                  splash = "")
  
}
