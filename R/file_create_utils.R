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

    # Create a Rstudio project
    if (rstudioapi::isAvailable()) {
        rstudioapi::initializeProject(path = project_root)
    } else {
        file.create(file.path(project_root,
                              paste(basename(project_root), ".Rproj", sep = "")
        )
        )
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

    usethis::ui_done("Directory Structure Created")

}
