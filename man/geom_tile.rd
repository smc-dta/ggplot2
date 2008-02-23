\name{GeomTile}
\alias{geom_tile}
\alias{GeomTile}
\title{geom_tile}
\description{Tile plot as densely as possible, assuming that every tile is the same size. }
\details{
Similar to levelplot and image.

This page describes \code{\link{geom_tile}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with geom_tile.  Aesthetics are mapped to variables in the data with the \code{\link{aes}} function: \code{geom_tile(\code{\link{aes}}(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{y}: y position (\strong{required}) 
  \item \code{fill}: internal colour 
  \item \code{colour}: border colour 
  \item \code{size}: size 
  \item \code{width}: width of geom 
  \item \code{height}: height of geom 
  \item \code{size}: size 
  \item \code{linetype}: line type 
}
}
\usage{geom_tile(...)}
\arguments{
 \item{...}{ignored }
}
\seealso{\itemize{
  \item \url{http://had.co.nz/ggplot/geom_tile.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    # Generate data
    pp <- function (n,r=4) {
     x <- seq(-r*pi, r*pi, len=n)
     df <- expand.grid(x=x, y=x)
     df$r <- sqrt(df$x^2 + df$y^2)
     df$z <- cos(df$r^2)*exp(-df$r/6)
     df
    }
    p <- ggplot(pp(20), aes(x=x,y=y))
    
    p + geom_tile() #pretty useless!

    # Add aesthetic mappings
    p + geom_tile(aes(fill=z))
    p + geom_tile(aes(width=z, height=z))
    
    # Change scale
    p + geom_tile(aes(fill=z)) + scale_fill_gradient(low="green", high="red")

    # Use qplot instead
    qplot(x, y, data=pp(20), geom="tile", fill=z)
    qplot(x, y, data=pp(100), geom="tile", fill=z)
    
    # Missing values
    p <- ggplot(pp(20)[sample(20*20, size=200),], aes(x=x,y=y,fill=z))
    p + geom_tile()
    
    # Input that works with image
    image(t(volcano)[ncol(volcano):1,])
    ggplot(melt(volcano), aes(x=X1, y=X2, fill=value)) + geom_tile()
    
    # inspired by the image-density plots of Ken Knoblauch
    cars <- ggplot(mtcars, aes(y=factor(cyl), x=mpg))
    cars + geom_point()
    cars + stat_bin(aes(fill=..count..), geom="tile", binwidth=3)
    cars + stat_bin(aes(fill=..density..), geom="tile", binwidth=3)

    cars + stat_density(aes(fill=..density..), geom="tile")
    cars + stat_density(aes(fill=..count..), geom="tile")
    
    # Another example with with unequal tile sizes
    x.cell.boundary <- c(0, 4, 6, 8, 10, 14)
    example <- data.frame(
      x = rep(c(2, 5, 7, 9, 12), 2),
      y = factor(rep(c(1,2), each=5)),
      z = rep(1:5, each=2),
      w = rep(diff(x.cell.boundary), 2)
    )
  
    qplot(x, y, fill=z, data=example, geom="tile")
    qplot(x, y, fill=z, data=example, geom="tile", width=w)
    qplot(x, y, fill=factor(z), data=example, geom="tile", width=w)

    # You can manually set the colour of the tiles using 
    # scale_manual
    col <- c("darkblue", "blue", "green", "orange", "red")
    qplot(x, y, fill=col[z], data=example, geom="tile", width=w, group=1) + scale_fill_identity(labels=letters[1:5], breaks=col, guide="tile")
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
