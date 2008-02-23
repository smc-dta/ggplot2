\name{GeomArea}
\alias{geom_area}
\alias{GeomArea}
\title{geom_area}
\description{Area plots}
\details{
An area plot is the continuous analog of a stacked bar chart (see \code{\link{geom_bar}}), and can be used to show how composition of the whole varies over the range of x.  Choosing the order in which different components is stacked is very important, as it becomes increasing hard to see the individual pattern as you move up the stack.

An area plot is a special case of \code{\link{geom_ribbon}}, where the minimum of the range is fixed to 0, and the position adjustment defaults to position_stacked.

This page describes \code{\link{geom_area}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with geom_area.  Aesthetics are mapped to variables in the data with the \code{\link{aes}} function: \code{geom_area(\code{\link{aes}}(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{y}: y position (\strong{required}) 
  \item \code{min}: minimum of interval (\strong{required}) 
  \item \code{max}: maximum of interval (\strong{required}) 
  \item \code{colour}: border colour 
  \item \code{fill}: internal colour 
  \item \code{min}: minimum of interval (\strong{required}) 
  \item \code{max}: maximum of interval (\strong{required}) 
  \item \code{size}: size 
  \item \code{linetype}: line type 
}
}
\usage{geom_area(...)}
\arguments{
 \item{...}{ignored }
}
\seealso{\itemize{
  \item \code{\link{geom_bar}}: Discrete intervals (bars)
  \item \code{\link{geom_linerange}}: Discrete intervals (lines)
  \item \code{\link{geom_polygon}}: General polygons
  \item \url{http://had.co.nz/ggplot/geom_area.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    # Examples to come
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
