# This test should be run interactively. Directory should be the
# root of the package

devtools::load_all(".")


project_path <- "~/Documents/creation_test"
if (dir.exists(project_path)) {
    unlink(project_path, recursive = TRUE, force = TRUE)
}


create_new_project("~/Documents/creation_test")
# Project config to use:
# creation_test
# "unit test for creation"
# "Me"
# 1 (MIT)
# 1 Enable Git
# "github.com/fake/fake.git"
# 1 (Travis CI), 6 (AppVeyor)
# 1 Enable renv


#
library(testthat)
context("Test That The Project Directory is Created")


project_path <- "~/Documents/creation_test"
testthat::test_that('Check that file directory matches expected directory', {
    # File Structure is right
    expect_true(dir.exists(file.path(project_path, "data")))
    expect_true(dir.exists(file.path(project_path, "data/external")))
    expect_true(dir.exists(file.path(project_path, "data/interim")))
    expect_true(dir.exists(file.path(project_path, "data/processed")))
    expect_true(dir.exists(file.path(project_path, "data/raw")))
    expect_true(dir.exists(file.path(project_path, "models")))
    expect_true(dir.exists(file.path(project_path, "notebooks")))
    expect_true(dir.exists(file.path(project_path, "references")))
    expect_true(dir.exists(file.path(project_path, "reports/figures")))
    expect_true(dir.exists(file.path(project_path, "man")))
    expect_true(dir.exists(file.path(project_path, "R")))
    expect_true(dir.exists(file.path(project_path, "tests/testthat")))

    expect_true(file.exists(file.path(project_path, "creation_test.Rproj")))
    # Git is set up
    expect_true(git2r::in_repository(project_path))
    expect_equal(git2r::remote_url(project_path), "github.com/fake/fake.git")
    expect_true(file.exists(file.path(project_path, '.gitignore')))

    # CI Configs
    expect_true(file.exists(file.path(project_path, ".travis.yml")))
    expect_true(file.exists(file.path(project_path, "appveyor.yml")))

    # License FIle
    expect_equal(readLines(file.path("~/Documents/creation_test/",
                                     'LICENSE.md'))[1],
                 '# MIT License')

    # Make
    expect_true(file.exists(file.path(project_path, "Makefile")))

    # Here file
    expect_true(file.exists(file.path(project_path, ".here")))


    # revn
    expect_true(file.exists(file.path(project_path, "renv/activate.R")))
    expect_true(dir.exists(file.path(project_path, "renv/library")))
})

unlink(project_path, recursive = TRUE, force = TRUE)
