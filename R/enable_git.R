#' Enable a git repository
#'
#' An internal method for initalizing a git repository and adding a
#' remote origin. For internal use. Users should call
#' \code{\link[git2r]{init}} directly instead.
#'
#' @param project_root root directory for the project being created
#' @param choice the choice selected interactively when
#'     \code{\link{create_new_project}} is called
#' @param remote the url of the remote orign.
#'
#' @keywords  internal
#'
enable_git <- function(project_root, choice, remote){
    assertthat::assert_that(system("which git", ignore.stdout = TRUE) == 0,
                            msg = 'git is not installed')
    if (choice) {
        git2r::init(project_root)

        if (remote != "") {
            git2r::remote_add(project_root, name = 'origin', remote)
            usethis::ui_info(paste('Remote set:', remote, sep = ' '))
        }

        # Add ignore file
        create_git_ignore(project_root)
        usethis::ui_done('Git repo initialized')

    } else {
        invisible()
    }
}

create_git_ignore <- function(path){
    ignore_file_path <- file.path(path, ".gitignore")
    writeLines(c(".Rproj.user", ".Rhistory", ".Rdata", ".DS_Store"),
               ignore_file_path)
    usethis::ui_info('.gitignore file created')
}
