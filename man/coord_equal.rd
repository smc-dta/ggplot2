\name{CoordEqual}
\alias{coord_equal}
\alias{CoordEqual}
\title{coord_equal}
\description{Equal scale cartesian coordinates}
\details{
An equal scale coordinate system plays a similar role to ?eqscplot in MASS, but it works for all types of graphics, not just scatterplots.

This coordinate system has one parameter, \code{ratio}, which specifies the ratio between the x and y scales.  By default, the aspect.ratio of the plot will also be set to this value.

This page describes \code{\link{coord_equal}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\usage{coord_equal(...)}
\arguments{
 \item{...}{ignored }
}
\seealso{\itemize{
  \item \url{http://had.co.nz/ggplot/coord_equal.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    # coord_equal ensures that the ranges of axes are equal to the
    # specified ratio (1 by default, indicating equal ranges).
    # You must also ensure the physical lengths of the axes are 
    # equal to the specified ratio, by setting the aspect.ratio option
    
    qplot(mpg, wt, data=mtcars) + coord_equal(ratio=1)
    qplot(mpg, wt, data=mtcars) + coord_equal(ratio=5)
    qplot(mpg, wt, data=mtcars) + coord_equal(ratio=1/5)
    
    # Resize the plot, and you'll see that the specified aspect ratio is 
    # mantained
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
