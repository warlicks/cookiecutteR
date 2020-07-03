#' Use A Template to Add Project Infrastructure.
#'
#' For internal use. Users should call \code{\link[usethis]{use_template}}
#' instead.
#'
#' @param path path where file should be added.
#' @param template Name of the template to use.  Uses the templates included in \code{\link[usethis]{use_usethis}}.
#' @param data a list providing data, like author or project name to add to
#' the template.
#'
#' @keywords internal
#'
#'

# copy_template <- function(path, template, data=list()){
#     template_path <- fs::path_package('usethis', 'templates', template)
#     template_text = readLines(template_path)
#     writeLines(whisker::whisker.render(template_text, data), path)
# }
