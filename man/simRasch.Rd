\name{simRasch}
\alias{simRasch}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Simulate a data matrix from the Rasch Model}
\description{
  Simulate a data matrix from the Rasch Model
}
\usage{
simRasch(ncat, nitem, nexaminee, beta = NULL)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{ncat}{ number of response categories }
  \item{nitem}{ number of items}
  \item{nexaminee}{number of examinees}
  \item{beta}{ item parameter; if it is NULL,
beta will be randomly generated from the standard normal distribution }
}
\value{
  \item{data }{data is generated from Rasch model.  It is a data frame or matrix with rows indicating individuals, 
columns indicating items, 
and the entry values indicating the choices are either 0 or 1}
  \item{beta }{item parameter}
  \item{theta}{the underlying latent trait}
}
\references{ Anderson, C.J., Li, Z., & Vermunt, J.K. (2007). 
Estimation of models in the Rasch family for polytomous items and multiple latent variables.
 Journal of Statistical Software, 20.  }
\author{ Zhushan "Mandy" Li & Feng Hong  }
\seealso{ \code{\link{llla}} }
\examples{
NCAT <- 2;
NITEM <- 4;
NEXAMINEE <- 50;
BETA <- c(-1, 0, 0.5, 1)
set.seed(1);
rasch.sim <- simRasch(ncat=NCAT, nitem=NITEM, nexaminee=NEXAMINEE, beta=BETA)
}
\keyword{ misc }% at least one, from doc/KEYWORDS
\keyword{ models }% __ONLY ONE__ keyword per line
