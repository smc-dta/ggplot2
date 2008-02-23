\name{GeomRibbon}
\alias{geom_ribbon}
\alias{GeomRibbon}
\title{geom_ribbon}
\description{Ribbons, y range with continuous x values}
\details{
This page describes \code{\link{geom_ribbon}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with geom_ribbon.  Aesthetics are mapped to variables in the data with the \code{\link{aes}} function: \code{geom_ribbon(\code{\link{aes}}(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{min}: minimum of interval (\strong{required}) 
  \item \code{max}: maximum of interval (\strong{required}) 
  \item \code{colour}: border colour 
  \item \code{fill}: internal colour 
  \item \code{size}: size 
  \item \code{linetype}: line type 
}
}
\usage{geom_ribbon(...)}
\arguments{
 \item{...}{ignored }
}
\seealso{\itemize{
  \item \code{\link{geom_bar}}: Discrete intervals (bars)
  \item \code{\link{geom_linerange}}: Discrete intervals (lines)
  \item \code{\link{geom_polygon}}: General polygons
  \item \url{http://had.co.nz/ggplot/geom_ribbon.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    # Generate data
    huron <- data.frame(year = 1875:1972, level = as.vector(LakeHuron))
    huron$decade <- round_any(huron$year, 10, floor)

    h <- ggplot(huron, aes(x=year))

    h + geom_ribbon(aes(min=0, max=level))
    h + geom_area(aes(y = level))

    # Add aesthetic mappings
    h + geom_ribbon(aes(min=level-1, max=level+1))
    h + geom_ribbon(aes(min=level-1, max=level+1)) + geom_line(aes(y=level))
    
    # Another data set, with multiple y's for each x
    m <- ggplot(movies, aes(y=votes, x=year)) 
    (m <- m + geom_point())
    
    # The default summary isn't that useful
    m + stat_summary(geom="ribbon")
    m + stat_summary(geom="ribbon", fun=stat_median_hilow)
    
    # Use qplot instead
    qplot(year, level, data=huron, geom=c("area", "line"))
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
