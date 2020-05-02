
project_config <- function(config_list=NULL){
    if (is.null(config_list)) {
        project_name <- readline("Project Name: ")
        dir_name <- gsub(' ', '_', tolower(project_name))
        project_description <- readline("Project Description: ")
        author <- readline("Your Name (Company/Organization/Team): ")
        selected_license <- select.list(c("MIT", "BSD-3-Clause", "No license file"),
                                        title='Select A License',
                                        preselect = "MIT")
        git_status <- select.list(c("Yes", "NO"), title = "Enable A git repo?", preselect = "Yes")
        selected_ci <- select.list(c('Travis CI', 'GitHub Actions', 'Gitlab CI',
                                     "Jenkins", "Circle CI", " AppVeyor", "NULL"),
                                   title = "Select A Continious Intergration",
                                   preselect = "GitHub Actions"
        )

        return(list(project_name = project_name,
                    dir_name = dir_name,
                    project_description = project_description,
                    author = author,
                    selected_license = selected_license,
                    git_status = git_status,
                    selected_ci = selected_ci)
        )
    }

    else {
        return(config_list)
    }

}
