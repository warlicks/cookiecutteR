#' Create Project Directories.
#'
#' @param project_root root directory for the project being created.
#' @param check_project_name check if project name is a valid name for CRAN.
#' Set via config options.
#'
#' @keywords internal
#'

create_file_structure <- function(project_root, check_project_name) {
    usethis::create_package(project_root,
                            open = FALSE,
                            check_name = check_project_name)

    # Create folders for raw, external intermediate and processed data.
    dir.create(file.path(project_root, "data/external"), recursive = TRUE)
    dir.create(file.path(project_root, "data/raw"), recursive = TRUE)
    dir.create(file.path(project_root, "data/interim"), recursive = TRUE)
    dir.create(file.path(project_root, "data/processed"), recursive = TRUE)


    # Create other top level directories
    dir.create(file.path(project_root, "models"))
    dir.create(file.path(project_root, "notebooks"))
    dir.create(file.path(project_root, "references"))


    # Create report Directory
    dir.create(file.path(project_root, "reports/figures"), recursive = TRUE)

    # Create Directory for source code.
    dir.create(file.path(project_root, 'man'), recursive = TRUE)
    #dir.create(file.path(project_root, 'tests/testthat'), recursive = TRUE)

    usethis::proj_set(project_root)
    usethis::use_testthat()
    usethis::use_build_ignore(c("data/*", "docs/*", "models/*",
                                "notebooks/*", "references/*")
                              )
    usethis::ui_done('File structure created')
}

#' Create License File For Project
#'
#' The licence used for the project is interactively selected when the project
#' is created. License options from \code{\link[usethis]{use_mit_license}}
#' are avaliable. For internal use. Users should rely on funtions
#' \code{\link[usethis]{use_mit_license}} rather than calling \code{create_license_file}
#' directly.
#'
#' @param project_root root directory for the project being created.
#' @param license the license selected interactively when
#' \code{\link{create_new_project}} is called. The license options from
#' \code{\link[usethis]{use_mit_license}} are avaliable.
#' @param author The author of the project
#'
#' @keywords internal
#'

create_license_file <- function(project_root, license, author){

    copyright_data <- list(name = author, year = format(Sys.Date(), '%Y'))
    out_path <- file.path(project_root, 'LICENSE.md')
    if (license == "MIT") {
        copy_template(out_path, 'license-mit.md', copyright_data)
    } else if (license == 'Apache 2.0') {
        copy_template(out_path, 'license-apache-2.0.md', copyright_data)
    } else if (license == "GPL V3") {
        copy_template(out_path, 'license-GPL-3.md', copyright_data)
    } else if (license == "AGPL V3") {
        copy_template(out_path, 'license-AGPL-3.md', copyright_data)
    } else if (license == "LGPL V3") {
        copy_template(out_path, 'license-LGPL-2.1.md', copyright_data)
    } else if (license == "CCBY 4.0") {
        copy_template(out_path, 'license-ccby-4.md', copyright_data)
    } else if (license == 'CC0') {
        copy_template(out_path, 'license-cc0.md', copyright_data)
    } else if (license == "No License File") {
        invisible()
    }

    usethis::ui_done(paste("Created", license, 'license file', sep = ' '))
}

#' Add Continious Intergration Configuration File
#'
#' Desired configuration files are created as part of the project creation
#' process. CI options included in \code{\link[usethis]{use_travis}} are
#' avliable.  For internal use. Users should rely on funtions
#' \code{\link[usethis]{use_travis}} rather than calling \code{create_ci_configs}
#' directly.
#'
#' @param project_root root directory for the project being created.
#' @param ci_systems a vector of CI systems selected when \code{\link{create_new_project}} is called
#'
#' @keywords internal
#'

create_ci_configs <- function(project_root, ci_systems){
    for (i in ci_systems) {
        if (i == 'Travis CI') {
            outpath <- file.path(project_root, '.travis.yml')
            copy_template(outpath, 'travis.yml')
        } else if (i == 'GitHub Actions') {
            message('Not Yet Implemented. Please Manually configure')

        } else if (i == 'Gitlab CI') {
            outpath <- file.path(project_root, 'gitlab-ci.yml')
            copy_template(outpath, 'gitlab-ci.yml')
        } else if (i == "Jenkins") {
            outpath <- file.path(project_root, 'jenkinsfile')
            copy_template(outpath, 'Jenkinsfile')
        } else if (i == "Circle CI") {
            circleci_dir <- file.path(project_root, ".circleci")
            if (!dir.exists(circleci_dir)) {
                dir.create(circleci_dir)
            }
            outpath <- file.path(circleci_dir, "config.yml")
            copy_template(outpath, "circleci-config.yml")
        } else if (i == "AppVeyor") {
            outpath <- file.path(project_root, "appveyor.yml")
            copy_template(outpath, "appveyor.yml")
        } else if (i == "None") {
            invisible()
        }
    }

    usethis::ui_done(paste('Config files for',
                           paste(ci_systems, collapse = ', '),
                           'created',
                           sep = ' ')
                     )
}


#' Add a Makefile to the project
#'
#'For internal use. Users should rely on funtions
#' \code{\link[usethis]{use_travis}} rather than calling \code{create_makefile}
#' directly.
#'
#' @param project_root root directory for the project being created.
#'
#'
#' @keywords internal
#'

create_makefile <- function(project_root){
    outpath <- file.path(project_root, 'Makefile')
    copy_template(outpath, 'Makefile')

    usethis::ui_done("Makefile created")
}


create_here_file <- function(project_root){
    file.create(file.path(project_root, ".here"))
    usethis::ui_done(".here file created")
}

#' Use A Template to Add Project Infastructure.
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

copy_template <- function(path, template, data=list()){
    template_path <- fs::path_package('usethis', 'templates', template)
    template_text = readLines(template_path)
    writeLines(whisker::whisker.render(template_text, data), path)
}
