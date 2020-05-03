context("Check that the correct license file is created")

# Setup environment for tests

    # Set up paths
    file_path <- file.path("..", "test_files","license_dir")
    author <- "Ford Prefect"
    license_md <- file.path(file_path, "LICENSE.md")

    # Create directory
    if (dir.exists(file_path)) {
        unlink(file_path, recursive = TRUE)
    }
    dir.create(file_path)



test_that("MIT Licnese Created", {
    cookiecutteR:::create_license_file(file_path, "MIT", author)
    expect_equal(readLines(license_md)[1], '# MIT License')
    })

test_that("AGPL LICENSE Created", {
    cookiecutteR:::create_license_file(file_path, "AGPL V3", author)
    expect_equal(readLines(license_md)[1], 'GNU Affero General Public License')
})

test_that("Apache LICENSE Created", {
    cookiecutteR:::create_license_file(file_path, "Apache 2.0", author)
    expect_equal(readLines(license_md)[1], 'Apache License')
})

test_that("Creative Commons Created", {
    cookiecutteR:::create_license_file(file_path, "CC0", author)
    expect_equal(readLines(license_md)[1], '## creative commons')
})

test_that("Creative Commons Atribution", {
    cookiecutteR:::create_license_file(file_path, "CCBY 4.0", author)
    expect_equal(readLines(license_md)[1], 'Attribution 4.0 International')
})

test_that("GPL Creation", {
    cookiecutteR:::create_license_file(file_path, "GPL V3", author)
    expect_equal(readLines(license_md)[1], 'GNU General Public License')
})

test_that("LGPL Creation", {
    cookiecutteR:::create_license_file(file_path, "LGPL V3", author)
    expect_equal(readLines(license_md)[1], '### GNU LESSER GENERAL PUBLIC LICENSE')
})
