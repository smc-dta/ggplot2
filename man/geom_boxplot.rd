\name{GeomBoxplot}
\alias{geom_boxplot}
\alias{GeomBoxplot}
\title{geom_boxplot}
\description{Box and whiskers plot}
\details{
This page describes \code{\link{geom_boxplot}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with geom_boxplot.  Aesthetics are mapped to variables in the data with the \code{\link{aes}} function: \code{geom_boxplot(\code{\link{aes}}(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{min}: minimum of interval (\strong{required}) 
  \item \code{max}: maximum of interval (\strong{required}) 
  \item \code{weight}: observation weight used in statistical transformation 
  \item \code{colour}: border colour 
  \item \code{fill}: internal colour 
  \item \code{size}: size 
  \item \code{width}: width of geom 
}
}
\usage{geom_boxplot(...)}
\arguments{
 \item{...}{other arguments}
}
\seealso{\itemize{
  \item \code{\link{stat_quantile}}: View quantiles conditioned on a continuous variable
  \item \code{\link{geom_jitter}}: Another way to look at conditional distributions
  \item \url{http://had.co.nz/ggplot/geom_boxplot.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    p <- ggplot(mtcars, aes(y=mpg, x=factor(cyl)))
    
    p + geom_boxplot()
    p + stat_boxplot()
    p + geom_boxplot() + geom_jitter()
    p + geom_boxplot() + coord_flip()
    
    p + geom_boxplot(outlier.colour = "green", outlier.size = 3)
    
    # Add aesthetic mappings
    p + geom_boxplot(aes(fill=cyl))
    p + geom_boxplot(aes(fill=factor(cyl)))
    p + geom_boxplot(aes(colour=cyl), size=2)
    
    # Dodged boxplots
    # - automatically split when an aesthetic variable is a factor
    p + geom_boxplot(aes(colour=factor(am)))
    p + geom_boxplot(aes(fill=factor(vs)), colour="black")
    p + geom_boxplot(aes(size=factor(gear)))
    
    # Set aesthetics to fixed value
    p + geom_boxplot(fill="black", colour="white", size=2)

    # Scales vs. Coordinate transforms
    movies$ratingr <- factor(round_any(movies$rating,0.5))
    m <- ggplot(movies, aes(y=votes, x=ratingr))
    m + geom_point()
    m + geom_boxplot()
    m + geom_boxplot() + scale_y_log10()
    m + geom_boxplot() + coord_trans(y="log10")
    m + geom_boxplot() + scale_y_log10() + coord_trans(y="log10")
    
    # Use qplot instead
    qplot(factor(cyl), mpg, data=mtcars, geom="boxplot")
    qplot(factor(cyl), mpg, data=mtcars, geom="boxplot") + coord_flip()
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
