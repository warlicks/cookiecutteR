context("Test Git Enabled")

# Create
test_directory <- file.path("~", "test_files", 'git_repo')

if (dir.exists(test_directory)) {
    unlink(test_directory, recursive = TRUE)
}
dir.create(test_directory, recursive = TRUE)

test_that("Test Git Not Enabled", {
    cookiecutteR:::enable_git(test_directory, FALSE, "")
    expect_false(git2r::in_repository(test_directory))
})

test_that("Test Git Enabled", {
    cookiecutteR:::enable_git(test_directory, TRUE, "")
    expect_true(git2r::in_repository(test_directory))
    expect_equal(length(git2r::remote_url(test_directory)), 0)
    expect_true(file.exists(file.path(test_directory, '.gitignore')))
})

test_that("Test Git Remote Set", {
    cookiecutteR:::enable_git(test_directory, TRUE, "fake.git")
    expect_true(git2r::in_repository(test_directory))
    expect_equal(git2r::remote_url(test_directory), "fake.git")
    expect_true(file.exists(file.path(test_directory, '.gitignore')))
})

test_that("Github URL recognized", {
    expect_false(cookiecutteR:::is_github(""))
    expect_true(cookiecutteR:::is_github("https://github.com/warlicks/cookiecutteR"))
    expect_true(cookiecutteR:::is_github("https://github.com/warlicks/cookiecutteR.git"))
    expect_true(cookiecutteR:::is_github("git@github.com:warlicks/cookiecutteR.git"))
    expect_false(cookiecutteR:::is_github("https://gitlab.com/fake/fake_reop"))
    expect_false(cookiecutteR:::is_github("https://gitlab.com/fake/fake_repo.git"))
    expect_false(cookiecutteR:::is_github("git@gitlab.com:fake/fake_repo.git"))

})

unlink(file.path("~", "test_files"), recursive = TRUE, force = TRUE)
