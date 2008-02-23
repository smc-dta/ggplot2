\name{StatQq}
\alias{stat_qq}
\alias{StatQq}
\title{stat_qq}
\description{Calculation for quantile-quantile plot}
\details{
This page describes \code{\link{stat_qq}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with stat_qq.  Aesthetics are mapped to variables in the data with the \code{\link{aes}} function: \code{stat_qq(\code{\link{aes}}(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{y}: y position (\strong{required}) 
  \item \code{y}: y position (\strong{required}) 
}
}
\usage{stat_qq(...)}
\arguments{
 \item{...}{Other arguments passed to distribution function}
}
\seealso{\itemize{
  \item \url{http://had.co.nz/ggplot/stat_qq.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    m <- ggplot(movies, aes(x=rating))

    m + stat_qq()
    m + stat_qq() + geom_abline()
    m + stat_qq(distribution=qunif, min=1, max=10) + geom_abline()
    m + stat_qq(quantiles = seq(0.01, 0.99, by=0.05), distribution=qunif, min=1, max=10) + geom_abline()
    
    # Let's explore the distribution of ratings
    qplot(movies$rating, geom="histogram", binwidth=0.1)
    
    # Looks pretty normal, so we'll compare to a normal distribution
    # with parameters estimated from the data
    
    distn <- fitdistr(movies$rating, "normal")
    m + stat_qq(distribution=function(x) qnorm(x, distn$estimate[1], sd=distn$estimate[2])) + geom_abline()

    # Not bad, apart from in the tails
    # We'll try something a little longer-tailed
    distt <- suppressWarnings(fitdistr(movies$rating, "t"))
    m + stat_qq(distribution=function(x) qt(x, distt$estimate[3], distt$estimate[1]) * distt$estimate[2]) + geom_abline()
    
    ggplot(movies, aes(x=rating, y=rating * 2)) + stat_qq()
    ggplot(movies, aes(x=rating, y=rating ^ 2)) + stat_qq()
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
