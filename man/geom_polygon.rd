\name{GeomPolygon}
\alias{geom_polygon}
\alias{GeomPolygon}
\title{geom_polygon}
\description{A polygon}
\details{
This page describes \code{\link{geom_polygon}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with geom_polygon.  Aesthetics are mapped to variables in the data with the \code{\link{aes}} function: \code{geom_polygon(\code{\link{aes}}(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{y}: y position (\strong{required}) 
  \item \code{colour}: border colour 
  \item \code{fill}: internal colour 
  \item \code{size}: size 
  \item \code{linetype}: line type 
}
}
\usage{geom_polygon(...)}
\arguments{
 \item{...}{ignored }
}
\seealso{\itemize{
  \item \code{\link{geom_path}}: an unfilled polygon
  \item \code{\link{geom_ribbon}}: a polygon anchored on the x-axis
  \item \url{http://had.co.nz/ggplot/geom_polygon.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    # When using geom_polygon, you will typically need two data frames:
    # one contains the coordinates of each polygon (positions),  and the
    # other the values associated with each polygon (values).  An id
    # variable links the two together

    ids <- factor(c("1.1", "2.1", "1.2", "2.2", "1.3", "2.3"))

    values <- data.frame(
      id = ids, 
      value = c(3, 3.1, 3.1, 3.2, 3.15, 3.5)
    )

    positions <- data.frame(
      id = rep(ids, each = 4),
      x = c(2, 1, 1.1, 2.2, 1, 0, 0.3, 1.1, 2.2, 1.1, 1.2, 2.5, 1.1, 0.3, 
      0.5, 1.2, 2.5, 1.2, 1.3, 2.7, 1.2, 0.5, 0.6, 1.3),
      y = c(-0.5, 0, 1, 0.5, 0, 0.5, 1.5, 1, 0.5, 1, 2.1, 1.7, 1, 1.5, 
      2.2, 2.1, 1.7, 2.1, 3.2, 2.8, 2.1, 2.2, 3.3, 3.2)
    )
    
    # Currently we need to manually merge the two together
    datapoly <- merge(values, positions, by=c("id"))

    (p <- ggplot(datapoly, aes(x=x, y=y)) + geom_polygon(aes(fill=value, group=id)))

    # Which seems like a lot of work, but then it's easy to add on 
    # other features in this coordinate system, e.g.:

    stream <- data.frame(
      x = cumsum(runif(50, max = 0.1)), 
      y = cumsum(runif(50,max = 0.1))
    )

    p + geom_line(data = stream, colour="grey30", size= 5)
    
    # And if the positions are in longitude and latitude, you can use
    # coord_map to produce different map projections.
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
