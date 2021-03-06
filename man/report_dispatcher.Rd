% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/report_dispatcher.R
\name{report_dispatcher}
\alias{report_dispatcher}
\title{report_dispatcher}
\usage{
report_dispatcher(roster, cut_list, call_list, func_to_call, arg_list,
  calling_env = parent.frame(), ...)
}
\arguments{
\item{roster}{a roster dataframe.  must have a field called studentid}

\item{cut_list}{a list of 'org units' in your roster, in order from most general
to most specific.}

\item{call_list}{a list of booleans.  must be the same length as cut_list.  indicates if
the function should get called at cut_list[i]}

\item{func_to_call}{function that will get passed to do.call}

\item{arg_list}{arguments to pass to do.call.  \code{report_dispatcher} will inject
\code{studentids, depth_string} into the arg list, as well as named elements
corresponding to the key/value cut and element outlined above}

\item{calling_env}{defaults to parent frame.}

\item{...}{other parameters to pass through (namely cdfs).  todo: reformat this function
to take mapvizieR object.}
}
\value{
a cdf with new term fields
}
\description{
\code{report_dispatcher} munges test term data on a CDF
}

