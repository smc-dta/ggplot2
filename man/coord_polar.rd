\name{CoordPolar}
\alias{coord_polar}
\alias{CoordPolar}
\title{coord_polar}
\description{Polar coordinates}
\details{
The polar coordinate system is most commonly used for pie charts, which are a stacked bar chart in polar coordinates.


This coordinate system has one argument, \code{theta}, which determines which variable is mapped to angle and which to radius.  Valid values are "x" and "y".

This page describes \code{\link{coord_polar}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\usage{coord_polar(...)}
\arguments{
 \item{...}{other arguments}
}
\seealso{\itemize{
  \item \url{http://had.co.nz/ggplot/coord_polar.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    # Still very experimental, so a bit on the buggy side, but I'm
    # working on it.  Also need to deal properly with cyclical
    # variables
    ggopt(aspect.ratio = 1)    
    
    # NOTE: Use these plots with caution - polar coordinates has
    # major perceptual problems.  The main point of these examples is 
    # to demonstrate how these common plots can be described in the
    # grammar.  Use with EXTREME caution.

    # A coxcomb plot = bar chart + polar coordinates
    cxc <- ggplot(mtcars, aes(x=factor(cyl))) + geom_bar(width=1, colour="black")
    cxc + coord_polar()
    # A new type of plot?
    cxc + coord_polar(theta = "y")
    
    # A pie chart = stacked bar chart + polar coordinates
    pie <- ggplot(mtcars, aes(x=factor(1), fill=factor(cyl))) + geom_bar(width=1)
    pie + coord_polar(theta="y")

    # A new type of plot?
    pie + coord_polar()
    
    # Hadley's favourite pie chart
    df <- data.frame(
      variable = c("resembles", "does not resemble"),
      value = c(80, 20)
    )
    ggplot(df, aes(x = "", y = value, fill = variable)) + geom_bar(width=1) + scale_fill_manual(values = c("red","yellow"), guide="tile") + coord_polar("y", start=pi/3) + opts(title = "Pac man")
    
    
    
    # Windrose + doughnut plot
    movies$rrating <- factor(round_any(movies$rating, 1))
    movies$budgetq <- factor(chop(movies$budget, 4), labels=1:4)
    
    doh <- ggplot(movies, aes(x=rrating, fill=budgetq))
    
    # Wind rose
    doh + geom_bar(width=1) + coord_polar()
    #Doughnut plot
    doh + geom_bar(width=0.9, position="fill") + coord_polar(theta="y")
    ggopt(aspect.ratio = NULL)
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
