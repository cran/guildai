% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/runs.R
\name{runs_scalars}
\alias{runs_scalars}
\title{Get full set of runs scalars}
\usage{
runs_scalars(runs = NULL, ...)
}
\arguments{
\item{runs}{a runs selection}

\item{...}{passed on go \code{guild}}
}
\value{
A dataframe (tibble) of runs
}
\description{
Get full set of runs scalars
}
\examples{
\dontrun{
runs_scalars(1) # scalars from most recent run
runs_scalars(1:2) # scalars form two most recent runs

# pass in a dataframe of runs
runs_info() \%>\%
  filter(flags$epochs > 5) \%>\%
  runs_scalars()
}
}
