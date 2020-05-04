#' Title
#'
#' @param path directory where the project should be created. Don't inlude the
#' project name. Defaults to the current directory.
#'
#'
#' @return
#' @export
#'
#' @examples
create_new_project <- function(path='.'){
    config <- project_config()
    project_root <- file.path(path, config$dir_name)
    usethis::create_project(project_root, open=FALSE)
    create_file_structure(project_root)
    usethis::use_mit_license()
    # create_license_file(project_root,
    #                     config$selected_license,
    #                     config$author)

}




