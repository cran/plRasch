\name{llla}
\alias{llla}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Fit Log Linear by Linear Association Models }
\description{
  This function fits log linear by linear association models using pseudolikelihood method.
}
\usage{
llla(data, item.mtx=rep(1, ncol(data)), trait.mtx=1, useMLE=FALSE, uncorrected=FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{ is a data frame or matrix with rows indicating
  individuals and columns indicating items and the values indicating
  the choices.
}
  \item{item.mtx}{ is the adjacency matrix between items and the latent traits}
  \item{trait.mtx}{ is the adjacency matrix for latent traits}
  \item{useMLE}{ inidicates whether maximum likelihood estimation is used}
  \item{uncorrected}{ if the value is TRUE, calculate the uncorrected standard errors
}
}

\value{
  \item{coefficients }{the parameter estimates in the LLLA model}
  \item{se }{the standard error of coefficient esimates(sandwich estimator)}
  \item{covb }{the covariance matrix of the coefficient esimates}
  \item{se.uncorrected }{the standard error not corrected}
  \item{ncat }{number of categories}
  \item{nexaminee }{number of examinees}
  \item{nitem }{number of items}
}

\references{ Anderson, C.J., Li, Z., & Vermunt, J.K. (2007).
Estimation of models in the Rasch family for polytomous items and multiple latent variables.
 Journal of Statistical Software, 20. }
\author{ Zhushan "Mandy" Li & Feng Hong }
\seealso{  \code{\link{simRasch}} }
\examples{
NCAT <- 2;
NITEM <- 4;
NEXAMINEE <- 50;
BETA <- c(-1, 0, 0.5, 1)
set.seed(1);
rasch.sim <- simRasch(ncat=NCAT, nitem=NITEM, nexaminee=NEXAMINEE, beta=BETA)
sim.data <- rasch.sim$data
colnames(sim.data) <- paste("I", 1:NITEM, sep='')

## The model item adjacency matrix and the latent trait adjacency matrix
item.mtx <- rep(1, NITEM);
trait.mtx <- 1;

### MLE of log-multiplicative Assoc. Model
mlfit <- llla(sim.data, item.mtx, trait.mtx, useMLE=TRUE)
mlfit

#### PLE of log-multiplicative Assoc. Model
plfit <- llla(sim.data, item.mtx, trait.mtx)
plfit

}
\keyword{ models }% at least one, from doc/KEYWORDS

