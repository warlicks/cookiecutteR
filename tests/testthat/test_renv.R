context("Test that renv is set up")

# Set up paths
test_directory <- file.path("..", "test_files", "renv_files")
# Create directory

if (dir.exists(test_directory)) {
    unlink(test_directory, recursive = TRUE)
}
dir.create(test_directory, recursive = TRUE)
full_test_path <- normalizePath(test_directory)

cookiecutteR:::enable_renv(test_directory, TRUE)

test_that('Check that renv files are created', {
    expect_true(file.exists(file.path(full_test_path, "renv", "activate.R")))
    expect_true(dir.exists(file.path(full_test_path, "renv", "library")))

})

unlink(test_directory, recursive = TRUE)
