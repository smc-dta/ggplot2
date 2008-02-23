\name{StatQuantile}
\alias{stat_quantile}
\alias{StatQuantile}
\title{stat_quantile}
\description{Continuous quantiles}
\details{
This page describes \code{\link{stat_quantile}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with stat_quantile.  Aesthetics are mapped to variables in the data with the \code{\link{aes}} function: \code{stat_quantile(\code{\link{aes}}(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{y}: y position (\strong{required}) 
  \item \code{group}: how observations are divided into different groups 
}
}
\usage{stat_quantile(...)}
\arguments{
 \item{...}{other arguments}
}
\seealso{\itemize{
  \item \url{http://had.co.nz/ggplot/stat_quantile.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    m <- ggplot(movies, aes(y=rating, x=year)) + geom_point() 
    m + stat_quantile()
    m + stat_quantile(quantiles = 0.5)
    m + stat_quantile(quantiles = seq(0.05, 0.95, by=0.05))

    # Doesn't work.  Not sure why.
    # m + stat_quantile(method = rqss, formula = y ~ qss(x), quantiles = 0.5)

    # Add aesthetic mappings
    m + stat_quantile(aes(weight=votes))

    # Change scale
    m + stat_quantile(aes(colour = ..quantile..), quantiles = seq(0.05, 0.95, by=0.05))
    m + stat_quantile(aes(colour = ..quantile..), quantiles = seq(0.05, 0.95, by=0.05)) +
      scale_colour_gradient2(midpoint=0.5, low="green", mid="yellow", high="green")

    # Set aesthetics to fixed value
    m + stat_quantile(colour="red", size=2, linetype=2)
    
    # Use qplot instead
    qplot(year, rating, data=movies, geom="quantile")

}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
