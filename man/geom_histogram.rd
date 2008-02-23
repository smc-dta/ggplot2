\name{GeomHistogram}
\alias{geom_histogram}
\alias{GeomHistogram}
\title{geom_histogram}
\description{Histogram}
\details{
geom_histogram is an alias for \code{\link{geom_bar}} + \code{\link{stat_bin}} so you will need to look at the documentation for those objects to get more information about the parameters.

This page describes \code{\link{geom_histogram}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with geom_histogram.  Aesthetics are mapped to variables in the data with the \code{\link{aes}} function: \code{geom_histogram(\code{\link{aes}}(x = var))}
\itemize{
  \item \code{x}: x position (\strong{required}) 
  \item \code{min}: minimum of interval (\strong{required}) 
  \item \code{max}: maximum of interval (\strong{required}) 
  \item \code{colour}: border colour 
  \item \code{fill}: internal colour 
  \item \code{min}: minimum of interval (\strong{required}) 
  \item \code{width}: width of geom 
  \item \code{size}: size 
  \item \code{linetype}: line type 
  \item \code{max}: maximum of interval (\strong{required}) 
}
}
\section{Advice}{
geom_histogram only allows you to set the width of the bins (with the binwidth parameter), not the number of bins, and it certainly does not suport the use of common heuristics to select the number of bins.  In practice, you will need to use multiple bin widths to discover all the signal in the data, and having bins with meaningful widths (rather than some arbitrary fraction of the range of the data) is more interpretable.

 }
\usage{geom_histogram(...)}
\arguments{
 \item{...}{ignored }
}
\seealso{\itemize{
  \item \code{\link{stat_bin}}: for more details of the binning alogirithm
  \item \code{\link{position_dodge}}: for creating side-by-side barcharts
  \item \code{\link{position_stack}}: for more info on stacking
  \item \url{http://had.co.nz/ggplot/geom_histogram.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    
    # Simple examles
    qplot(rating, data=movies, geom="histogram")
    qplot(rating, data=movies, weight=votes, geom="histogram")
    qplot(rating, data=movies, weight=votes, binwidth=1)
    qplot(rating, data=movies, weight=votes, binwidth=0.1)
    
    # More complex
    m <- ggplot(movies, aes(x=rating))
    m + geom_histogram()
    m + geom_histogram(aes(y = ..density..)) + geom_density()

    m + geom_histogram(binwidth=1)
    m + geom_histogram(binwidth=0.5)
    m + geom_histogram(binwidth=0.1)
    
    # Add aesthetic mappings
    m + geom_histogram(aes(weight = votes))
    m + geom_histogram(aes(y = ..count..))
    m + geom_histogram(aes(fill = ..count..))

    # Change scales
    m + geom_histogram(aes(fill = ..count..)) + scale_fill_gradient(low="green", high="red")
    
    m <- m + aes(x=votes)
    m + geom_histogram() + scale_x_log()
    m + geom_histogram() + scale_x_sqrt()
    
    # Change coordinate systems
    m + geom_histogram() + coord_trans(y = "sqrt")
      
    # Set aesthetics to fixed value
    m + geom_histogram(colour="darkgreen", fill="white") + aes(x=rating)
    
    # Use facets
    m <- m + facet_grid(Action ~ Comedy)
    m + geom_histogram()

    # Multiple histograms on the same graph
    # see ?position, ?position_fill, etc for more details
    ggplot(diamonds, aes(x=price)) + geom_bar()
    hist_cut <- ggplot(diamonds, aes(x=price, fill=cut))
    hist_cut + geom_bar() # defaults to stacking
    hist_cut + geom_bar(position="fill")
    hist_cut + geom_bar(position="dodge")
    

}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
