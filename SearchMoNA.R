#load required libaries
library(httr)

MONASEARCH <- "http://mona.fiehnlab.ucdavis.edu/rest/spectra/search" 
JSONCONTENT <- '"Content-Type" = "application/json"' 
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
