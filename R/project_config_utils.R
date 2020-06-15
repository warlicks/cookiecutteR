
project_config <- function(config_list=NULL){
    if (is.null(config_list)) {

        renv_status <- utils::select.list(c(TRUE, FALSE),
                                          preselect = FALSE,
                                          title = 'Check if Project Name is A Valid CRAN Name')

        project_description <- readline("Project Description: ")
        author <- readline("Your Name (Company/Organization/Team): ")

        dir_name <- gsub(' ', '_', tolower(project_name))
        dir_name <- gsub('"', '', dir_name)

        selected_license <- utils::select.list(c("MIT",
                                                 "Apache 2.0",
                                                 "GPL V3",
                                                 "AGPL V3",
                                                 "LGPL V3",
                                                 "CCBY 4.0",
                                                 "CC0",
                                                 "No License File"),
                                               title = 'Select A License')

        git_status <- utils::select.list(c(TRUE, FALSE),
                                          title = "Enable A git repo?")

        set_git_remote <- readline("Add Remote Repository [Enter for no remote]: ")

        selected_ci <- utils::select.list(c('Travis CI', 'GitHub Actions',
                                            'Gitlab CI', 'Jenkins',
                                            'Circle CI', 'AppVeyor',
                                            'None'),
                                          title = "Select A Continious Intergration",
                                          multiple = TRUE
                                          )

        renv_status <- utils::select.list(c(TRUE, FALSE),
                                          title = 'Use renv for pacakge managment?')


        return(list(#project_name = project_name,
                    #dir_name = dir_name,
                    project_description = project_description,
                    author = author,
                    selected_license = selected_license,
                    git_status = git_status,
                    set_git_remote = set_git_remote,
                    selected_ci = selected_ci,
                    renv_status = renv_status)
        )
    }

    else {
        return(config_list)
    }

}
