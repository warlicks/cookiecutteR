context("Test Other Files Created")

test_directory <- file.path("..", 'test_files', 'other_files')
if (dir.exists(test_directory)) {
    unlink(test_directory, recursive = TRUE)
}
dir.create(test_directory, recursive = TRUE)

test_that('Check MakeFile Exists',{
          cookiecutteR:::create_makefile(test_directory)
          expect_true("Makefile" %in% list.files(test_directory))
})

test_that('Here File Exists', {
    cookiecutteR:::create_here_file(test_directory)
    expect_true(file.exists(file.path(test_directory, '.here')))
})

unlink(test_directory, recursive = TRUE)
