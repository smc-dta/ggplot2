\name{CoordMap}
\alias{coord_map}
\alias{CoordMap}
\title{coord_map}
\description{Map projections}
\details{
This coordinate system provides the full range of map projections available in the mapproject package.


This is still experimental, and if you have any advice to offer regarding a better (or more correct) way to do this, please let me know

This page describes \code{\link{coord_map}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\usage{coord_map(...)}
\arguments{
 \item{...}{other arguments passed on to mapproject}
}
\seealso{\itemize{
  \item \url{http://had.co.nz/ggplot/coord_map.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    try_require("maps")
    # Create a lat-long dataframe from the maps package
    nz <- data.frame(map("nz", plot=FALSE)[c("x","y")])
    (nzmap <- qplot(x, y, data=nz, geom="path"))
    
    nzmap + coord_map()
    nzmap + coord_map(project="cylindrical")
    nzmap + coord_map(project='azequalarea',orientation=c(-36.92,174.6,0))
    
    states <- data.frame(map("state", plot=FALSE)[c("x","y")])
    (usamap <- qplot(x, y, data=states, geom="path"))
    usamap + coord_map()
    # See ?mapproject for coordinate systems and their parameters
    usamap + coord_map(project="gilbert")
    usamap + coord_map(project="lagrange")

    # For most projections, you'll need to set the orientation yourself
    # as the automatic selection done by mapproject is not available to
    # ggplot
    usamap + coord_map(project="orthographic")
    usamap + coord_map(project="stereographic")
    usamap + coord_map(project="conic", 30)
    usamap + coord_map(project="bonne", 50)
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
