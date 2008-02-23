\name{StatBin}
\alias{stat_bin}
\alias{StatBin}
\title{stat_bin}
\description{Bin data}
\details{
Missing values are currently silently dropped.

This page describes \code{\link{stat_bin}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with stat_bin.  Aesthetics are mapped to variables in the data with the \code{\link{aes}} function: \code{stat_bin(\code{\link{aes}}(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{y}: y position 
}
}
\usage{stat_bin(...)}
\arguments{
 \item{...}{other arguments}
}
\seealso{\itemize{
  \item \url{http://had.co.nz/ggplot/stat_bin.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    m <- ggplot(movies, aes(x=rating))
    m + stat_bin()
    m + stat_bin(binwidth=0.1)
    m + stat_bin(breaks=seq(4,6, by=0.1))
    # See geom_histogram for more histogram examples
    
    # To create a unit area histogram, use aes(y = ..density..)
    (linehist <- m + stat_bin(aes(y = ..density..), geom="line"))
    linehist + stat_density(colour="blue", fill=NA)
    
    # Also works with categorical variables
    ggplot(movies, aes(x=mpaa)) + stat_bin()
    qplot(mpaa, data=movies, stat="bin")
    
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
