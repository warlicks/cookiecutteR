context("Check that CI Files Are Created Correctly")

test_directory <- fs::path_expand(file.path("~", 'ci_files'))
remote  <- 'git@github.com:fake/fake.git'

# Create directory
if (dir.exists(test_directory)) {
    unlink(test_directory, recursive = TRUE)
}
cookiecutteR:::create_file_structure(test_directory, FALSE)
cookiecutteR:::enable_git(test_directory, TRUE, remote)
usethis::proj_set(test_directory, force = TRUE)

test_that("Check Creation Of None", {
    skip("Need to rethink")
    cookiecutteR:::create_ci_configs(test_directory, c("None"), remote)
    expect_equal(length(list.files(test_directory)), 0)
})

test_that("Check Creation Of Travis and Appveoyr", {
    cookiecutteR:::create_ci_configs(test_directory,
                                     c('Travis CI', 'AppVeyor'),
                                     remote)
    expect_equivalent(list.files(test_directory,
                                 all.files = TRUE,
                                 pattern = '.yml'),
                      c('.travis.yml', 'appveyor.yml')
                      )
})

test_that("Check Creation Of Gitlab", {
    cookiecutteR:::create_ci_configs(test_directory, c('Gitlab CI'), remote)
    expect_true('.gitlab-ci.yml' %in% list.files(test_directory,
                                                 all.files = TRUE)
                )
})

test_that("Check Creation Of Jenkins", {
    cookiecutteR:::create_ci_configs(test_directory, c('Jenkins'), remote)
    expect_true('Jenkinsfile' %in% list.files(test_directory))
})

test_that("Check Creation Of circleci", {
    cookiecutteR:::create_ci_configs(test_directory, c('Circle CI'), remote)
    expect_equal(list.files(file.path(test_directory, '.circleci')),
                 c('config.yml'))
})

unlink(test_directory, recursive = TRUE, force = TRUE)
