\name{GeomJitter}
\alias{geom_jitter}
\alias{GeomJitter}
\title{geom_jitter}
\description{Points, jittered to reduce overplotting}
\details{
The jitter geom is a convenient default for \code{\link{geom_point}} + \code{\link{position_jitter}}.  See \code{\link{position_jitter}} for more details on adjusting the amount of jittering.

This page describes \code{\link{geom_jitter}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with geom_jitter.  Aesthetics are mapped to variables in the data with the \code{\link{aes}} function: \code{geom_jitter(\code{\link{aes}}(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{y}: y position (\strong{required}) 
  \item \code{shape}: shape of point 
  \item \code{colour}: border colour 
  \item \code{size}: size 
}
}
\section{Advice}{
It is often useful for plotting categorical data.

}
\usage{geom_jitter(...)}
\arguments{
 \item{...}{ignored }
}
\seealso{\itemize{
  \item \code{\link{geom_point}}: Regular, unjittered points
  \item \code{\link{geom_boxplot}}: Another way of looking at the conditional distribution of a variable
  \item \code{\link{position_jitter}}: For examples, using jittering with other geoms
  \item \url{http://had.co.nz/ggplot/geom_jitter.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    p <- ggplot(movies, aes(x=mpaa, y=rating)) 
    p + geom_point()
    p + geom_point(position = "jitter")

    # Add aesthetic mappings
    p + geom_jitter(aes(colour=rating))
    
    # Vary parameters
    p + geom_jitter(position=position_jitter(xjitter=5))
    p + geom_jitter(position=position_jitter(yjitter=5))
    
    # Use qplot instead
    qplot(mpaa, rating, data=movies, geom="jitter")
    qplot(mpaa, rating, data=movies, geom=c("boxplot","jitter"))
    qplot(mpaa, rating, data=movies, geom=c("jitter", "boxplot"))
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
