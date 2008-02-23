\name{GeomBar}
\alias{geom_bar}
\alias{GeomBar}
\title{geom_bar}
\description{Bars, rectangles with bases on y-axis}
\details{
The bar geom is used to produce 1d area plots: bar charts for categorical x, and histograms for continuous y.  \code{\link{stat_bin}} explains the details of these summaries in more detail.  In particular, you can use the \code{weight} aesthetic to create weighted histograms and barcharts where the height of the bar no longer represent a count of observations, but a sum over some other variable.  See the examples for a practical example.

By default, multiple x's occuring in the same place will be stacked a top one another by \code{\link{position_stack}}.  If you want them to be dodged from side-to-side, check out \code{\link{position_dodge}}.  Finally, \code{\link{position_fill}} shows relative propotions at each x by stacking the bars and then stretch or squashing them all to the same height

This page describes \code{\link{geom_bar}}, see \code{\link{layer}} and \code{\link{qplot}} for how to create a complete plot from individual components.
}
\section{Aesthetics}{
The following aesthetics can be used with geom_bar.  Aesthetics are mapped to variables in the data with the \code{\link{aes}} function: \code{geom_bar(\code{\link{aes}}(x = var))}
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
Sometimes, bar charts are used not as a distributional summary, but instead of a dotplot.  Generally, it's preferable to use a dotplot (see \code{\link{geom_point}}) as it has a better data-ink ratio.  However, if you do want to create this type of plot, you can set y to the value you have calculated, and use stat='identity'.

A bar chart maps the height of the bar to a variable, and so the base of the bar must always been shown to produce a valid visual comparison.  Naomi Robbins has a nice <a href='http://www.b-eye-network.com/view/index.php?cid=2468&amp;fc=0&amp;frss=1&amp;ua'>article on this topic</a>.  This is the reason it doesn't make sense to use a log-scaled y axis.

}
\usage{geom_bar(...)}
\arguments{
 \item{...}{ignored }
}
\seealso{\itemize{
  \item \code{\link{stat_bin}}: for more details of the binning alogirithm
  \item \code{\link{position_dodge}}: for creating side-by-side barcharts
  \item \code{\link{position_stack}}: for more info on stacking
  \item \url{http://had.co.nz/ggplot/geom_bar.html}
}}
\value{A \code{\link{layer}}}
\examples{\dontrun{
    # Generate data
    mtcars$cyl <- factor(mtcars$cyl)
    c <- ggplot(mtcars, aes(x=cyl))
    
    c + geom_bar()
    c + geom_bar() + coord_flip()
    c + geom_bar(fill="white", colour="darkgreen")
    
    # Use qplot
    qplot(cyl, data=mtcars, geom="bar")
    qplot(cyl, data=mtcars, geom="bar", fill=cyl)
    
    # Dodged bar charts    
    ggplot(diamonds, aes(x=price, fill=cut)) + geom_bar(position="dodge")
    ggplot(diamonds, aes(x=clarity, fill=cut)) + geom_bar(position="dodge")
    # compare with 
    ggplot(diamonds, aes(x=cut, fill=cut)) + geom_bar() + facet_grid(. ~ clarity)
    
    # Often we don't want the height of the bar to represent the
    # count of observations, but the sum of some other variable.
    # For example, the following plot shows the number of movies
    # in each rating.
    qplot(rating, data=movies, geom="bar")
    # If, however, we want to see the number of votes cast in each
    # category, we need to weight by the votes variable
    qplot(rating, data=movies, geom="bar", weight=votes)
    # We could also see the total expenditure for each category:
    qplot(rating, data=movies, geom="bar", weight=budget)
    
    # A bar chart used to display means
    meanprice <- tapply(diamonds$price, diamonds$cut, mean)
    qplot(unique(diamonds$cut), meanprice)
    qplot(unique(diamonds$cut), meanprice, geom="bar", stat="identity")
    
    rm(mtcars)
}}
\author{Hadley Wickham, \url{http://had.co.nz/}}
\keyword{hplot}
