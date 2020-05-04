enable_git <- function(project_root, choice, remote){
    assertthat::assert_that(system("which git", ignore.stdout = TRUE) == 0,
                            msg = 'git is not installed')
    if (choice) {
        git2r::init(project_root)

        if (remote != "")
            git2r::remote_add(project_root, name = 'origin', remote)
    } else {
        invisible()
    }
}
