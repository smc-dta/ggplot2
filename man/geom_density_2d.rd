\name{GeomDensity_2d}
\alias{geom_density_2d}
\alias{GeomDensity_2d}
\title{geom_density_2d}
\description{Contours from a 2d density estimate}
\details{
Perform a 2D kernel density estimatation using kde2d and  display the results with contours.

This page describes \code{\link{geom_density_2d}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with geom_density_2d.  Aesthetics are mapped to variables in the data with the \code{\link{aes}} function: \code{geom_density_2d(\code{\link{aes}}(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{y}: y position (\strong{required}) 
  \item \code{weight}: observation weight used in statistical transformation 
  \item \code{colour}: border colour 
  \item \code{size}: size 
  \item \code{linetype}: line type 
}
}
\section{Advice}{
This can be useful for dealing with overplotting.

}
\usage{geom_density_2d(...)}
\arguments{
 \item{...}{ignored }
}
\seealso{\itemize{
  \item \code{\link{geom_contour}}: contour drawing geom
  \item \code{\link{stat_sum}}: another way of dealing with overplotting
  \item \url{http://had.co.nz/ggplot/geom_density_2d.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    # See stat_density2d for examples
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
