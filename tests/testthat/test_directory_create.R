library(testthat)

context("Test That The Project Directory is Created")

# Set Up For Test
expected_structure <- c("","data", "data/external", "data/interim",
                        "data/processed", "data/raw", "docs", "models",
                        "notebooks", "references", "reports", "reports/figures",
                        "src", "src/R", "src/man", "src/tests", "src/tests/testthat")
# Create New Project
test_dir <- file.path("..", "test_files", "test_project")

# Clean UP From Past Tests.
if (dir.exists(test_dir)) {
    unlink(test_dir, recursive = TRUE, force = TRUE)
    }
cookiecutteR:::create_file_structure(test_dir)

# Run the Test
test_that('Check that file directory matches expected directory',
    expect_equivalent(list.dirs(test_dir, full.names = FALSE), expected_structure)
)

test_that("An error occurs if we try to create the directory again",
    expect_error(cookiecutteR:::create_file_structure(test_dir)
                 )
    )

# Clean Up
unlink(test_dir, recursive = TRUE, force = TRUE)

