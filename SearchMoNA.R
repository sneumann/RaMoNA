#load required libaries
library(httr)

MONASEARCH <- "http://mona.fiehnlab.ucdavis.edu/rest/spectra/search" 
JSONCONTENT <- '"Content-Type" = "application/json"' 
<<<<<<< HEAD
MSPCONTENT <- '"Accept: text/msp'

#search by molecular formula
searchByFormula <- function(formula, returnType = "json") {
  
  #GET request
  if(returnType == "json") {
    
    #return as json
    req <- GET(MONASEARCH,
               add_headers(JSONCONTENT),
               query = list(query = paste0('compound.metaData=q=\'name=="molecular formula" and value=="', formula, '"\'')))
    
  } else if(returnType == "msp") {
    
    #return as msp
    req <- GET(MONASEARCH,
               add_headers(MSPCONTENT),
               query = list(query = paste0('compound.metaData=q=\'name=="molecular formula" and value=="', formula, '"\'')))
    
  }
  
  return(content(req))
  
}
=======
>>>>>>> 43d1c18171e16f101ce08464354273fa27cf1314

