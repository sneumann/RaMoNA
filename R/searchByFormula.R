#load required libraries
library(RCurl)
library(httr)

#search by molecular formula
searchByFormula <- function(formula, returnType = "json") {
  
  print(paste0('compound.metaData=q=\'name=="molecular formula" and value=="', formula, '"\''))
  
  #GET request
  if(returnType == "json") {
    
    #return as json
    req <- GET(MONASEARCH,
               add_headers(JSONCONTENT),
               query = list(query = paste0('compound.metaData=q=\'name=="molecular formula" and value=="', formula, '"\'')))
    
  } 
  
  return(content(req))
  
}


#search by precursor
searchByExactMass <- function(exactMass, error = 0.01, returnType = "json") {
  
  #get boundaries
  lower <- exactMass - error
  upper <- exactMass + error
  
  #GET request
  if(returnType == "json") {
    
    #return as json
    req <- GET(MONASEARCH,
               add_headers(JSONCONTENT),
               query = list(query = paste0('compound.metaData=q=\'name==\"total exact mass\" and value >= ', lower, ' and value <= ', upper, '\'')))
    
  } 
  
  return(content(req))
  
}



#search by precursor and adduct type
searchByPrecursor <- function(precursor, error = 0.01, precursorType = "[M+H]+",returnType = "json") {
  
  #get boundaries
  lower <- precursor - error
  upper <- precursor + error
  
  #GET request
  if(returnType == "json") {
    
    #return as json
    req <- GET(MONASEARCH,
               add_headers(JSONCONTENT),
               query = list(query = paste0('metaData=q=\'name==\"precursor m/z\" and value >= ', lower, ' and value <= ', upper, '\' and (metaData=q=\'name==\"precursor type\" and value == \"', precursorType, '\"\')')))
    
  }
  
  return(content(req))
  
}
