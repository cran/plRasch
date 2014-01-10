\name{RaschPLE}
\alias{RaschPLE}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Fit Rasch Family Models Using Pseudolikelihood Esitmation }
\description{
  This function fits Rasch family models using pseudolikelihood esitmation.
It is capable of dealing with polytomous items, and 
  multidimensional latent variables.
}
\usage{
RaschPLE(data, item.mtx, trait.mtx)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{data}{ is a data frame or matrix with rows indicating individuals,
 columns indicating items, and the entry values indicating the choices.}
  \item{item.mtx}{ is the adjacency matrix between items and latent traits}
  \item{trait.mtx}{ is the adjacency matrix for latent traits}
}
\details{
  The model is
\deqn{P(X[v,i] = h) = \frac{\exp( w[i,h]' \theta[v] + \beta[i,h] )
  }{\sum_l \exp( w[i,l]' \theta[v] + \beta[i,l] )  }
}{%
  \preformatted{
                       exp( w[i,h]' theta[v] + beta[i,h] )
   P(X[v,i] = h) = ---------------------------------------------
                    sum_l exp( w[i,l]' theta[v] + beta[i,l] ) 
 } 
}   
where

     X[v,i] is the response of vth individual to ith item;
     w[i,h] is a vector of known category weights or scores for
 response h of ith item;
     theta[v] is a vector of latent traits for vth individual;
     beta[i,h] is the item difficulty parameter for ith item;
 associated with response h.

   The function only returns the item parameter beta.

   Essentially, it is a wrapper function: the equvialent llla model
 is fitted. 
}
\value{
  \item{coefficients }{estimated item parameter beta}
  \item{se }{standard error of beta}
  \item{covb}{covariance matrix of the estimated parameter beta  }
}
\references{Anderson, C.J., Li, Z., & Vermunt, J.K. (2007). 
Estimation of models in the Rasch family for polytomous items and multiple latent variables.
 Journal of Statistical Software, 20. 
}
\author{ Zhushan "Mandy" Li & Feng Hong
}
\seealso{ \code{\link{llla}} }
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

plfit.rasch <- RaschPLE(sim.data, item.mtx, trait.mtx)
plfit.rasch 
}
\keyword{ models }% at least one, from doc/KEYWORDS
\keyword{ models }% __ONLY ONE__ keyword per line

