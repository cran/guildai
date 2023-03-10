% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/auto-generated-cli-doc-stubs.R
\name{guild_select_cli}
\alias{guild_select_cli}
\title{guild_select_cli
Select a run and shows its ID.}
\usage{
guild_select_cli(
  ...,
  all = NA,
  min = NULL,
  max = NULL,
  short_id = NA,
  attr = NULL,
  path = NA,
  dir = NA,
  filter = NULL,
  operation = NULL,
  label = NULL,
  unlabeled = NA,
  tag = NULL,
  comment = NULL,
  marked = NA,
  unmarked = NA,
  started = NULL,
  digest = NULL,
  running = NA,
  completed = NA,
  error = NA,
  terminated = NA,
  pending = NA,
  staged = NA,
  remote = NULL
)
}
\arguments{
\item{...}{passed on to the \code{guild} executable. Arguments are automatically quoted with \code{shQuote()}, unless they are protected with \code{I()}. Pass \code{'--help'} or \code{help = TRUE} to see all options.}

\item{all}{(bool) Select all matching runs, not just the latest.}

\item{min}{Select the run with the lowest value for the specified COLSPEC.}

\item{max}{Select the run with the highest value for the specified COLSPEC.}

\item{short_id}{(bool) Use short ID.}

\item{attr}{Show specified run attribute rather than run ID.}

\item{path}{(bool) Show run path.}

\item{dir}{(bool) Show run path.}

\item{filter}{Filter runs using a filter expression. See Filter by Expression above for details.}

\item{operation}{Filter runs with operations matching \code{VAL}.}

\item{label}{Filter runs with labels matching VAL. To show unlabeled runs, use \code{unlabeled}.}

\item{unlabeled}{(bool) Filter runs without labels.}

\item{tag}{Filter runs with TAG.}

\item{comment}{Filter runs with comments matching VAL.}

\item{marked}{(bool) Filter marked runs.}

\item{unmarked}{(bool) Filter unmarked runs.}

\item{started}{Filter runs started within RANGE. See above for valid time ranges.}

\item{digest}{Filter runs with a matching source code digest.}

\item{running}{(bool) Filter runs that are still running.}

\item{completed}{(bool) Filter completed runs.}

\item{error}{(bool) Filter runs that exited with an error.}

\item{terminated}{(bool) Filter runs terminated by the user.}

\item{pending}{(bool) Filter pending runs.}

\item{staged}{(bool) Filter staged runs.}

\item{remote}{Run the operation remotely.}
}
\description{
This command is generally used when specifying a run ID for
another Guild command. For example, to restart the latest \code{train}
run:
}
\details{
\if{html}{\out{<div class="sourceCode">}}\preformatted{`guild run --restart $(guild select -o train)`
}\if{html}{\out{</div>}}
\subsection{Specify a Run}{

You may specify a run using a run ID, a run ID prefix, or a
one-based index corresponding to a run returned by the \code{list}
command.

If RUN isn't specified, the latest matching run is selected.
}

\subsection{Selecting Min or Max Scalar}{

To select the run with the lowest or highest column value, use
\code{min} or \code{max} respectively. For example, to select the run
with the lowest \code{loss} scalar value, use \verb{min loss}.

For help with COLSPEC formatting, see \verb{COLUMN SPECS} in \code{compare}
help by running \verb{guild compare help}.

Other run filters are applied before selecting a minimum or
maximium scalar value.
}

\subsection{Filter by Operation}{

Runs may be filtered by operation using \code{operation}.  A run is
only included if any part of its full operation name, including
the package and model name, matches the value.

Use \code{operation} multiple times to include more runs.
}

\subsection{Filter by Label}{

Use \code{label} to only include runs with labels containing a
specified value. To select runs that do not contain a label,
specify a dash '-' for \code{VAL}.

Use \code{label} multiple times to include more runs.
}

\subsection{Filter by Tag}{

Use \code{tag} to only include runs with a specified tag. Tags must
match completely and are case sensitive.

Use \code{tag} multiple times to include more runs.
}

\subsection{Filter by Marked and Unmarked}{

Use \code{marked} to only include marked runs.

Use \code{unmarked} to only include unmarked runs. This option may
not be used with \code{marked}.
}

\subsection{Filter by Expression}{

Use \code{filter} to limit runs that match a filter
expressions. Filter expressions compare run attributes, flag
values, or scalars to target values. They may include multiple
expressions with logical operators.

For example, to match runs with flag \code{batch-size} equal to 100
that have \code{loss} less than 0.8, use:

\if{html}{\out{<div class="sourceCode">}}\preformatted{filter 'batch-size = 10 and loss < 0.8'
}\if{html}{\out{</div>}}

\strong{IMPORTANT:} You must quote EXPR if it contains spaces or
characters that the shell uses (e.g. '<' or '>').

Target values may be numbers, strings or lists containing numbers
and strings. Strings that contain spaces must be quoted, otherwise
a target string values does not require quotes. Lists are defined
using square braces where each item is separated by a comma.

Comparisons may use the following operators: '=', '!=' (or '<>'),
'<', '<=', '>', '>='. Text comparisons may use 'contains' to test
for case-insensitive string membership. A value may be tested for
membership or not in a list using 'in' or 'not in'
respectively. An value may be tested for undefined using 'is
undefined' or defined using 'is not undefined'.

Logical operators include 'or' and 'and'. An expression may be
negated by preceding it with 'not'. Parentheses may be used to
control the order of precedence when expressions are evaluated.

If a value reference matches more than one type of run information
(e.g. a flag is named 'label', which is also a run attribute), the
value is read in order of run attribute, then flag value, then
scalar. To disambiguate the reference, use a prefix \verb{attr:},
\verb{flag:}, or \verb{scalar:} as needed. For example, to filter using a
flag value named 'label', use 'flag:label'.

Other examples:

\verb{operation = train and acc > 0.9}
\verb{operation = train and (acc > 0.9 or loss < 0.3)}
\verb{batch-size = 100 or batch-size = 200}
\verb{batch-size in [100,200]}
\verb{batch-size not in [400,800]}
\verb{batch-size is undefined}
\verb{batch-size is not undefined}
\verb{label contains best and operation not in [test,deploy]}
\verb{status in [error,terminated]}

\strong{NOTE:} Comments and tags are not supported in filter
expressions at this time. Use \code{comment} and \code{tag} options
along with filter expressions to further refine a selection.
}

\subsection{Filter by Run Start Time}{

Use \code{started} to limit runs to those that have started within a
specified time range.

\strong{IMPORTANT:} You must quote RANGE values that contain
spaces. For example, to filter runs started within the last hour,
use the option:

\if{html}{\out{<div class="sourceCode">}}\preformatted{started 'last hour'
}\if{html}{\out{</div>}}

You can specify a time range using several different forms:

\verb{after DATETIME}
\verb{before DATETIME}
\verb{between DATETIME and DATETIME}
\verb{last N minutes|hours|days}
\code{today|yesterday}
\verb{this week|month|year}
\verb{last week|month|year}
\verb{N days|weeks|months|years ago}

\code{DATETIME} may be specified as a date in the format \code{YY-MM-DD}
(the leading \verb{YY-} may be omitted) or as a time in the format
\code{HH:MM} (24 hour clock). A date and time may be specified
together as \verb{DATE TIME}.

When using \verb{between DATETIME and DATETIME}, values for
\code{DATETIME} may be specified in either order.

When specifying values like \code{minutes} and \code{hours} the trailing
\code{s} may be omitted to improve readability. You may also use
\code{min} instead of \code{minutes} and \code{hr} instead of \code{hours}.

Examples:

\verb{after 7-1}
\verb{after 9:00}
\verb{between 1-1 and 4-30}
\verb{between 10:00 and 15:00}
\verb{last 30 min}
\verb{last 6 hours}
\code{today}
\verb{this week}
\verb{last month}
\verb{3 weeks ago}
}

\subsection{Filter by Source Code Digest}{

To show runs for a specific source code digest, use \code{-g} or
\code{digest} with a complete or partial digest value.
}

\subsection{Filter by Run Status}{

Runs may also be filtered by specifying one or more status
filters: \code{running}, \code{completed}, \code{error}, and
\code{terminated}. These may be used together to include runs that
match any of the filters. For example to only include runs that
were either terminated or exited with an error, use \verb{terminated error}, or the short form \code{-Set}.

You may combine more than one status character with \code{-S} to
expand the filter. For example, \code{-Set} shows only runs with
terminated or error status.

Status filters are applied before \code{RUN} indexes are resolved. For
example, a run index of \code{1} is the latest run that matches the
status filters.
}

\subsection{Select remote rnus}{

To apply \code{select} to remote runs, specify \verb{remote REMOTE}. Use
\verb{guild remotes} to list available remotes.

For information on configuring remotes, see \verb{guild remotes help}.
}
}
\keyword{internal}
