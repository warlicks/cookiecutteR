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
#' \dontrun{
#' create_new_project()
#' }

create_new_project <- function(path='.'){
    config <- project_config()

    project_root <- file.path(gsub("/$", "", path), config$dir_name)

    if (rstudioapi::isAvailable()) {
        rstudioapi::initializeProject(project_root)
    }

    create_file_structure(project_root)


    create_license_file(project_root,
                        config$selected_license,
                        config$author)

    create_makefile(project_root)

    enable_git(project_root, config$git_status, config$set_git_remote)

    create_ci_configs(project_root, config$selected_ci)

    enable_renv(project_root, config$renv_status)


    #     #rstudioapi::documentSaveAll()
    #     rstudioapi::openProject(project_path, newSession = TRUE)
    #
    #
    #     #copy_template(rstudio_project, "template.Rproj")
    #     #usethis::ui_done("R Studio Project created")
    #     #usethis::ui_info("Activate project in a new session")
    #
    # } else {
    #     file.create(file.path(project_root, ".here"))
    #     usethis::ui_done(".here file created")
    #
    # }

}




