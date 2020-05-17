#' Create A New Project
#'
#' Creates a new project using the \href{https://drivendata.github.io/cookiecutter-data-science/}{Cooiecutter for Data Science} structure.
#'
#' @param path directory where the project should be created. Don't
#' include the project name. Defaults to the current directory.
#'
#' @export
#'
#' @examples
#' \donttest{
#' create_new_project()
#' }

create_new_project <- function(path='.'){
    config <- project_config()

    project_root <- file.path(path, config$dir_name)

    create_file_structure(project_root)

    create_license_file(project_root,
                        config$selected_license,
                        config$author)

    create_makefile(project_root)

    enable_git(project_root, config$git_status, config$set_git_remote)

    create_ci_configs(project_root, config$selected_ci)

    if (config$renv_status) {
        renv::init(project = project_root, bare = TRUE, restart = FALSE)
    }


}




