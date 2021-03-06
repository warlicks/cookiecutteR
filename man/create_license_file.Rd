% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/file_create_utils.R
\name{create_license_file}
\alias{create_license_file}
\title{Create License File For Project}
\usage{
create_license_file(project_root, license, author)
}
\arguments{
\item{project_root}{root directory for the project being created.}

\item{license}{the license selected interactively when
\code{\link{create_new_project}} is called. The license options from
\code{\link[usethis:licenses]{licenses}} are available.}

\item{author}{The author of the project}
}
\description{
The license used for the project is interactively selected when the project
is created. License options from \code{\link[usethis:licenses]{licenses}}
are available. For internal use. Users should rely on functions
\code{\link[usethis:licenses]{use_mit_license}} rather than calling
\code{create_license_file("MIT", author)} directly.
}
\keyword{internal}
