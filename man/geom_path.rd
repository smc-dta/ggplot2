\name{GeomPath}
\alias{geom_path}
\alias{GeomPath}
\title{geom_path}
\description{Connect observations, in original order}
\details{
This page describes \code{\link{geom_path}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with geom_path.  Aesthetics are mapped to variables in the data with the \code{\link{aes}} function: \code{geom_path(\code{\link{aes}}(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{y}: y position (\strong{required}) 
  \item \code{colour}: border colour 
  \item \code{size}: size 
  \item \code{linetype}: line type 
}
}
\usage{geom_path(...)}
\arguments{
 \item{...}{ignored }
}
\seealso{\itemize{
  \item \code{\link{geom_line}}: Functional (ordered) lines
  \item \code{\link{geom_polygon}}: Filled paths (polygons)
  \item \code{\link{geom_segment}}: Line segments
  \item \url{http://had.co.nz/ggplot/geom_path.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    # Generate data
    myear <- do.call(rbind, by(movies, movies$year, function(df) data.frame(year=df$year[1], mean.length = mean(df$length), mean.rating=mean(df$rating))))
    p <- ggplot(myear, aes(x=mean.length, y=mean.rating))
    p + geom_path()

    # Add aesthetic mappings
    p + geom_path(aes(size=year))
    p + geom_path(aes(colour=year))
    
    # Change scale
    p + geom_path(aes(size=year)) + scale_size(to=c(1, 3))

    # Set aesthetics to fixed value
    p + geom_path(colour = "green")
    
    # Use qplot instead
    qplot(mean.length, mean.rating, data=myear, geom="path")
    
    # Using economic data:
    # How is unemployment and personal savings rate related?
    qplot(unemploy/pop, psavert, data=economics)
    qplot(unemploy/pop, psavert, data=economics, geom="path")
    qplot(unemploy/pop, psavert, data=economics, geom="path", size=as.numeric(date))

    # How is rate of unemployment and length of unemployment?
    qplot(unemploy/pop, uempmed, data=economics)
    qplot(unemploy/pop, uempmed, data=economics, geom="path")
    qplot(unemploy/pop, uempmed, data=economics, geom="path") +
      geom_point(data=head(economics, 1), colour="red") + 
      geom_point(data=tail(economics, 1), colour="blue")
    qplot(unemploy/pop, uempmed, data=economics, geom="path") +
      geom_text(data=head(economics, 1), label="1967", colour="blue") + 
      geom_text(data=tail(economics, 1), label="2007", colour="blue")
    
    # Setting line type vs colour/size
    # Line type needs to be applied to a line as a whole, so it can
    # not be used with colour or size that vary across a line
    
    x <- seq(0.01, .99, length=100)
    df <- data.frame(rep(x, 2), y = c(qlogis(x), 2 * qlogis(x)), group = rep(c("a","b"), each=100))
    p <- ggplot(df, aes(x=x, y=y, group=group))

    # Should work
    p + geom_line(linetype = 2)
    p + geom_line(aes(colour = group), linetype = 2)
    p + geom_line(aes(colour = x))
    
    # Should fail
    p + geom_line(aes(colour = x), linetype=2)
    
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
