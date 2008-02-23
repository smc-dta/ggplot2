\name{GeomDensity}
\alias{geom_density}
\alias{GeomDensity}
\title{geom_density}
\description{Display a smooth density estimate}
\details{
A smooth density estimate calculated by \code{\link{stat_density}}This page describes \code{\link{geom_density}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with geom_density.  Aesthetics are mapped to variables in the data with the \code{\link{aes}} function: \code{geom_density(\code{\link{aes}}(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{y}: y position (\strong{required}) 
  \item \code{min}: minimum of interval (\strong{required}) 
  \item \code{max}: maximum of interval (\strong{required}) 
  \item \code{fill}: internal colour 
  \item \code{weight}: observation weight used in statistical transformation 
  \item \code{colour}: border colour 
  \item \code{min}: minimum of interval (\strong{required}) 
  \item \code{max}: maximum of interval (\strong{required}) 
  \item \code{size}: size 
  \item \code{linetype}: line type 
}
}
\usage{geom_density(...)}
\arguments{
 \item{...}{ignored }
}
\seealso{\itemize{
  \item \code{\link{geom_histogram}}: for the histogram
  \item \url{http://had.co.nz/ggplot/geom_density.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    # See stat_density for examples
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
