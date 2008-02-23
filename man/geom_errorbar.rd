\name{GeomErrorbar}
\alias{geom_errorbar}
\alias{GeomErrorbar}
\title{geom_errorbar}
\description{Error bars}
\details{
This page describes \code{\link{geom_errorbar}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with geom_errorbar.  Aesthetics are mapped to variables in the data with the \code{\link{aes}} function: \code{geom_errorbar(\code{\link{aes}}(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{min}: minimum of interval (\strong{required}) 
  \item \code{max}: maximum of interval (\strong{required}) 
  \item \code{colour}: border colour 
  \item \code{size}: size 
  \item \code{linetype}: line type 
  \item \code{width}: width of geom 
}
}
\usage{geom_errorbar(...)}
\arguments{
 \item{...}{ignored }
}
\seealso{\itemize{
  \item \code{\link{geom_pointrange}}: range indicated by straight line, with point in the middle
  \item \code{\link{geom_linerange}}: range indicated by straight line
  \item \code{\link{geom_crossbar}}: hollow bar with middle indicated by horizontal line
  \item \code{\link{stat_summary}} : examples of these guys in use
  \item \code{\link{geom_smooth}}: for continuous analog
  \item \url{http://had.co.nz/ggplot/geom_errorbar.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    # Create a simple example dataset
    df <- data.frame(
      trt = factor(c(1, 1, 2, 2)), 
      resp = c(1, 5, 3, 4), 
      group = factor(c(1, 2, 1, 2)), 
      se = c(0.1, 0.3, 0.3, 0.2)
    )
    df2 <- df[c(1,3),]
    
    ggplot(df, aes(max = resp + se, min=resp - se, x=trt, fill=group)) + geom_bar(position="dodge")
    
    # Define the top and bottom of the errorbars
    limits <- aes(max = resp + se, min=resp - se, width=0.9)
    
    p <- ggplot(df, aes(fill=group, y=resp, x=trt))
    p + geom_bar(position="dodge")
    
    # Because the bars and errorbars have different widths
    # we need to specify how wide the objects we are dodging are
    dodge <- position_dodge(width=0.9)
    p + geom_bar(position=dodge) + geom_errorbar(limits, position=dodge, width=0.25)
    
    p <- ggplot(df2, aes(fill=group, y=resp, x=trt))
    p + geom_bar(position=dodge)
    p + geom_bar(position=dodge) + geom_errorbar(limits, position=dodge, width=0.25)

    p <- ggplot(df, aes(colour=group, y=resp, x=trt))
    p + geom_point() + geom_errorbar(limits, width=0.2)
    p + geom_pointrange(limits)
    p + geom_crossbar(limits, width=0.2)

    # If we want to draw lines, we need to manually set the
    # groups which define the lines - here the groups in the 
    # original dataframe
    p + geom_line(aes(group=group)) + geom_errorbar(limits, width=0.2)    
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
