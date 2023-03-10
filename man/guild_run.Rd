% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/guild.R
\name{guild_run}
\alias{guild_run}
\title{Launch a guild run}
\usage{
guild_run(
  opspec = "train.R",
  flags = NULL,
  ...,
  echo = TRUE,
  as_job = getOption("guildai.run_as_job", TRUE)
)
}
\arguments{
\item{opspec}{typically a path to an R script, but could be any
string that guild recognizes as a valid operation.}

\item{flags}{flag values for the run(s).
\itemize{
\item A named list or vector like \code{c(noise = .3, dropout = .4)}. Lists with
vectors of length greater than 1 are automatically expanded into a
grid of combinations for a batch of runs. For example, \verb{list(noise   = c(.2, .3), dropout = c(.4, .5)} expands to a batch of 4 runs.
\item A dataframe of flags for a batch of runs, one row per run.
\item A scalar string like \code{"noise=.3 dropout=.4"}. Any flags specification
accepted at the terminal is valid here as well.
}}

\item{...}{
  Arguments passed on to \code{\link[=guild_run_cli]{guild_run_cli}}
  \describe{
    \item{\code{label}}{Set a label for the run.}
    \item{\code{tag}}{Associate TAG with run. May be used multiple times.}
    \item{\code{comment}}{Comment associated with the run.}
    \item{\code{run_dir}}{Use alternative run directory DIR. Cannot be used with \code{stage}.}
    \item{\code{stage}}{(bool) Stage an operation.}
    \item{\code{start}}{Start a staged run or restart an existing run. Cannot be used with \code{proto} or \code{run_dir}.}
    \item{\code{restart}}{Start a staged run or restart an existing run. Cannot be used with \code{proto} or \code{run_dir}.}
    \item{\code{proto}}{Use the operation, flags and source code from RUN. Flags may be added or redefined in this operation. Cannot be used with \code{restart}.}
    \item{\code{force_sourcecode}}{(bool) Use working source code when \code{restart} or \code{proto} is specified. Ignored otherwise.}
    \item{\code{gpus}}{Limit availabe GPUs to DEVICES, a comma separated list of device IDs. By default all GPUs are available. Cannot beused with \code{no_gpus}.}
    \item{\code{no_gpus}}{(bool) Disable GPUs for run. Cannot be used with \code{gpus}.}
    \item{\code{batch_label}}{Label to use for batch runs. Ignored for non-batch runs.}
    \item{\code{batch_tag}}{Associate TAG with batch. Ignored for non-batch runs. May be used multiple times.}
    \item{\code{batch_comment}}{Comment associated with batch.}
    \item{\code{optimizer}}{Optimize the run using the specified algorithm. See Optimizing Runs for more information.}
    \item{\code{optimize}}{(bool) Optimize the run using the default optimizer.}
    \item{\code{minimize}}{Column to minimize when running with an optimizer. See help for compare command for details specifying a column. May not be used with \code{maximize}.}
    \item{\code{maximize}}{Column to maximize when running with an optimizer. See help for compare command for details specifying a column. May not be used with \code{minimize}.}
    \item{\code{opt_flag}}{Flag for OPTIMIZER. May be used multiple times.}
    \item{\code{max_trials}}{Maximum number of trials to run in batch operations. Default is optimizer specific. If optimizer is not specified, default is 20.}
    \item{\code{trials}}{Maximum number of trials to run in batch operations. Default is optimizer specific. If optimizer is not specified, default is 20.}
    \item{\code{stage_trials}}{(bool) For batch operations, stage trials without running them.}
    \item{\code{remote}}{Run the operation remotely.}
    \item{\code{force_flags}}{(bool) Accept all flag assignments, even for undefined or invalid values.}
    \item{\code{force_deps}}{(bool) Continue even when a required resource is not resolved.}
    \item{\code{stop_after}}{Stop operation after N minutes.}
    \item{\code{fail_on_trial_error}}{(bool) Stop batch operations when a trial exits with an error.}
    \item{\code{needed}}{(bool) Run only if there is not an available matching run. A matching run is of the same operation with the same flag values that is not stopped due to an error.}
    \item{\code{background}}{(bool) Run operation in background.}
    \item{\code{pidfile}}{Run operation in background, writing the background process ID to PIDFILE.}
    \item{\code{no_wait}}{(bool) Don't wait for a remote operation to complete. Ignored if run is local.}
    \item{\code{save_trials}}{Saves generated trials to a CSV batch file. See BATCH FILES for more information.}
    \item{\code{keep_run}}{(bool) Keep run even when configured with 'delete-on-success'.}
    \item{\code{keep_batch}}{(bool) Keep batch run rather than delete it on success.}
    \item{\code{dep}}{Include PATH as a dependency.}
    \item{\code{quiet}}{(bool) Do not show output.}
    \item{\code{print_cmd}}{(bool) Show operation command and exit.}
    \item{\code{print_env}}{(bool) Show operation environment and exit.}
    \item{\code{print_trials}}{(bool) Show generated trials and exit.}
    \item{\code{help_model}}{(bool) Show model help and exit.}
    \item{\code{help_op}}{(bool) Show operation help and exit.}
    \item{\code{test_output_scalars}}{Test output scalars on output. Use '-' to read from standard intput.}
    \item{\code{test_sourcecode}}{(bool) Test source code selection.}
    \item{\code{test_flags}}{(bool) Test flag configuration.}
  }}

\item{echo}{whether output from the run is shown in the current R
console. Note, this has no effect on whether expressions are echoed
in the guild run stdout log. To disable echoing of expression in
the run logs, specify \verb{#| echo: false} in the run script
frontmatter.}

\item{as_job}{Run the operation as an RStudio background job. This is
ignored outside of the RStudio IDE.}
}
\value{
\code{NULL}, invisibly. This function is called for its
side effect.
}
\description{
Launch a guild run
}
