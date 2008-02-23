\name{GeomText}
\alias{geom_text}
\alias{GeomText}
\title{geom_text}
\description{Textual annotations}
\details{
This page describes \code{\link{geom_text}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with geom_text.  Aesthetics are mapped to variables in the data with the \code{\link{aes}} function: \code{geom_text(\code{\link{aes}}(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{y}: y position (\strong{required}) 
  \item \code{label}: text label (\strong{required}) 
  \item \code{colour}: border colour 
  \item \code{size}: size 
  \item \code{angle}: angle 
  \item \code{hjust}: horizontal justification, between 0 and 1 
  \item \code{vjust}: vertical justification, between 0 and 1 
}
}
\usage{geom_text(...)}
\arguments{
 \item{...}{ignored }
}
\seealso{\itemize{
  \item \url{http://had.co.nz/ggplot/geom_text.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    p <- ggplot(mtcars, aes(x=wt, y=mpg, label=rownames(mtcars)))
    
    p + geom_text()
    p <- p + geom_point()

    # Set aesthetics to fixed value
    p + geom_text()
    p + geom_point() + geom_text(hjust=0, vjust=0)
    p + geom_point() + geom_text(angle = 45)

    # Add aesthetic mappings
    p + geom_text(aes(colour=factor(cyl)))
    p + geom_text(aes(colour=factor(cyl))) + scale_colour_discrete(l=40)
    
    p + geom_text(aes(size=wt))
    p + geom_text(aes(size=wt)) + scale_size(to=c(3,6))
    
    # Use qplot instead
    qplot(wt, mpg, data=mtcars, label=rownames(mtcars), geom=c("point","text"))
    qplot(wt, mpg, data=mtcars, label=rownames(mtcars), geom=c("point","text"), size=wt)
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
