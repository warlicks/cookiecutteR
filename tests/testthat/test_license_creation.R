context("Check that the correct license file is created")

# Setup environment for tests

# Set up paths
file_path <- file.path("~", "Documents", "license_dir")
author <- "Ford Prefect"


# Create directory
if (dir.exists(file_path)) {
    unlink(file_path, recursive = TRUE)
}


# MIT CHECK --
usethis::proj_set(file_path, force = TRUE)
usethis::ui_silence(usethis::create_package(file_path,
                                            check_name = FALSE,
                                            open = FALSE))

# Run Test
test_that("MIT Licnese Created", {

    cookiecutteR:::create_license_file(file_path, "MIT", author)
    expect_equal(readLines(file.path(file_path, 'LICENSE.md'))[1],
                 '# MIT License')
})

# Create directory
if (dir.exists(file_path)) {
    unlink(file_path, recursive = TRUE, force = TRUE)
}

# AGPL ----

# Create Project
usethis::ui_silence(usethis::create_package(file_path,
                                            check_name = FALSE,
                                            open = FALSE))

test_that("AGPL LICENSE Created", {
    cookiecutteR:::create_license_file(file_path, "AGPL V3", author)
    expect_equal(readLines(file.path(file_path, 'LICENSE.md'))[1],
                 'GNU Affero General Public License')
})

# Destroy directory
if (dir.exists(file_path)) {
    unlink(file_path, recursive = TRUE, force = TRUE)
}

# Apache ----

# Create Project
usethis::ui_silence(usethis::create_package(file_path,
                                            check_name = FALSE,
                                            open = FALSE))

test_that("Apache LICENSE Created", {
    cookiecutteR:::create_license_file(file_path, "Apache 2.0", author)
    expect_equal(readLines(file.path(file_path, 'LICENSE.md'))[1],
                 'Apache License')
})

# Destroy directory
if (dir.exists(file_path)) {
    unlink(file_path, recursive = TRUE, force = TRUE)
}

# Creative Commons ----

# Create Project
usethis::ui_silence(usethis::create_package(file_path,
                                            check_name = FALSE,
                                            open = FALSE))

test_that("Creative Commons Created", {
    cookiecutteR:::create_license_file(file_path, "CC0", author)
    expect_equal(readLines(file.path(file_path, 'LICENSE.md'))[1],
                 '## creative commons')
})

# Destroy directory
if (dir.exists(file_path)) {
    unlink(file_path, recursive = TRUE, force = TRUE)
}

# Creative Commons 2 ----

# Create Project
usethis::ui_silence(usethis::create_package(file_path,
                                            check_name = FALSE,
                                            open = FALSE))

test_that("Creative Commons Atribution", {
    cookiecutteR:::create_license_file(file_path, "CCBY 4.0", author)
    expect_equal(readLines(file.path(file_path, 'LICENSE.md'))[1],
                 'Attribution 4.0 International')
})

# Destroy directory
if (dir.exists(file_path)) {
    unlink(file_path, recursive = TRUE, force = TRUE)
}

# GPL ----

# Create Project
usethis::ui_silence(usethis::create_package(file_path,
                                            check_name = FALSE,
                                            open = FALSE))

test_that("GPL Creation", {
    cookiecutteR:::create_license_file(file_path, "GPL V3", author)
    expect_equal(readLines(file.path(file_path, 'LICENSE.md'))[1],
                 'GNU General Public License')
})

# Destroy directory
if (dir.exists(file_path)) {
    unlink(file_path, recursive = TRUE, force = TRUE)
}

# LGPL ----

# Create Project
usethis::ui_silence(usethis::create_package(file_path,
                                            check_name = FALSE,
                                            open = FALSE))

test_that("LGPL Creation", {
    cookiecutteR:::create_license_file(file_path, "LGPL V3", author)
    expect_equal(readLines(file.path(file_path, 'LICENSE.md'))[1],
                 '### GNU LESSER GENERAL PUBLIC LICENSE')
})


# Final Teardown
unlink(file_path, recursive = TRUE, force = TRUE)
