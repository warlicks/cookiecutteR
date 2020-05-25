#' Create project specific library using renv.
#'
#' Intend for internal use only.  If you want to create a proejct library
#' outside of the project set up call \code{\link[renv]{init}} directly. User
#' consents to the creation of renv when selecting the option to enable it.
#'
#' @param project_root root directory for the project being created.
#' @param renv_status a boolean indicating if renv should be utilized. Selected
#' interactively when \code{\link{create_new_project}} is called.
#'
#' @keywords internal
#'

enable_renv <- function(project_root, renv_status){
    if (renv_status) {
        renv::consent(TRUE)
        renv::init(project = normalizePath(project_root),
                   bare = TRUE,
                   restart = FALSE)

        usethis::ui_done('renv enabled')
        usethis::ui_todo('Run `renv::snapshot()` to create & updated lock file.')
    } else{
        invisible()
    }

}
