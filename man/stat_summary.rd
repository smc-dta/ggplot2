\name{StatSummary}
\alias{stat_summary}
\alias{StatSummary}
\title{stat_summary}
\description{Summarise y values at every unique x}
\details{
stat_summary allows for tremendous flexibilty in the specification of summary functions.  The summary function can either operate on a data frame (with argument name data) or on a vector.  A simple vector function is easiest to work with as you can return a single number, but is somewhat less flexible.  If your summary function operates on a data.frame it should return a data frame with variables that the geom can use.

This page describes \code{\link{stat_summary}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with stat_summary.  Aesthetics are mapped to variables in the data with the \code{\link{aes}} function: \code{stat_summary(\code{\link{aes}}(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{y}: y position (\strong{required}) 
}
}
\usage{stat_summary(...)}
\arguments{
 \item{...}{ignored }
}
\seealso{\itemize{
  \item \code{\link{geom_errorbar}}: error bars
  \item \code{\link{geom_pointrange}}: range indicated by straight line, with point in the middle
  \item \code{\link{geom_linerange}}: range indicated by straight line
  \item \code{\link{geom_crossbar}}: hollow bar with middle indicated by horizontal line
  \item smean.sdl: for description of summary functions provide by Hmisc.  Replace the . with a _ to get the ggplot name
  \item \code{\link{stat_smooth}}: for continuous analog
  \item \url{http://had.co.nz/ggplot/stat_summary.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    # Basic operation on a small dataset
    c <- qplot(cyl, mpg, data=mtcars)
    c + stat_summary()
    
    # The simplest type of summary range takes a vector of x's and returns
    # a single value:
    
    stat_sum_single <- function(fun, geom="point", ...) {
      stat_summary(fun=fun, colour="red", geom=geom, size = 3, ...)      
    }
    
    c + stat_sum_single(mean)
    c + stat_sum_single(mean, geom="line")
    c + stat_sum_single(median)
    c + stat_sum_single(sd)
    
    # More complex summary functions operate on a data.frame, summarising
    # the values of y for a given x (the split into separate data.frames with
    # uniques values of x is performed automatically by stat_summary)
    #
    # A set of useful summary functions is provided from the Hmisc package:
    
    stat_sum_df <- function(fun, geom="crossbar", ...) {
      stat_summary(fun=fun, colour="red", geom=geom, width=0.2, ...)
    }
    
    c + stat_sum_df("mean_cl_boot")
    c + stat_sum_df("mean_sdl")
    c + stat_sum_df("mean_sdl", mult=1)
    c + stat_sum_df("median_hilow")
    c + stat_sum_df("range", geom="linerange")

    # There are lots of different geoms you can use to display the summaries
        
    c + stat_sum_df(fun="mean_cl_normal")
    c + stat_sum_df(fun="mean_cl_normal", geom = "errorbar")
    c + stat_sum_df(fun="mean_cl_normal", geom = "pointrange")
    c + stat_sum_df(fun="mean_cl_normal", geom = "smooth")
        
    # Summaries are much more useful with a bigger data set:
    m <- ggplot(movies, aes(x=round(rating), y=votes)) + geom_point()
    (m2 <- m + stat_summary(fun="mean_cl_boot", geom="crossbar", colour="red", width=0.3))
    # Notice how the overplotting skews out visual perception of the mean
    # supplementing the raw data with summary statisitcs is _very_ important
  
    # Next, we'll look at votes on a log scale.

    # Transforming the scale performs the transforming before the statistic.
    # This means we're calculating the summary on the logged data
    m2 + scale_y_log10()
    # Transforming the coordinate system performs the transforming after the
    # statistic. This means we're calculating the summary on the raw data, 
    # and stretching the geoms onto the log scale.  Compare the widths of the
    # standard errors.
    m2 + coord_trans(y="log10")
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
