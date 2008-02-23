\name{GeomAbline}
\alias{geom_abline}
\alias{GeomAbline}
\title{geom_abline}
\description{Line, specified by slope and intercept}
\details{
The abline geom adds a line with specified slope and intercept to the plot.

With its siblings \code{\link{geom_hline}} and \code{\link{geom_vline}}, it's useful for annotating plots.  You can supply the parameters for geom_abline, intercept and slope, in two ways: either explicitly as fixed values, or stored in the data set.  If you specify the fixed values (\code{geom_abline(intercept=0, slope=1)}) then the line will be the same in all panels, but if the intercept and slope are stored in the data, then can vary from panel to panel.  See the examples for more ideas.

This page describes \code{\link{geom_abline}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with geom_abline.  Aesthetics are mapped to variables in the data with the \code{\link{aes}} function: \code{geom_abline(\code{\link{aes}}(x = var))}
\itemize{
  \item \code{colour}: border colour 
  \item \code{size}: size 
  \item \code{linetype}: line type 
  \item \code{intercept}: x/y intercept 
  \item \code{slope}: slope of line 
}
}
\usage{geom_abline(...)}
\arguments{
 \item{...}{ignored }
}
\seealso{\itemize{
  \item \code{\link{stat_smooth}}: To add lines derived from the data
  \item \code{\link{geom_hline}}: for horizontal lines
  \item \code{\link{geom_vline}}: for vertical lines
  \item \url{http://had.co.nz/ggplot/geom_abline.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    p <- ggplot(mtcars, aes(x = wt, y=mpg)) + geom_point()

    # Fixed slopes and intercepts
    p + geom_abline()
    p + geom_abline(slope=5)
    p + geom_abline(intercept=30, slope=-5)
    p + geom_abline(intercept=10, colour="red", size=5)
    p + stat_smooth(method="lm", se=FALSE)
    
    # Slopes and intercepts as data
    p <- ggplot(mtcars, aes(x = wt, y=mpg), . ~ cyl) + geom_point()
    df <- data.frame(intercept=25, slope=2)
    p + geom_abline(data=df)

    # Slopes and intercepts from linear model
    coefs <- do.call(rbind, by(mtcars, mtcars$cyl, function(df) { 
      m <- lm(mpg ~ wt, data=df)
      data.frame(cyl = df$cyl[1], intercept=coef(m)[1], slope=coef(m)[2]) 
    }))
    str(coefs)
    p + geom_abline(data=coefs)
    
    # It's actually a bit easier to do this with stat_smooth
    p + geom_smooth(aes(group=cyl), method="lm")
    p + geom_smooth(aes(group=cyl), method="lm", fullrange=TRUE)
    
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
