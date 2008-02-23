\name{GeomLinerange}
\alias{geom_linerange}
\alias{GeomLinerange}
\title{geom_linerange}
\description{An interval represented by a vertical line}
\details{
This page describes \code{\link{geom_linerange}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with geom_linerange.  Aesthetics are mapped to variables in the data with the \code{\link{aes}} function: \code{geom_linerange(\code{\link{aes}}(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{min}: minimum of interval (\strong{required}) 
  \item \code{max}: maximum of interval (\strong{required}) 
  \item \code{colour}: border colour 
  \item \code{size}: size 
  \item \code{linetype}: line type 
}
}
\usage{geom_linerange(...)}
\arguments{
 \item{...}{ignored }
}
\seealso{\itemize{
  \item \code{\link{geom_errorbar}}: error bars
  \item \code{\link{geom_pointrange}}: range indicated by straight line, with point in the middle
  \item \code{\link{geom_crossbar}}: hollow bar with middle indicated by horizontal line
  \item \code{\link{stat_summary}} : examples of these guys in use
  \item \code{\link{geom_smooth}}: for continuous analog
  \item \url{http://had.co.nz/ggplot/geom_linerange.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    # Generate data: means and standard errors of means for prices
    # for each type of cut
    dmod <- lm(price ~ cut, data=diamonds)
    cuts <- data.frame(cut=unique(diamonds$cut), predict(dmod, data.frame(cut = unique(diamonds$cut)), se=T)[c("fit","se.fit")])
    
    qplot(cut, fit, data=cuts)
    # With a bar chart, we are comparing lengths, so the y-axis is 
    # automatically extended to include 0
    qplot(cut, fit, data=cuts, geom="bar")
    
    # Display estimates and standard errors in various ways
    se <- ggplot(cuts, aes(x = cut, min=fit - se.fit, max=fit + se.fit, y=fit))
    se + geom_linerange()
    se + geom_pointrange()
    se + geom_errorbar(width = 0.5)
    se + geom_crossbar(width = 0.5)

    # Use coord_flip to flip the x and y axes
    se + geom_linerange() + coord_flip()
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
