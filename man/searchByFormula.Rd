\name{searchByFormula}
\alias{searchByFormula}
\title{Search MoNA by molecular formula
}
\description{
Search for MoNA records based on the molecular formula
}
\usage{
searchByFormula(formula, returnType = "json")
}
\arguments{
  \item{formula}{Return entries with this molecular formula
}
  \item{returnType}{
	Specify the requested return type, currently only JSON suported
}
}
\details{
First prototype accessing MoNA from R
}
\value{
	Returns a JSON document
}
\references{
http://mona.fiehnlab.ucdavis.edu/
}
\author{
Michael Witting
}

\examples{

searchByFormula("C15H12O5") 

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ database }
