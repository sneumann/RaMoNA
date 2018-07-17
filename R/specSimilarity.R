#' This function reconstructs a Ms2 spectrum for all fragments with a correlation value bigger than a set cut-off
#'
#' @param precursor putative precursor peak
#' @param ms2dfCor corrected MS2 EICs
#' @param corValues calculated pearson correlations
#' @param CorCutOff cut-off for pearson correlation, default = 0.9
#'
#' @return returns a data frame containing the reconstructed MS2 spectrum
equalLength <- function(x, y, ...) {
  return(peaksCount(x)/(peaksCount(y)+.Machine$double.eps))
}

massShiftDotProduct <-function(x, y, ...) {
  
  #ToDo
  massShift <- abs(precursorMz(x) - precursorMz(y))
  
  
  return(1.0)
}