#' Title
#'
#' @param project_name
#' @param path
#'
#'
#' @return
#' @export
#'
#' @examples
create_new_project <- function(path='.'){
    config <- project_config()
    project_root <- file.path(path, config$dir_name)
    create_file_structure(config$dir_name, path)

}




