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
#' The license used for the project is interactively selected when the project
#' is created. License options from \code{\link[usethis:licenses]{licenses}}
#' are available. For internal use. Users should rely on functions
#' \code{\link[usethis]{use_mit_license}} rather than calling \code{create_license_file}
#' directly.
#'
#' @param project_root root directory for the project being created.
#' @param license the license selected interactively when
#' \code{\link{create_new_project}} is called. The license options from
#' \code{\link[usethis:licenses]{licenses}} are available.
#'
#' @param author The author of the project
#'
#' @keywords internal
#'

create_license_file <- function(project_root, license, author){
    usethis::proj_set(project_root)

    if (license == "MIT") {
        usethis::use_mit_license(name = author)
    } else if (license == 'Apache 2.0') {
        usethis::use_apl2_license(name = author)
    } else if (license == "GPL V3") {
        usethis::use_gpl3_license(name = author)
    } else if (license == "AGPL V3") {
        usethis::use_agpl3_license(name = author)
    } else if (license == "LGPL V3") {
        usethis::use_lgpl_license(name = author)
    } else if (license == "CCBY 4.0") {
        usethis::use_ccby_license(name = author)
    } else if (license == 'CC0') {
        usethis::use_cc0_license(name = author)
    } else if (license == "No License File") {
        NULL
    }
}

#' Add Continuous Integration Configuration File
#'
#' Desired configuration files are created as part of the project creation
#' process. CI options included in \code{\link[usethis:ci]{ci}} are
#' available.  For internal use. Users should rely on functions
#' in \strong{usethis} rather than calling \code{create_ci_configs}
#' directly.
#'
#' @param project_root root directory for the project being created.
#' @param ci_systems a vector of CI systems selected when
#' \code{\link{create_new_project}} is called
#'
#' @keywords internal
#'

create_ci_configs <- function(project_root, ci_systems){
    usethis::proj_set(project_root)

    for (i in ci_systems) {
        if (i == 'Travis CI') {
            usethis::use_travis()
        } else if (i == 'GitHub Actions') {
            message('Not Yet Implemented. Please Manually configure')

        } else if (i == 'Gitlab CI') {
            usethis::use_gitlab_ci()
        } else if (i == "Jenkins") {
            usethis::use_jenkins()
        } else if (i == "Circle CI") {
            usethis::use_circleci()
        } else if (i == "AppVeyor") {
            usethis::use_appveyor()
        } else if (i == "None") {
            invisible(FALSE)
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
#'For internal use. Users should rely on functions
#' \code{\link[usethis]{use_make}} rather than calling \code{create_makefile}
#' directly.
#'
#' @param project_root root directory for the project being created.
#'
#'
#' @keywords internal
#'

create_makefile <- function(project_root){
    usethis::proj_set(project_root)
    usethis::use_make()
}


create_here_file <- function(project_root){
    file.create(file.path(project_root, ".here"))
    usethis::ui_done(".here file created")
}

