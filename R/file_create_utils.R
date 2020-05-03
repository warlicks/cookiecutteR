#' Title
#'
#' @param project_name
#' @param path
#'
#' @return
#' @keywords internal
#'

create_file_structure <- function(project_root){

    if (dir.exists(project_root)) {
        stop("Directory Already Exists")
    } else {
        dir.create(project_root, recursive = TRUE)
    }

    # Create folders for raw, exeternal intermediate and proccesd data.
    dir.create(file.path(project_root, "data/external"), recursive = TRUE)
    dir.create(file.path(project_root, "data/raw"), recursive = TRUE)
    dir.create(file.path(project_root, "data/interim"), recursive = TRUE)
    dir.create(file.path(project_root, "data/processed"), recursive = TRUE)

    # Create other top level directories
    dir.create(file.path(project_root, "docs"))
    dir.create(file.path(project_root, "models"))
    dir.create(file.path(project_root, "notebooks"))
    dir.create(file.path(project_root, "references"))

    # Create report Directory
    dir.create(file.path(project_root, "reports/figures"), recursive = TRUE)

    # Create Directory for source code.
    dir.create(file.path(project_root, 'src/R'), recursive = TRUE)
    dir.create(file.path(project_root, 'src/man'), recursive = TRUE)
    dir.create(file.path(project_root, 'src/tests/testthat'), recursive = TRUE)

    if (rstudioapi::isAvailable()) {
        usethis:::use_rstudio()
    }

}

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
}

copy_template <- function(path, template, data=list()){
    template_path <- fs::path_package('usethis', 'templates', template)
    template_text = readLines(template_path)
    writeLines(whisker::whisker.render(template_text, data), path)
}
