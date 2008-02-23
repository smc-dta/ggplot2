\name{StatDensity_2d}
\alias{stat_density_2d}
\alias{StatDensity_2d}
\title{stat_density_2d}
\description{Density estimation, 2D}
\details{
This page describes \code{\link{stat_density_2d}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with stat_density_2d.  Aesthetics are mapped to variables in the data with the \code{\link{aes}} function: \code{stat_density_2d(\code{\link{aes}}(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{y}: y position (\strong{required}) 
  \item \code{group}: how observations are divided into different groups 
}
}
\usage{stat_density_2d(...)}
\arguments{
 \item{...}{ignored }
}
\seealso{\itemize{
  \item \url{http://had.co.nz/ggplot/stat_density_2d.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    m <- ggplot(movies, aes(x=rating, y=length)) + geom_point() + scale_y_continuous(limits=c(1, 500))
    m + geom_density_2d()

    dens <- MASS::kde2d(movies$rating, movies$length, n=100)
    densdf <- data.frame(expand.grid(rating = dens$x, length = dens$y), z=as.vector(dens$z))
    m + geom_contour(aes(z=z), data=densdf)

    m + geom_density_2d() + scale_y_log10()
    m + geom_density_2d() + coord_trans(y="log10")
    
    m + stat_density_2d(aes(fill = ..level..), geom="polygon")

    qplot(rating, length, data=movies, geom=c("point","density2d"), ylim=c(1, 500))
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
