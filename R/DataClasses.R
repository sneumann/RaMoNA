# new class based on Spectrum2 for storage of library spectra
setClass("AnnotatedSpectrum2",
         representation = representation(
           name = "character",
           formula = "character",
           exactMass = "numeric",
           inchi = "character",
           inchiKey = "character",
           smiles = "character",
           splash = "character"),
         contains = c("Spectrum2"),
         prototype = prototype()
         )
