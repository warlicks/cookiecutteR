# This test should be run interactively. Directory should be the
# root of the package

devtools::load_all(".")
library(testthat)

# Project config to use:
# creation_test
# "unit test for creation"
# "Me"
# 1 (MIT)
# 1 Enable Git
# "fake.git"
# 1 (Travis CI), 6 (AppVeyor)
# 1 Enable renv
create_new_project("~/Documents/")

#
context("Test That The Project Directory is Created")

# Set Up For Test
expected_structure <- c("","data", "data/external", "data/interim",
                        "data/processed", "data/raw", "docs", "models",
                        "notebooks", "references", "reports", "reports/figures",
                        "src", "src/R", "src/man", "src/tests", "src/tests/testthat")

test_that('Check that file directory matches expected directory', {
    # File Structure is right
    expect_true(dir.exists(file.path("~/Documents/creation_test", "data")))
    expect_true(dir.exists(file.path("~/Documents/creation_test", "data/external")))
    expect_true(dir.exists(file.path("~/Documents/creation_test", "data/interim")))
    expect_true(dir.exists(file.path("~/Documents/creation_test", "data/processed")))
    expect_true(dir.exists(file.path("~/Documents/creation_test", "data/raw")))
    expect_true(dir.exists(file.path("~/Documents/creation_test", "docs")))
    expect_true(dir.exists(file.path("~/Documents/creation_test", "models")))
    expect_true(dir.exists(file.path("~/Documents/creation_test", "notebooks")))
    expect_true(dir.exists(file.path("~/Documents/creation_test", "references")))
    expect_true(dir.exists(file.path("~/Documents/creation_test", "reports/figures")))
    expect_true(dir.exists(file.path("~/Documents/creation_test", "src/man")))
    expect_true(dir.exists(file.path("~/Documents/creation_test", "src/R")))
    expect_true(dir.exists(file.path("~/Documents/creation_test", "src/tests/testthat")))

    # Git is set up
    expect_true(git2r::in_repository("~/Documents/creation_test"))
    expect_equal(git2r::remote_url("~/Documents/creation_test"), "fake.git")
    expect_true(file.exists(file.path("~/Documents/creation_test", '.gitignore')))

    # CI Configs
    expect_true(file.exists(file.path("~/Documents/creation_test", ".travis.yml")))
    expect_true(file.exists(file.path("~/Documents/creation_test", "appveyor.yml")))

    # License FIle
    expect_equal(readLines(file.path("~/Documents/creation_test/", 'LICENSE.md'))[1], '# MIT License')

    # Make
    expect_true(file.exists(file.path("~/Documents/creation_test", "Makefile")))

    # revn
    expect_true(file.exists(file.path("~/Documents/creation_test", "renv/activate.R")))
    expect_true(dir.exists(file.path("~/Documents/creation_test", "renv/library")))
    }
)
